
## Widget
- Todo elemento visual: Telas, componentes..

### Stateless Widget - não muda de estado, sem mudança do componente/tela

### Iniciando Projeto -> main() dart
`/lib/main.dart`
```dart
import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/app_theme.dart';
import 'package:myapp/ui/splash/splash_screen.dart';

void main() { // main() -> inicio do dart.
	runApp(MyApp()); // runApp() -> Flutter | MyApp() -> Widget/Classe propretaria
}

class MyApp extends StatelessWidget { // Stateless -> Widgets estáticos
	const MyApp({super.key});
	
	@override
	Widget build(BuildContext context) { // Metodo de construção padrao de Widget
			return MaterialApp(       // MaterialApp() -> Widget do Google MaterialApp
			theme: AppTheme.appTheme, // Tema proprietário
			home: SplashScreen()      // Classe proprietária da tela inicial
		);
	}
}
```

### SplashScreen -> home de MyApp()
`lib/ui/splash/splash_screen.dart`
```dart
import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/app_colors.dart';

class SplashScreen extends StatelessWidget {
	const SplashScreen({super.key});
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(	// Suporte para criação de telas
			backgroundColor: AppColors.bgColor, // BG com cor do app
			body: Stack(	// Z-index dos itens -> Pilha
				children: [		// Filhos
				Image.asset('assets/banners/banner_splash.png'), // Imagem definida no pubspec.yaml -> assets
				Center( // Div Centralizada
					child: Padding( // Div com margem interna
						padding: const EdgeInsets.symmetric(horizontal: 24.0),	
						child: Image.asset('assets/logo.png', width: 280)
					)
				)
			])		
		);
	}
}
```

### AppColors -> Paleta de Cores do App
`lib/ui/_core/app_colors.dart`
```dart
import 'package:flutter/services.dart';

abstract class AppColors { // Classe Abstrata
	static const Color bgColor = Color(0xFF202123); // Cores Estaticas
	static const Color mainColor = Color(0xFFffa559);
}
```

### AppTheme -> Definição do tema dos Widget
`lib/ui/_core/app_theme.dart`
```dart
import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/app_colors.dart';

abstract class AppTheme {
	static ThemeData appTheme = ThemeData.dark().copyWith( // Copia o tema dark modificando elementos.
		elevatedButtonTheme: ElevatedButtonThemeData( // Define o tema do Widget ElevatedButton
			style: ButtonStyle(
				foregroundColor: WidgetStatePropertyAll(Colors.black),
				backgroundColor: WidgetStateColor.resolveWith((states) { // states -> estados do botao: padrao, hover, pressed...
					if (states.contains(WidgetState.disabled)) {
						return Colors.grey;
					} else if (states.contains(WidgetState.pressed)) {
						return const Color.fromARGB(171, 255, 164, 89);
					}
					return AppColors.mainColor;
				}),
			),
		),
	);
}
```
