import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class Rutina extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [HexColor('#ac5a65'), HexColor('#771929')]
        ),
        title: Text('Rutina'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 24,
          itemBuilder: (BuildContext ctxt, int index){
            return Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/placeholder.gif'),
                image: CacheImage('https://www.nutricion.caitec.mx//recursos/rutina/${index + 1}.jpg')
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