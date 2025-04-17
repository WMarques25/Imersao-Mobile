import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/_core/widgets/app_bar.dart';
import 'package:myapp/ui/restaurant/widgets/dish_widget.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant rest;
  const RestaurantScreen({super.key, required this.rest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: rest.name),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                heightFactor: 1,
                child: Image.asset("assets/${rest.imagePath}", height: 160),
              ),
              Text(
                "Mais Pedidos",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,
                color: AppColors.textDestaque),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 18,
                children: List.generate(rest.dishes.length, (index) {
                  Dish dish = rest.dishes[index];
                          
                  return DishWidget(dish: dish);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
