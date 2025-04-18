import 'package:flutter/material.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:myapp/ui/_core/app_theme.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/_core/count_provider.dart';
import 'package:myapp/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restData = RestaurantData();
  await restData.getRestaurants();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context){
        return restData;
      }),
      ChangeNotifierProvider(create: (context) => BagProvider(),),
      ChangeNotifierProvider(create: (context) => CountProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          home: SplashScreen()
        );
    }
}

