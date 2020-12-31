import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nutricion/controllers/citas_controller.dart';
import 'package:nutricion/models/notification_model.dart';

class Citas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      id: 'notificaciones',
      init: NotificationsController(),
      builder: (_){
        if(_.status){
          return Scaffold(
            appBar: GradientAppBar(
              gradient: LinearGradient(
                  colors: [HexColor('#ac5a65'), HexColor('#771929')]
              ),
              title: Text('Mis Citas'),
            ),
            body: ListView.builder(
              itemCount: _.notifications.length,
              itemBuilder: (context, index){
                final NotificationModel notificationModel = _.notifications[index];
                _.notificationSchedule(notificationModel.fechaCita, notificationModel.horaNotificacion, index, notificationModel.notas);
                return ListTile(
                  trailing: Icon(Icons.schedule_rounded),
                  title: Text(notificationModel.notas),
                  subtitle: Text(notificationModel.fechaCita),
                );
              },
            ),
          );
        }else{
          return Scaffold(
            appBar: GradientAppBar(
              gradient: LinearGradient(
                  colors: [HexColor('#ac5a65'), HexColor('#771929')]
              ),
              title: Text('Mis Citas'),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        
      },
    );
  }
}