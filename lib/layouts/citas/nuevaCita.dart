import 'package:fialogs/fialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nutricion/controllers/citas_controller.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:status_alert/status_alert.dart';

class NuevaCita extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nota = TextEditingController();
  final TextEditingController _fecha = TextEditingController();
  final TextEditingController _hora = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      id: 'nuevaCita',
      init: NotificationsController(),
      builder: (_) {
        return Scaffold(
          appBar: GradientAppBar(
            gradient: LinearGradient(
                colors: [HexColor('#ac5a65'), HexColor('#771929')]),
            title: Text('Crear Cita'),
          ),
          body: Center(
            child: ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0),
                        child: TextFormField(
                          controller: _nota,
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: decoracion('Ingresa una nota'),
                          validator: (input) =>
                              input == '' ? 'Llena el campo' : null,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: TextFormField(
                          controller: _fecha,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: decoracion('Ingresa una hora'),
                          keyboardType: TextInputType.text,
                          showCursor: true,
                          readOnly: true,
                          validator: (input) => input == ''
                              ? 'Llena el campo con una hora'
                              : null,
                          onTap: () {
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1950, 3, 5),
                                maxTime: DateTime.now(),
                                theme: DatePickerTheme(
                                  headerColor: Color(0xAAA02837),
                                  backgroundColor: Colors.white,
                                  itemStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  doneStyle: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  cancelStyle: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ), onCancel: () {
                              _fecha.text = '';
                            }, onChanged: (date) {
                              if (date != null) {
                                _fecha.text =
                                    '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:${date.second}';
                              }
                            }, onConfirm: (date) {
                              if (date != null) {
                                _fecha.text =
                                    '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:${date.second}';
                              }
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.es);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: ProgressButton(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          strokeWidth: 3,
                          color: Color(0xAAA02837),
                          child: Text(
                            "Registrar cita",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                          onPressed: (controller) async {
                            if (!controller.isAnimating) {
                              controller.forward();
                              if (_nota.text == "" || _fecha.text == "") {
                                _formKey.currentState.validate();
                                message(context, 'Atención',
                                    'Tienes campos vacios', Icons.warning, 2);
                                controller.reverse();
                              } else {
                                Get.dialog(
                                  AlertDialog(
                                    title: Text("Datos de cita"),
                                    content: Container(
                                      height: 90,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("Nota: ${_nota.text}",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "Fecha: ${_fecha.text}",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () async {
                                          Get.back();
                                          Map<String, dynamic> post = {
                                            "key": 2,
                                            "email": _.user[4],
                                            "nota": _nota.text,
                                            "fecha": _fecha.text
                                          };
                                          _.createCita(post);
                                          await Future.delayed(
                                              const Duration(seconds: 4));

                                          if (_.statusCita != '') {
                                            if (_.statusCita == '404') {
                                              message(
                                                  context,
                                                  'Error',
                                                  'Algo salio mal, intenta de nuevo.',
                                                  Icons.error,
                                                  2);
                                              controller.reverse();
                                            } else {
                                              message(
                                                  context,
                                                  'Registro exitoso',
                                                  'Se registró tu cita.',
                                                  Icons.done,
                                                  2);
                                              controller.reverse();
                                              _formKey.currentState.reset();
                                              _fecha.clear();
                                              _nota.clear();
                                              Get.back();
                                            }
                                          }
                                          controller.reverse();
                                        },
                                        child: Text('ACEPTAR'),
                                      ),
                                      FlatButton(
                                        child: Text("CERRAR"),
                                        onPressed: () {
                                          controller.reverse();
                                          Get.back();
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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

  void message(context, title, message, icon, seconds) {
    StatusAlert.show(
      context,
      duration: Duration(seconds: seconds),
      title: title,
      subtitle: message,
      configuration: IconConfiguration(icon: icon),
    );
  }
}
