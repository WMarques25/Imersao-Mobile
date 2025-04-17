## Navigator
`lib/ui/splash/splash_screen.dart`
```dart
ElevatedButton(
	onPressed: () {
		Navigator.pushReplacement(context, // Classe que substitui as telas
			MaterialPageRoute(builder: (context) { // Rota para a troca de tela
				return HomeScreen(); // Cria a Proxima tela.
		})
	);
},)
```
---
## HomeScreen
`lib/ui/home/home_screen.dart`
- Classe criada para a tela principal.
- Existe campos do Scaffold proprios para Drawer e AppBar
-  Widgets Novos:
	- Drower -> Menu lateral com implementação pronta. 
	- AppBar -> Barra superior (padrão), possui List de actions.
	- IconButton -> Botão criado em um icone. {icon, onPressed}
	- SingleChildScrollView -> Container com rolagem, apenas um elemento. possibilita definir rolagem horizontal.
```dart
Text("Escolha por Categoria"),
SingleChildScrollView( // Container com Rolagem
	scrollDirection: Axis.horizontal, // Definição do eixo da rolagem
	child: Row(
		spacing: 10.0,
		children: List.generate( // Gerar List com parametros
			CategoriesData.categories.length, // Tamanho da lista gerada
			(index){  // Lambda de geração, index = for i...
				return CategoryWidget(  // Widget Criado a seguir
					category: CategoriesData.categories[index]); // Buscando dados de uma Lista.
			}
		),
	),
),
```
---
## CategoriesData
`lib/data/categories_data.dart`
```dart
abstract class CategoriesData {
	static List<String> categories = [
		"Petiscos", "Principais", "Massas", "Sobremesas", "Bebidas"
	];
}
```
---
## CategoryWidget
`lib/ui/home/widgets/category_widget.dart`
```dart
class CategoryWidget extends StatelessWidget {
	final String category; // Add campo para utilizar no widget.
	const CategoryWidget({super.key, required this.category}); // Att construtor
	
	@override
	Widget build(BuildContext context) {
		return Container( // Definição da caixa externa
			width: 100, height: 100,
			decoration: BoxDecoration(
				color: AppColors.lightBgColor,
				borderRadius: BorderRadius.circular(12),
			)
...

		Image.asset("assets/categories/${category.toLowerCase()}.png", // $ permite usar variavel na String, ${} abre um bloco de codigo para montar a String
```
---
## Restaurant
`lib/model/restaurant.dart`
Classe Model representando um Restaurante.
```dart
class Restaurant {
	String id;
	String imagePath;
	String name;
	String description;
	double stars;
	int distance;
	List<String> categories;

	Restaurant({...}) // Construtor

	Map<String, dynamic> toMap(){ // dynamic = any -> gera um Map
		return {
			'id': id,
			'imagePath': imagePath,
			'name': name,
			'description': description,
			'stars': stars,
			'distance': distance,
			'categories': categories,
		};
	}

	factory Restaurant.fromMap(Map<String, dynamic> map){ //Parse JSON -> MAP -> Clase
		return Restaurant(
			id: map['id'],
			imagePath: map['imagePath'],
			name: map['name'],
			description: map['description'],
			stars: map['stars'],
			distance: map['distance'],
			categories: (map['categories'] as List<dynamic>).cast<String>() // Add cast para corrigir erro.
		);
	}
}
```
---
## RestaurantData
`lib/data/restaurant_data.dart`
```dart
import 'dart:convert';  // Usado para o rootBundle, json.decode

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/model/restaurant.dart';
class RestaurantData extends ChangeNotifier {
	List<Restaurant> listRestaurant = [];
	
	Future<void> getRestaurants() async{ // Metodo Asincrono, retorna Future igual Java	  
		String jsonString = await rootBundle.loadString('assets/data.json'); // Espera o carregamento do arquivo para continuar
		Map<String, dynamic> data = json.decode(jsonString); // transforma o JSON em um Map
		List<dynamic> restaurantesData = data['restaurants'];
		  
		for (var rest in restaurantesData) {
			Restaurant restaurant = Restaurant.fromMap(rest);
			listRestaurant.add(restaurant); // Add na lista global
		}
	}
}
```
---
## RestaurantWidget
`lib/ui/home/widgets/restaurant_widget.dart`
#### Mesmo de [CategoryWidget](#CategoryWidget)

---
## Mudanças no Main
`lib/main.dart`
```dart
void main() async{
	WidgetsFlutterBinding.ensureInitialized(); // Garante a espera pelos dados
	RestaurantData restData = RestaurantData(); 
	await restData.getRestaurants(); // Carrega dados dos restaurantes
	
	runApp(MultiProvider( // Provedores
		providers: [
			ChangeNotifierProvider(create: (context){ // Troca no retorno da espera
				return restData;
			})
		],
		child: MyApp(),
	));
}
```
---
