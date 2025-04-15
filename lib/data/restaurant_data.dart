import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/model/restaurant.dart';

class RestaurantData extends ChangeNotifier {
  List<Restaurant> listRestaurant = [];

  Future<void> getRestaurants() async{

    String jsonString = await rootBundle.loadString('assets/data.json'); 
    Map<String, dynamic> data = json.decode(jsonString);

    List<dynamic> restaurantesData = data['restaurants'];

    for (var rest in restaurantesData) {
      Restaurant restaurant = Restaurant.fromMap(rest);
      listRestaurant.add(restaurant);
    }
  }
}