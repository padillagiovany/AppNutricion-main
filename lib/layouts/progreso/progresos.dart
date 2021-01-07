import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:nutricion/controllers/progreso_controller.dart';
import 'package:nutricion/layouts/progreso/registrarProgreso.dart';
import 'package:nutricion/models/progress_model.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:status_alert/status_alert.dart';
import 'package:toggle_bar/toggle_bar.dart';

class Progresos extends StatelessWidget {
  List<String> labels = ["Mi progreso", "Nuevo progreso"];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProgresoController>(
      id: 'progreso',
      init: ProgresoController(),
      builder: (_) {
        if (_.progresoStatus) {
          if (_.statusP) {
            return Scaffold(
              appBar: GradientAppBar(
                gradient: LinearGradient(
                    colors: [HexColor('#ac5a65'), HexColor('#771929')]),
                title: Text('Progresos'),
                actions: [
                  IconButton(
                    icon: Icon(Icons.refresh_rounded),
                    onPressed: () {
                      _.loadProgress();
                    },
                  )
                ],
              ),
              body: ListView.builder(
                itemCount: _.progreso.length,
                itemBuilder: (context, index) {
                  final PacienteProgreso pacienteModel = _.progreso[index];
                  return Column(
                    children: [
                      SizedBox(
                          height: 25,
                        ),
                      Text(pacienteModel.fechaProgreso),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          color: HexColor('#ac5a65'),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "PESO: " + pacienteModel.peso,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      "CINTURA: " + pacienteModel.cintura,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      "CADERA: " + pacienteModel.cadera,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      "BRAZO: " + pacienteModel.brazo,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      "IMC: " + pacienteModel.imc,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      "GRASA: " + pacienteModel.grasa,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Text(
                                      "MÚSCULO: " + pacienteModel.musculo,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                  ;
                },
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Get.to(RegistrarProgreso());
                },
              ),
            );
          } else {
            return Scaffold(
              appBar: GradientAppBar(
                gradient: LinearGradient(
                    colors: [HexColor('#ac5a65'), HexColor('#771929')]),
                title: Text('Progresos'),
              ),
              body: Center(
                  child: CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Color(0xAAA02837)),
              )),
            );
          }
        } else {
          if (_.statusP) {
            return Scaffold(
              appBar: GradientAppBar(
                gradient: LinearGradient(
                    colors: [HexColor('#ac5a65'), HexColor('#771929')]),
                title: Text('Progresos'),
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
                    Text(
                        'Al registrarse una cita la app te notificará unas horas antes.'),
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
                          _.loadProgress();
                        },
                        child: Text(
                          'VOLVER A CARGAR',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Arial',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Get.to(RegistrarProgreso());
                },
              ),
            );
          } else {
            return Scaffold(
              appBar: GradientAppBar(
                gradient: LinearGradient(
                    colors: [HexColor('#ac5a65'), HexColor('#771929')]),
                title: Text('Progresos'),
              ),
              body: Center(
                  child: CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Color(0xAAA02837)),
              )),
            );
          }
        }
      },
    );
  }

  void message(context, title, message, icon, seconds) {
    StatusAlert.show(
      context,
      duration: Duration(seconds: seconds),
      title: title,
      subtitle: message,
      configuration: IconConfiguration(icon: icon),
    );
  }

  InputDecoration decoracion(String hint) {
    return InputDecoration(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1.6),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.3),
      ),
      hintText: hint,
    );
  }
}
