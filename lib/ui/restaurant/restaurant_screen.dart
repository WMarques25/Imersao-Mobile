import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/_core/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant rest;
  const RestaurantScreen({super.key, required this.rest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context: context, title: rest.name,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              heightFactor: 1.2,
              child: Image.asset("assets/${rest.imagePath}", height: 160),
            ),
            Text(
              "Mais Pedidos",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Column(
              children: List.generate(rest.dishes.length, (index) {
                Dish dish = rest.dishes[index];
                return ListTile(
                  leading: Image.asset(
                    "assets/dishes/default.png",
                    height: 48,
                  ),
                  title: Text(dish.name),
                  subtitle: Text("R\$: ${dish.price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      context.read<BagProvider>().addAllDishes([dish]);
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
