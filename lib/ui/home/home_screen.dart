import 'package:flutter/material.dart';
import 'package:myapp/data/categories_data.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/widgets/app_bar.dart';
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
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Center(
                heightFactor: 1.5,
                child: Image.asset('assets/logo.png', width: 187),
              ),
              Text("Boas-vindas!", style: TextStyle(fontSize: 24)),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.search_sharp),
                  label: Text(
                    "O que você quer comer?",
                    style: TextStyle(fontSize: 18),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              Text("Escolha por Categoria", style: TextStyle(fontSize: 18)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10.0,
                  children: List.generate(CategoriesData.categories.length, (
                    index,
                  ) {
                    return CategoryWidget(
                      category: CategoriesData.categories[index],
                    );
                  }),
                ),
              ),
              Image.asset("assets/banners/banner_promo.png"),
              Text("Bem Avaliados"),
              Column(
                spacing: 16,
                children: List.generate(restData.listRestaurant.length, (
                  index,
                ) {
                  Restaurant rest = restData.listRestaurant[index];
                  return RestaurantWidget(restaurant: rest);
                }),
              ),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
