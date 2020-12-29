import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nutricion/controllers/signin_controller.dart';
import 'package:nutricion/layouts/login.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:status_alert/status_alert.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  String _nombre,
      _apaterno,
      _amaterno,
      _email,
      _telefono,
      _fecha,
      _pass,
      _forcepass;
  final TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
        id: 'signin',
        init: SignInController(),
        builder: (_) {
          return Scaffold(
            appBar: GradientAppBar(
              title: Text('Registro'),
              gradient: LinearGradient(
                  colors: [HexColor('#ac5a65'), HexColor('#771929')]),
            ),
            body: Center(
              child: Form(
                key: formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children: [
                    logo,
                    title,
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      cursorColor: Color(0xAAA02837),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.3),
                        ),
                        hintText: 'Ingresa tu nombre',
                      ),
                      validator: (input) =>
                          input == '' ? 'Llena el campo con un nombre' : null,
                      onSaved: (input) => _nombre = input,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      cursorColor: Color(0xAAA02837),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.text_fields,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.3),
                        ),
                        hintText: 'Ingresa tu primer apellido',
                      ),
                      validator: (input) =>
                          input == '' ? 'Llena el campo con un apellido' : null,
                      onSaved: (input) => _apaterno = input,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      cursorColor: Color(0xAAA02837),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.text_fields,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.3),
                        ),
                        hintText: 'Ingresa tu segundo apellido',
                      ),
                      validator: (input) => input == ''
                          ? 'Llena el campo con el segundo apellido '
                          : null,
                      onSaved: (input) => _amaterno = input,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      cursorColor: Color(0xAAA02837),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.3),
                        ),
                        hintText: 'Ingresa tu correo',
                      ),
                      validator: (input) => !input.contains('@')
                          ? 'Ingresa un correo válido'
                          : null,
                      onSaved: (input) => _email = input,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      cursorColor: Color(0xAAA02837),
                      keyboardType: TextInputType.number,
                      inputFormatters: [MaskedInputFormater('##-000-#####')],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.3),
                        ),
                        hintText: 'Ingresa tu número',
                      ),
                      validator: (input) => input.length != 12
                          ? 'Llena el campo con un telefono'
                          : null,
                      onSaved: (input) => _telefono = input,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      cursorColor: Color(0xAAA02837),
                      keyboardType: TextInputType.datetime,
                      showCursor: true,
                      readOnly: true,
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.cake,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.3),
                        ),
                        hintText: 'Ingresa tu fecha de nacimiento',
                      ),
                      validator: (input) =>
                          input == '' ? 'Llena el campo con tu fecha' : null,
                      onSaved: (input) => _fecha = input,
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1950, 3, 5),
                            maxTime: DateTime(2019, 6, 7),
                            theme: DatePickerTheme(
                              headerColor: Color(0xAAA02837),
                              backgroundColor: Colors.white,
                              itemStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              doneStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              cancelStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ), onCancel: () {
                          setState(() {
                            controller.text = '';
                          });
                        }, onChanged: (date) {
                          if (date != null) {
                            setState(() {
                              controller.text =
                                  '${date.year}-${date.month}-${date.day}';
                            });
                          }
                        }, onConfirm: (date) {
                          if (date != null) {
                            setState(() {
                              controller.text =
                                  '${date.year}-${date.month}-${date.day}';
                            });
                          }
                        }, currentTime: DateTime.now(), locale: LocaleType.es);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      cursorColor: Color(0xAAA02837),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.3),
                        ),
                        hintText: 'Ingresa tu contraseña',
                      ),
                      maxLength: 10,
                      validator: (input) => input.length < 5
                          ? 'La contraseña es muy corta'
                          : null,
                      onSaved: (input) => _pass = input,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      cursorColor: Color(0xAAA02837),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.3),
                        ),
                        hintText: 'Verifica tu contraseña',
                      ),
                      maxLength: 10,
                      validator: (input) => input.length < 5
                          ? 'La contraseña es muy corta'
                          : null,
                      onSaved: (input) => _forcepass = input,
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
                        try {
                          final result =
                              await InternetAddress.lookup('www.google.com');
                          if (result.isNotEmpty &&
                              result[0].rawAddress.isNotEmpty) {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              // validar que todos los campos esten llenos.

                              if (_pass != _forcepass) {
                                message(
                                    context,
                                    'Atención',
                                    'Las contraseñas no coinciden',
                                    Icons.lock,
                                    2);
                              } else {
                                controller.forward();

                                Map<String, dynamic> post = {
                                  "key": 1,
                                  "nombre": _nombre,
                                  "apaterno": _apaterno,
                                  "amaterno": _amaterno,
                                  "email": _email,
                                  "telefono": _telefono,
                                  "fecha_nacimiento": _fecha,
                                  "acceso": _forcepass
                                };

                                _.signIn(post);

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
                                    message(context, 'Registro exitoso',
                                        'Bienvenidos', Icons.done, 2);
                                    controller.reverse();
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    Get.to(Login());
                                  }
                                }
                              }
                            } else {
                              message(
                                  context,
                                  'Atención',
                                  'Completa los campos correctamente',
                                  Icons.warning,
                                  2);
                            }
                          }
                        } on SocketException catch (_) {
                          message(
                              context,
                              'Alerta',
                              'No estás conectado a internet',
                              Icons.wifi_off,
                              2);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  final logo = Hero(
    tag: 'hero',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 80.0,
      child: Image.asset('assets/rinones.png', height: 300, width: 300),
    ),
  );

  final title = Container(
    child: Align(
      alignment: Alignment.topLeft,
      child: Text('Registrate',
          style: TextStyle(color: Color(0xAAA02837), fontSize: 25)),
    ),
  );

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
