import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, height: 100,
      decoration: BoxDecoration(
        color: AppColors.lightBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8.0,
        children: [
          Image.asset("assets/categories/${category.toLowerCase()}.png", 
            height: 48,),
          Text(
            category,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}