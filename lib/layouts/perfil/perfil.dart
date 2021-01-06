import 'package:fialogs/fialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nutricion/controllers/profile_controller.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({Key key}) : super(key: key);

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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text('Nombre:'),
                    subtitle: Text(_.profile[0]),
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
                            textInputType: TextInputType.text, 
                            validator: (value) {  
                              if (value.isEmpty) return "Campo requerido!";  
                              return null;  
                            },  
                            onEditingComplete: (value) {  
                              print(value);
                            }  
                          ),  
                          positiveButtonText: "Confirmar",  
                          positiveButtonAction: (value) {  
                            print(value);  
                          }, 
                            
                          hideNeutralButton: false,  
                          closeOnBackPress: true,  
                        );
                      },
                    ),
                  )
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