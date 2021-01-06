import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class Rutina extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List document = Get.arguments;
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [HexColor('#ac5a65'), HexColor('#771929')]
        ),
        title: Text(document[0]),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: document[2],
          itemBuilder: (BuildContext ctxt, int index){
            return Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/placeholder.gif'),
                image: CacheImage('https://www.nutricion.caitec.mx/recursos/${document[1]}/${index + 1}.jpg')
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            );
          },
        )
      ),
    );
  }
}