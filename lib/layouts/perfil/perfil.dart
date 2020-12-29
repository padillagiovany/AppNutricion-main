import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nutricion/controllers/profile_controller.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_){
        return Scaffold(
          appBar: GradientAppBar(
            gradient: LinearGradient(
                colors: [HexColor('#ac5a65'), HexColor('#771929')]
            ),
            title: Text('Perfil'),
          ),
        );
      });
  }
}