import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:nutricion/controllers/login_controller.dart';
import 'package:nutricion/layouts/panel.dart';
import 'package:nutricion/layouts/signin.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:status_alert/status_alert.dart';
import 'dart:io';



// ignore: must_be_immutable
class Login extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {


    return GetBuilder<LoginController>(
      init: LoginController(),
      id:'login',
      builder: (_){
        return Scaffold(
        body: Center(
          child: Form(
            key: formKey,
            child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: [
                  logo,
                  title,
                  SizedBox(height: 8,),
                  TextFormField(
                    cursorColor: Color(0xAAA02837),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                        Icons.email,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.3),
                        ),
                        hintText: 'Ingresa tu correo',
                    ),
                    validator: (input) => !input.contains('@') ? 'Ingresa un correo válido' : null,
                    onSaved: (input) => _email = input,
                  ),
                  SizedBox(height: 15,),
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
                        borderSide: BorderSide(color: Colors.black, width: 1.6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.3),
                      ),
                      hintText: 'Ingresa tu contraseña',
                    ),
                    maxLength: 10,
                    validator: (input) => input.length < 5 ? 'La contraseña tiene 8 caracteres' : null,
                    onSaved: (input) => _password = input,
                  ),
                  SizedBox(height: 15,),
                  ProgressButton(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    strokeWidth: 3,
                    color: Color(0xAAA02837),
                    child: Text(
                        "Iniciar sesión",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        ),
                    ),
                    onPressed: (controller) async{
                        
                        try {
                          final result = await InternetAddress.lookup('www.google.com');
                          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                            if(formKey.currentState.validate()){
                              formKey.currentState.save();
                              controller.forward();
                              _.loginPacientes(_email, _password);

                              await Future.delayed(const Duration(seconds: 4));
                              
                              if(_.status!=''){
                                if(_.status=='404'){
                                  message(context, 'Error', 'Datos incorrectos', Icons.close, 2);
                                  controller.reverse();
                                }else{
                                  message(context, 'Usuario Correcto', _.status, Icons.done, 2);
                                  controller.reverse();
                                  await Future.delayed(const Duration(seconds: 2));
                                  Get.offAll(Panel(),
                                    transition: Transition.cupertinoDialog,);
                                }
                              }
                            }else{
                              message(context, 'Atención', 'Completa los campos correctamente', Icons.warning, 2);
                            }
                          }
                        } on SocketException catch (_) {
                          message(context, 'Alerta', 'No estás conectado a internet', Icons.wifi_off, 2);
                        }

                        
                    },
                  ),
                  forgotLabel,
                ],
              ),
          ),
        )
      );
      },
    );
  }

  void message(context, title, message, icon, seconds){
    StatusAlert.show(
      context,
      duration: Duration(seconds: seconds),
      title: title,
      subtitle: message,
      configuration: IconConfiguration(icon: icon),
    );
  }

  final logo = Hero(
    tag: 'hero',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 100.0,
      child: Image.asset('assets/entrenador.png', height: 300, width: 300),
    ),
  );

  final forgotLabel = FlatButton(
    child: Text(
      '¿No tienes cuenta? Presiona aquí.',
      style: TextStyle(color: Colors.black54),
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    onPressed: () {
      Get.to(SignIn());
    },
  );

  final title = Container(
    child: Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Bienvenido', style: TextStyle( color: Color(0xAAA02837), fontSize: 25)                 
      ),
    ),
  );

}
