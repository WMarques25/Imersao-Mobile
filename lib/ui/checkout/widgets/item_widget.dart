import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

class ItemWidget extends StatelessWidget {
  final Dish dish;
  const ItemWidget({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.bgCards,
      ),
      child: Row(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.asset(
              "assets/dishes/default.png",
              height: double.infinity,
              alignment: Alignment.topLeft,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 200,
            child: Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  dish.name,
                  style: TextStyle(
                    color: AppColors.textDestaque,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "R\$ ${dish.price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => bagProvider.addAllDishes([dish]),
                  child: Icon(
                    Icons.add_circle_outline,
                    color: AppColors.mainColor,
                  ),
                ),
                Text(
                  bagProvider.getMapByAmount()[dish].toString(),
                  style: TextStyle(fontSize: 18),
                ),
                GestureDetector(
                  onTap: () => bagProvider.removeDish(dish),
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
