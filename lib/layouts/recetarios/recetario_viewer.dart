import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nutricion/controllers/panel_controller.dart';
import 'package:get/route_manager.dart';

class RecetarioViewer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PanelController>(
      init: PanelController(),
      builder: (_){
        List document = Get.arguments;
        return Scaffold(
          appBar: GradientAppBar(
            gradient: LinearGradient(
                colors: [HexColor('#ac5a65'), HexColor('#771929')]
            ),
            title: Text(document[0]),
          ),
          body: PDF().cachedFromUrl(
             'https://www.nutricion.caitec.mx//recursos/recetarios/'+document[1],
             placeholder: (progress) => Center(child: Text('$progress %')),
             errorWidget: (error) => Center(child: Text(error.toString())),
           ),
        );
      }
    );
  }
}