import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nutricion/controllers/signin_controller.dart';
import 'package:nutricion/layouts/login.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:status_alert/status_alert.dart';



// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _apaterno = TextEditingController();
  final TextEditingController _amaterno = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _telefono = TextEditingController();
  final TextEditingController _fechaNacimiento = TextEditingController();
  final TextEditingController _acceso = TextEditingController();
  final TextEditingController _forceAcceso = TextEditingController();
  String _sexo = "H";

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
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children: [
                    logo,
                    title,
                    SizedBox(height: 5,),
                    Text('Completa los siguientes datos:', style: TextStyle(
                      fontSize: 20,
                    ),),
                    SizedBox(height: 15,),
                    Text('Selecciona tu género:', style: TextStyle(
                      fontSize: 17,
                    ),),
                    GenderSelection(
                      maleText: "Masculino", //default Male
                      femaleText: "Femenino", //default Female
                      linearGradient: LinearGradient(
                            colors: [HexColor('#ac5a65'), HexColor('#771929')]),
                      selectedGenderIconBackgroundColor: Colors.indigo, // default red 
                      checkIconAlignment: Alignment.bottomCenter,   // default bottomRight
                      selectedGenderCheckIcon: Icons.check, // default Icons.check
                      selectedGender: Gender.Male,
                      onChanged: (Gender gender){
                        if (gender.index == 1){
                          _sexo = "F";
                        }else{
                          _sexo = "M";
                        }
                        print(_sexo);
                        
                      },
                      equallyAligned: true,
                      animationDuration: Duration(milliseconds: 200),
                      isCircular: true, // default : true,
                      isSelectedGenderIconCircular: true,
                      opacityOfGradient: 0.3,
                      padding: const EdgeInsets.all(3),
                      size: 50, //default : 120
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _nombre,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: decoracion('Ingresa tu nombre',Icon(Icons.account_circle, color: Colors.black,)),
                      validator: (input) => input == '' ? 'Llena el campo con un nombre' : null,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _apaterno,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: decoracion('Ingresa tu apellido paterno', Icon(Icons.text_fields, color: Colors.black,)),
                      validator: (input) => input == '' ? 'Llena el campo con un apellido' : null,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _amaterno,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: decoracion('Ingresa tu apellido materno',Icon(Icons.text_fields, color: Colors.black,)),
                      validator: (input) =>input == '' ? 'Llena el campo con un apellido' : null,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: decoracion('Ingresa tu email',Icon(Icons.email, color: Colors.black,)),
                      validator: (input) => !input.contains('@')
                          ? 'Ingresa un correo válido'
                          : null,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _telefono,
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: decoracion('Ingresa tu teléfono',Icon(Icons.phone_android, color: Colors.black,)),
                      validator: (input) => input.length != 10
                          ? 'Llena el campo con un teléfono'
                          : null,
                    ),
                    SizedBox(height: 15,),
                    GetBuilder<SignInController>(
                      id: 'fecha',
                      init: SignInController(),
                      builder: (_){
                        return TextFormField(
                          controller: _fechaNacimiento,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          showCursor: true,
                          readOnly: true,
                          decoration: decoracion('Ingresa tu fecha de nacimiento',Icon(Icons.cake, color: Colors.black,)),
                          validator: (input) =>
                              input == '' ? 'Llena el campo con tu fecha' : null,
                          onTap: () {
                            DatePicker.showDatePicker(context,
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
                                  doneStyle:
                                      TextStyle(color: Colors.white, fontSize: 16),
                                  cancelStyle:
                                      TextStyle(color: Colors.white, fontSize: 16),
                                ), onCancel: () {
                              _fechaNacimiento.text = '';
                            }, onChanged: (date) {
                              if (date != null) {
                                  _fechaNacimiento.text =
                                      '${date.year}-${date.month}-${date.day}';
                              }
                            }, onConfirm: (date) {
                              if (date != null) {
                                  _fechaNacimiento.text =
                                      '${date.year}-${date.month}-${date.day}';
                              }
                            }, currentTime: DateTime.now(), locale: LocaleType.es);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _acceso,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: decoracion('Ingresa tu contraseña',Icon(Icons.lock_open, color: Colors.black,)),
                      maxLength: 10,
                      validator: (input) => input == ''
                          ? 'Completa el campo'
                          : null,
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _forceAcceso,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: decoracion('Verifica tu contraseña',Icon(Icons.lock_open, color: Colors.black,)),
                      maxLength: 10,
                      validator: (input) => input == ''
                          ? 'Completa el campo'
                          : null,
                    ),
                    SizedBox(height: 15,),
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
                        
                        if(!controller.isAnimating){
                          controller.forward();
                          if(
                            _nombre.text == "" ||
                            _apaterno.text == "" ||
                            _amaterno.text == "" ||
                            _sexo == "" ||
                            _email.text == "" ||
                            _telefono.text == "" ||
                            _fechaNacimiento.text == "" ||
                            _acceso.text == "" ||
                            _forceAcceso.text == ""
                          ){
                            _formKey.currentState.validate();
                            message(
                              context,
                              'Atención',
                              'Tienes campos vacios',
                              Icons.warning,
                              2
                            );
                            controller.reverse();
                          }else{
                            if(_acceso.text != _forceAcceso.text){
                              message(
                                context,
                                'Atención',
                                'Las contraseñas no coinciden',
                                Icons.warning,
                                2
                              );
                              controller.reverse();
                            }else{
                              Map<String, dynamic> post = {
                                  "key": 1,
                                  "nombre": _nombre.text,
                                  "apaterno": _apaterno.text,
                                  "amaterno": _amaterno.text,
                                  "sexo": _sexo,
                                  "email": _email.text,
                                  "telefono": _telefono.text,
                                  "fecha_nacimiento": _fechaNacimiento.text,
                                  "acceso": _acceso.text
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
                                    _formKey.currentState.reset();
                                    Get.off(Login());
                                  }
                                }
                              controller.reverse();
                            }
                          }
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

  InputDecoration decoracion(String hint, Widget icon){
    return InputDecoration(
      border: OutlineInputBorder(),
      suffixIcon: icon,
      focusedBorder: OutlineInputBorder(
        borderSide:
          BorderSide(color: Colors.black, width: 1.6),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.3),
        ),
      hintText: hint,
    );
  }
}