import 'package:fialogs/fialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nutricion/controllers/profile_controller.dart';

class PerfilUsuario extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      id: 'profile',
      init: ProfileController(),
      builder: (_){
        if(_.status){
          return Scaffold(
            appBar: GradientAppBar(
              gradient: LinearGradient(
                  colors: [HexColor('#ac5a65'), HexColor('#771929')]
              ),
              title: Text('Perfil'),
              
            ),
            body: ListView(
              children: [
                ListTile(
                  title: Text('Nombre:'),
                  contentPadding: EdgeInsets.only(left: 16),
                  subtitle: Text(_.profile[1]),
                  leading: Icon(Icons.account_circle, size:45.0, color: HexColor('#ac5a65'),),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      customSingleInputDialog(  
                        context,
                        Text("Editar Nombre"),  
                        DialogTextField(  
                          label: "Escribe tu nombre",
                          obscureText: false,  
                          value: _.profile[1],
                          textInputType: TextInputType.text, 
                          validator: (value) {
                            if (value.isEmpty) return "Campo requerido!";  
                            return null;  
                          },  
                        ),  
                        positiveButtonText: "Confirmar",  
                        positiveButtonAction: (value) {
                          _.profile[1] = value;
                          Map<String, dynamic> post = {
                                "key": 3,
                                "id": _.profile[0],
                                "nombre": _.profile[1],
                                "apaterno": _.profile[2],
                                "amaterno": _.profile[3],
                                "email": _.profile[4],
                                "telefono": _.profile[5],
                                "fecha_nacimiento": _.profile[6],
                                "acceso": _.profile[7]
                          };
                          _.editProfile(post, _.profile, context,'Se actualizó tu nombre');
                        }, 
                        hideNeutralButton: false,  
                        closeOnBackPress: true,  
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('Apellido Paterno:'),
                  contentPadding: EdgeInsets.only(left: 16),
                  subtitle: Text(_.profile[2]),
                  leading: Icon(Icons.text_fields_rounded,size:45.0, color: HexColor('#ac5a65'),),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      customSingleInputDialog(  
                        context,
                        Text("Editar Apellido Paterno"),  
                        DialogTextField(  
                          label: "Escribe tu apellido",
                          obscureText: false,  
                          value: _.profile[2],
                          textInputType: TextInputType.text, 
                          validator: (value) {
                            if (value.isEmpty) return "Campo requerido!";  
                            return null;  
                          },  
                        ),  
                        positiveButtonText: "Confirmar",  
                        positiveButtonAction: (value) {
                          _.profile[2] = value;
                          Map<String, dynamic> post = {
                                "key": 3,
                                "id": _.profile[0],
                                "nombre": _.profile[1],
                                "apaterno": _.profile[2],
                                "amaterno": _.profile[3],
                                "email": _.profile[4],
                                "telefono": _.profile[5],
                                "fecha_nacimiento": _.profile[6],
                                "acceso": _.profile[7]
                          };
                          _.editProfile(post, _.profile, context,'Se actualizó tu apellido');
                        }, 
                        hideNeutralButton: false,  
                        closeOnBackPress: true,  
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('Apellido Materno:'),
                  contentPadding: EdgeInsets.only(left: 16),
                  subtitle: Text(_.profile[3]),
                  leading: Icon(Icons.text_fields_rounded, size:45.0, color: HexColor('#ac5a65'),),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      customSingleInputDialog(  
                        context,
                        Text("Editar Apellido Materno"),  
                        DialogTextField(  
                          label: "Escribe tu apellido",
                          obscureText: false,  
                          value: _.profile[3],
                          textInputType: TextInputType.text, 
                          validator: (value) {
                            if (value.isEmpty) return "Campo requerido!";  
                            return null;  
                          },  
                        ),  
                        positiveButtonText: "Confirmar",  
                        positiveButtonAction: (value) {
                          _.profile[3 ] = value;
                          Map<String, dynamic> post = {
                                "key": 3,
                                "id": _.profile[0],
                                "nombre": _.profile[1],
                                "apaterno": _.profile[2],
                                "amaterno": _.profile[3],
                                "email": _.profile[4],
                                "telefono": _.profile[5],
                                "fecha_nacimiento": _.profile[6],
                                "acceso": _.profile[7]
                          };
                          _.editProfile(post, _.profile, context,'Se actualizó tu apellido');
                        }, 
                        hideNeutralButton: false,  
                        closeOnBackPress: true,  
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('Correo:'),
                  contentPadding: EdgeInsets.only(left: 16),
                  subtitle: Text(_.profile[4]),
                  leading: Icon(Icons.email, size:45.0, color: HexColor('#ac5a65'),),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      customSingleInputDialog(  
                        context,
                        Text("Editar Dirección de Correo"),  
                        DialogTextField(  
                          label: "Escribe tu email",
                          obscureText: false,
                          value: _.profile[4],
                          textInputType: TextInputType.emailAddress, 
                          validator: (input) => !input.contains('@')
                          ? 'Ingresa un correo válido'
                          : null, 
                        ),  
                        positiveButtonText: "Confirmar",  
                        positiveButtonAction: (value) {
                          _.profile[4] = value;
                          Map<String, dynamic> post = {
                                "key": 3,
                                "id": _.profile[0],
                                "nombre": _.profile[1],
                                "apaterno": _.profile[2],
                                "amaterno": _.profile[3],
                                "email": _.profile[4],
                                "telefono": _.profile[5],
                                "fecha_nacimiento": _.profile[6],
                                "acceso": _.profile[7]
                          };
                          _.editProfile(post, _.profile, context,'Se actualizó tu correo.');
                        }, 
                        hideNeutralButton: false,  
                        closeOnBackPress: true,  
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('Telefono:'),
                  contentPadding: EdgeInsets.only(left: 16),
                  subtitle: Text(_.profile[5]),
                  leading: Icon(Icons.phone_android_rounded, size:45.0, color: HexColor('#ac5a65'),),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      customSingleInputDialog(  
                        context,
                        Text("Editar Número Telefónico"),  
                        DialogTextField(  
                          label: "Escribe tu teléfono",
                          obscureText: false,
                          value: _.profile[5],
                          textInputType: TextInputType.phone, 
                          validator: (input) => input.length != 10
                          ? 'Llena el campo con un teléfono'
                          : null,
                        ),  
                        positiveButtonText: "Confirmar",  
                        positiveButtonAction: (value) {
                          _.profile[5] = value;
                          Map<String, dynamic> post = {
                                "key": 3,
                                "id": _.profile[0],
                                "nombre": _.profile[1],
                                "apaterno": _.profile[2],
                                "amaterno": _.profile[3],
                                "email": _.profile[4],
                                "telefono": _.profile[5],
                                "fecha_nacimiento": _.profile[6],
                                "acceso": _.profile[7]
                          };
                          _.editProfile(post, _.profile, context,'Se actualizó tu teléfono.');
                        }, 
                        hideNeutralButton: false,  
                        closeOnBackPress: true,  
                      );
                    },
                  ),
                ),
                ListTile(
                  title: Text('Fecha de nacimiento:'),
                  contentPadding: EdgeInsets.only(left: 16),
                  subtitle: Text(_.profile[6]),
                  leading: Icon(Icons.cake, size:45.0, color: HexColor('#ac5a65'),),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
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
                                ), onConfirm: (date) {
                                if (date != null) {
                                        _.profile[6] = '${date.year}-${date.month}-${date.day}';
                                  Map<String, dynamic> post = {
                                        "key": 3,
                                        "id": _.profile[0],
                                        "nombre": _.profile[1],
                                        "apaterno": _.profile[2],
                                        "amaterno": _.profile[3],
                                        "email": _.profile[4],
                                        "telefono": _.profile[5],
                                        "fecha_nacimiento": _.profile[6],
                                        "acceso": _.profile[7]
                                  };
                                  _.editProfile(post, _.profile, context,'Se actualizó tu fecha de nacimiento.');
                                }
                            }, currentTime: DateTime.now(), locale: LocaleType.es);
                    },
                  ),
                ),
                ListTile(
                  title: Text('Contraseña:'),
                  contentPadding: EdgeInsets.only(left: 16),
                  subtitle: Text(
                    _.profile[7].toString().replaceRange(3, _.profile[7].length, '***'),
                  ),
                  leading: Icon(Icons.lock, size:45.0, color: HexColor('#ac5a65'),),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      customSingleInputDialog(  
                        context,
                        Text("Editar Contraseña"),  
                        DialogTextField(  
                          label: "Escribe tu nueva contraseña",
                          obscureText: false,
                          textInputType: TextInputType.text, 
                          validator: (input) => input == ''
                          ? 'Completa el campo'
                          : null,
                        ),  
                        positiveButtonText: "Confirmar",  
                        positiveButtonAction: (value) {
                          _.profile[7] = value;
                          Map<String, dynamic> post = {
                                "key": 3,
                                "id": _.profile[0],
                                "nombre": _.profile[1],
                                "apaterno": _.profile[2],
                                "amaterno": _.profile[3],
                                "email": _.profile[4],
                                "telefono": _.profile[5],
                                "fecha_nacimiento": _.profile[6],
                                "acceso": _.profile[7]
                          };
                          _.editProfile(post, _.profile, context,'Se actualizó tu teléfono.');
                        }, 
                        hideNeutralButton: false,  
                        closeOnBackPress: true,  
                      );
                    },
                  ),
                ),
              ]
            ),
          );
        }else{
          return Scaffold(
            appBar: GradientAppBar(
              gradient: LinearGradient(
                  colors: [HexColor('#ac5a65'), HexColor('#771929')]
              ),
              title: Text('Perfil'),
            ),
            body: Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Color(0xAAA02837)),
              ),
            ),
          );
        }
      });
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