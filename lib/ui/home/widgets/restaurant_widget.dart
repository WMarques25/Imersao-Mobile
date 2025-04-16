import 'package:flutter/material.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/restaurant/restaurant_screen.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RestaurantScreen(rest: restaurant);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightBgColor,
          borderRadius: BorderRadius.circular(90),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightBgColor.withAlpha(30),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          spacing: 12.0,
          children: [
            Image.asset('assets/${restaurant.imagePath}', width: 72),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: List.generate(restaurant.stars.toInt(), (index) {
                    return Image.asset('assets/others/star.png', width: 16);
                  }),
                ),
                Text(
                  "${restaurant.distance}km",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
