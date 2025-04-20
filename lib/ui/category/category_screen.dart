import 'package:flutter/material.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/widgets/app_bar.dart';
import 'package:myapp/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    RestaurantData restData = Provider.of<RestaurantData>(context);
    List<Restaurant> rests = [];
    restData.listRestaurant.forEach((r) {
      if (r.categories.contains(category)) {
        rests.add(r);
      }
    });
    return Scaffold(
      appBar: getAppBar(context: context, title: category),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: Column(spacing: 16, children: List.generate(rests.length, (i) {
            Restaurant rest = rests[i];
            return RestaurantWidget(restaurant: rest);
          })),
        ),
      ),
    );
  }
}
