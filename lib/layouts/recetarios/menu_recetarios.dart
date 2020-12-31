import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nutricion/controllers/panel_controller.dart';

class MenuRecetarios extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PanelController>(
      init: PanelController(),
      builder: (_){
        return Scaffold(
          appBar: GradientAppBar(
            gradient: LinearGradient(
                colors: [HexColor('#ac5a65'), HexColor('#771929')]
            ),
            title: Text('Recetarios'),
          ),
          body: ListView(
            children:<Widget>[
              Divider(),
              ListTile(
                title: Text('Recetario General'),
                trailing: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: (){
                    _.viewPDF1();
                  },
                )
              ),
              Divider(),
              ListTile(
                title: Text('Recetario Aguas Frescas'),
                trailing: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: (){
                     _.viewPDF2();
                  },
                )
              ),
              Divider(),
              ListTile(
                title: Text('Recetario Healty'),
                trailing: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: (){
                     _.viewPDF3();
                  },
                )
              ),
            ],
          ),
        );
      }
    );
  }
}