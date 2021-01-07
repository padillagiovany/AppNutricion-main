import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nutricion/controllers/progreso_controller.dart';
import 'package:nutricion/layouts/progreso/progresos.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:status_alert/status_alert.dart';

class RegistrarProgreso extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _peso = TextEditingController();
  final TextEditingController _cintura = TextEditingController();
  final TextEditingController _cadera = TextEditingController();
  final TextEditingController _brazo = TextEditingController();
  final TextEditingController _imc = TextEditingController();
  final TextEditingController _grasa = TextEditingController();
  final TextEditingController _musculo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProgresoController>(
        id: 'progreso',
        init: ProgresoController(),
        builder: (_) {
          return Scaffold(
            appBar: GradientAppBar(
              gradient: LinearGradient(
                  colors: [HexColor('#ac5a65'), HexColor('#771929')]),
              title: Text('Progresos'),
            ),
            body: Center(
              child: ListView(
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Flexible(
                              child: new TextFormField(
                                controller: _peso,
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: decoracion('Ingresa Peso'),
                                validator: (input) => input == ''
                                    ? 'Llena el campo con un número'
                                    : null,
                              ),
                            ),
                            Container(
                              width: 16,
                            ),
                            new Flexible(
                              child: new TextFormField(
                                controller: _cintura,
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: decoracion('Ingresa Cintura'),
                                validator: (input) => input == ''
                                    ? 'Llena el campo con un número'
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Flexible(
                              child: new TextFormField(
                                controller: _cadera,
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: decoracion('Ingresa Cadera'),
                                validator: (input) => input == ''
                                    ? 'Llena el campo con un número'
                                    : null,
                              ),
                            ),
                            Container(
                              width: 16,
                            ),
                            new Flexible(
                              child: new TextFormField(
                                controller: _brazo,
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: decoracion('Ingresa Brazo'),
                                validator: (input) => input == ''
                                    ? 'Llena el campo con un número'
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Flexible(
                              child: new TextFormField(
                                controller: _imc,
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: decoracion('Ingresa IMC'),
                                validator: (input) => input == ''
                                    ? 'Llena el campo con un número'
                                    : null,
                              ),
                            ),
                            Container(
                              width: 16,
                            ),
                            new Flexible(
                              child: new TextFormField(
                                controller: _grasa,
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: decoracion('Ingresa % Grasa'),
                                validator: (input) => input == ''
                                    ? 'Llena el campo con un número'
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Flexible(
                              child: new TextFormField(
                                controller: _musculo,
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: decoracion('Ingresa % Músculo'),
                                validator: (input) => input == ''
                                    ? 'Llena el campo con un número'
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ProgressButton(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          strokeWidth: 3,
                          color: Color(0xAAA02837),
                          child: Text(
                            "Registrarme",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                          onPressed: (controller) async {
                            if (!controller.isAnimating) {
                              controller.forward();
                              if (_peso.text == "" ||
                                  _cintura.text == "" ||
                                  _cadera.text == "" ||
                                  _brazo.text == "" ||
                                  _imc.text == "" ||
                                  _grasa.text == "" ||
                                  _musculo.text == "") {
                                _formKey.currentState.validate();
                                message(context, 'Atención',
                                    'Tienes campos vacios', Icons.warning, 2);
                                controller.reverse();
                              } else {
                                Get.dialog(
                                  AlertDialog(
                                    title: Text(
                                        "Se registrarán los siguientes datos"),
                                    content: Container(
                                      height: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("Peso: ${_peso.text}",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "Cintura: ${_cintura.text}",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "Cadera: ${_cadera.text}",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "Brazo: ${_brazo.text}",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("IMC: ${_imc.text}",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "% Grasa: ${_grasa.text}",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "% Músculo: ${_musculo.text}",
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
                                            "key": 1,
                                            "id": _.profile[0],
                                            "email": _.profile[4],
                                            "peso": _peso.text,
                                            "cintura": _cintura.text,
                                            "cadera": _cadera.text,
                                            "brazo": _brazo.text,
                                            "imc": _imc.text,
                                            "grasa": _grasa.text,
                                            "musculo": _musculo.text,
                                            "fechaProgreso": DateTime.now()
                                          };
                                          _.sendProgress(post);
                                          await Future.delayed(
                                              const Duration(seconds: 4));

                                          if (_.status != '') {
                                            if (_.status == '404') {
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
                                                  'Se registró tu progreso.',
                                                  Icons.done,
                                                  2);
                                              controller.reverse();
                                              _formKey.currentState.reset();
                                              _peso.clear();
                                              _cintura.clear();
                                              _cadera.clear();
                                              _brazo.clear();
                                              _imc.clear();
                                              _grasa.clear();
                                              _musculo.clear();
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
                      ]),
                    ),
                  )
                ],
              ),
            ),
          );
        });
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
