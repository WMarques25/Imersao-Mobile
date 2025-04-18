import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/_core/count_provider.dart';
import 'package:myapp/ui/_core/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class DishScreen extends StatelessWidget {
  final String title;
  final Dish dish;
  const DishScreen({super.key, required this.dish, required this.title});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    CountProvider countProvider = Provider.of<CountProvider>(context);
    countProvider.reset;
    return Scaffold(
      appBar: getAppBar(context: context, title: title),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          spacing: 8,
          children: [
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/dishes/default.png"),
                Text(
                  dish.name,
                  style: TextStyle(
                    color: AppColors.textDestaque,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "R\$ ${dish.price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
                Text(
                  dish.description,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              spacing: 15,

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => countProvider.remove(),
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: AppColors.mainColor,
                    size: 35,
                  ),
                ),
                Text(
                  countProvider.getCount().toString(),
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  onPressed: () => countProvider.add(),
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: AppColors.mainColor,
                    size: 35,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  List<Dish> dishes = List.filled(
                    countProvider.getCount(),
                    dish,
                  );
                  
                  bagProvider.addAllDishes(dishes);
                  countProvider.reset();
                },
                child: Text(
                  "Adicionar",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
