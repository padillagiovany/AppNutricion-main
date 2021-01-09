import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:nutricion/controllers/citas_controller.dart';
import 'package:nutricion/layouts/citas/nuevaCita.dart';
import 'package:nutricion/models/notification_model.dart';

class Citas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      id: 'notificaciones',
      init: NotificationsController(),
      builder: (_){
        if(_.notificationStatus){
          if(_.status){
            return Scaffold(
              appBar: GradientAppBar(
                gradient: LinearGradient(
                    colors: [HexColor('#ac5a65'), HexColor('#771929')]
                ),
                title: Text('Mis Citas'),
                actions: [
                  IconButton(
                    icon: Icon(Icons.refresh_rounded),
                    onPressed: (){
                      _.loadNotifications();
                    },
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: _.notifications.length,
                itemBuilder: (context, index){
                  final NotificationModel notificationModel = _.notifications[index];
                  _.notificationSchedule(notificationModel.fechaCita, notificationModel.horaNotificacion, index, notificationModel.notas);
                  return ListTile(
                    trailing: _.getNotificationTime(notificationModel.fechaCita) == true 
                      ? Icon(Icons.event_sharp) 
                      : Icon(Icons.event_available),
                    title: Text(notificationModel.notas),
                    subtitle: Text(notificationModel.fechaCita),
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){
                  Get.to(NuevaCita());
                }
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
        }else{
          if(_.status){
            return Scaffold(
                  appBar: GradientAppBar(
                    title: Text('Nutrición Integral'),
                    gradient: LinearGradient(
                        colors: [HexColor('#ac5a65'), HexColor('#771929')]
                    ),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Lottie.asset(
                          'assets/lottiefiles/no_notification.json',
                          height: 210,
                        ),
                        Text(
                          'No tienes citas',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text('Al registrarse una cita la app te notificará unas horas antes.'),
                        Container(
                          height: 10,
                        ),
                        ButtonTheme(
                            minWidth: 200.0,
                            height: 30.0,
                            buttonColor: HexColor('#771929'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: RaisedButton(
                              padding: EdgeInsets.all(10),
                              onPressed: () {
                                _.loadNotifications();
                              },
                              child: Text('VOLVER A CARGAR', style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'Arial',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal
                              ),),
                            ),
                          ),
                      ],
                    ),
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
              body: Center(child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xAAA02837)),
                      )),
            );
          }
        }
      },
    );
  }
}