import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricion/layouts/splash_screen.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}