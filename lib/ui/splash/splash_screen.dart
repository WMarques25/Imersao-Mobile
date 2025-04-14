import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          Image.asset('assets/banners/banner_splash.png'),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 32.0,
                children: [
                  SizedBox(height: 200.0),
                  Image.asset('assets/logo.png', width: 192),
                  SizedBox(height: 14.0),
                  Column(
                    children: [
                      Text(
                        "Um parceiro inovador para sua",
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                      Text(
                        "melhor experiência culinária!",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Bora!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
