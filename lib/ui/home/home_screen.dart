import 'package:flutter/material.dart';
import 'package:myapp/data/categories_data.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/home/widgets/category_widget.dart';
import 'package:myapp/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restData = Provider.of<RestaurantData>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: 
          SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              Text("Boas-vindas!"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  
                ),
              ),
              Text("Escolha por Categoria"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10.0,
                  children: List.generate(
                    CategoriesData.categories.length, 
                    (index){
                      return CategoryWidget(
                        category: CategoriesData.categories[index]);
                    }
                  ),
                ),
              ),
              Image.asset("assets/banners/banner_promo.png"),
              Text("Bem Avaliados"),
              Column(
                spacing: 16,
                children: List.generate(restData.listRestaurant.length, 
                (index) {
                  Restaurant rest = restData.listRestaurant[index];
                  return RestaurantWidget(restaurant: rest);
                }),
              ),
              SizedBox(height: 64,),
            ],
          ),
        ),
      ),
    );
  }
}