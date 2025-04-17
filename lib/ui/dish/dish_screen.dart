import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/widgets/app_bar.dart';

class DishScreen extends StatelessWidget {
  final String titulo;
  const DishScreen({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: titulo),
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Image.asset("assets/dishes/default.png"),
            // Text(),
            // Text(),
            // Text(),
            // Row(),
            // ElevatedButton(),
          ],
        ),
      ),
    );
  }
}
