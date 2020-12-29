import 'package:flutter/material.dart';
import 'package:nutricion/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashScreenController(),
      builder: (_)=> Scaffold(
        body: Center(
          child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset('assets/logopen.png',height: 250, width: 250,),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xAAA02837)),
                      ),
                  ),
                ]
            ),
        )
      )
    );
  }
}


