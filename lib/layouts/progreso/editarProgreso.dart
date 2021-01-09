import 'package:fialogs/fialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nutricion/controllers/progreso_controller.dart';

class EditarProgreso extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProgresoController>(
        id: 'editar',
        init: ProgresoController(),
        builder: (_) {
          List progreso = Get.arguments;
          print(progreso);
          return Scaffold(
            appBar: GradientAppBar(
              gradient: LinearGradient(
                  colors: [HexColor('#ac5a65'), HexColor('#771929')]),
              title: Text('Editar Progreso'),
            ),
            body: ListView(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Progreso ${progreso[8]}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ListTile(
                title: Text('Peso:'),
                contentPadding: EdgeInsets.only(left: 16, right: 16),
                subtitle: Text(progreso[1]),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    customSingleInputDialog(
                      context,
                      Text("Editar Peso"),
                      DialogTextField(
                        label: "Escribe tu peso:",
                        obscureText: false,
                        value: progreso[1],
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) return "Campo requerido!";
                          return null;
                        },
                      ),
                      positiveButtonText: "Confirmar",
                      positiveButtonAction: (value) {
                        Map<String, dynamic> post = {
                          "key": 3,
                          "id": progreso[0],
                          "peso": value,
                          "cintura": progreso[2],
                          "cadera": progreso[3],
                          "brazo": progreso[4],
                          "imc": progreso[5],
                          "grasa": progreso[6],
                          "musculo": progreso[7],
                          "fechaProgreso": DateTime.now()
                        };
                         _.editProgress(post, context, 'Se actualizó tu peso');
                      },
                      hideNeutralButton: false,
                      closeOnBackPress: true,
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Cintura:'),
                contentPadding: EdgeInsets.only(left: 16, right: 16),
                subtitle: Text(progreso[2]),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    customSingleInputDialog(
                      context,
                      Text("Editar Cintura"),
                      DialogTextField(
                        label: "Escribe Cintura:",
                        obscureText: false,
                        value: progreso[1],
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) return "Campo requerido!";
                          return null;
                        },
                      ),
                      positiveButtonText: "Confirmar",
                      positiveButtonAction: (value) {
                        Map<String, dynamic> post = {
                          "key": 3,
                          "id": progreso[0],
                          "peso": progreso[1],
                          "cintura": value,
                          "cadera": progreso[3],
                          "brazo": progreso[4],
                          "imc": progreso[5],
                          "grasa": progreso[6],
                          "musculo": progreso[7],
                          "fechaProgreso": DateTime.now()
                        };
                         _.editProgress(post, context, 'Se actualizó tu peso');
                      },
                      hideNeutralButton: false,
                      closeOnBackPress: true,
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Cadera:'),
                contentPadding: EdgeInsets.only(left: 16, right: 16),
                subtitle: Text(progreso[3]),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    customSingleInputDialog(
                      context,
                      Text("Editar Cadera"),
                      DialogTextField(
                        label: "Escribe Cadera:",
                        obscureText: false,
                        value: progreso[1],
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) return "Campo requerido!";
                          return null;
                        },
                      ),
                      positiveButtonText: "Confirmar",
                      positiveButtonAction: (value) {
                        Map<String, dynamic> post = {
                          "key": 3,
                          "id": progreso[0],
                          "peso": progreso[1],
                          "cintura": progreso[2],
                          "cadera": value,
                          "brazo": progreso[4],
                          "imc": progreso[5],
                          "grasa": progreso[6],
                          "musculo": progreso[7],
                          "fechaProgreso": DateTime.now()
                        };
                         _.editProgress(post, context, 'Se actualizó tu peso');
                      },
                      hideNeutralButton: false,
                      closeOnBackPress: true,
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Brazo:'),
                contentPadding: EdgeInsets.only(left: 16, right: 16),
                subtitle: Text(progreso[4]),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    customSingleInputDialog(
                      context,
                      Text("Editar Brazo"),
                      DialogTextField(
                        label: "Escribe brazo:",
                        obscureText: false,
                        value: progreso[1],
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) return "Campo requerido!";
                          return null;
                        },
                      ),
                      positiveButtonText: "Confirmar",
                      positiveButtonAction: (value) {
                        Map<String, dynamic> post = {
                          "key": 3,
                          "id": progreso[0],
                          "peso": progreso[1],
                          "cintura": progreso[2],
                          "cadera": progreso[3],
                          "brazo": value,
                          "imc": progreso[5],
                          "grasa": progreso[6],
                          "musculo": progreso[7],
                          "fechaProgreso": DateTime.now()
                        };
                         _.editProgress(post, context, 'Se actualizó tu peso');
                      },
                      hideNeutralButton: false,
                      closeOnBackPress: true,
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('IMC:'),
                contentPadding: EdgeInsets.only(left: 16, right: 16),
                subtitle: Text(progreso[5]),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    customSingleInputDialog(
                      context,
                      Text("Editar IMC"),
                      DialogTextField(
                        label: "Escribe tu IMC:",
                        obscureText: false,
                        value: progreso[1],
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) return "Campo requerido!";
                          return null;
                        },
                      ),
                      positiveButtonText: "Confirmar",
                      positiveButtonAction: (value) {
                        Map<String, dynamic> post = {
                          "key": 3,
                          "id": progreso[0],
                          "peso": progreso[1],
                          "cintura": progreso[2],
                          "cadera": progreso[3],
                          "brazo": progreso[4],
                          "imc": value,
                          "grasa": progreso[6],
                          "musculo": progreso[7],
                          "fechaProgreso": DateTime.now()
                        };
                         _.editProgress(post, context, 'Se actualizó tu peso');
                      },
                      hideNeutralButton: false,
                      closeOnBackPress: true,
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('% Grasa:'),
                contentPadding: EdgeInsets.only(left: 16, right: 16),
                subtitle: Text(progreso[6]),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    customSingleInputDialog(
                      context,
                      Text("Editar % Grasa"),
                      DialogTextField(
                        label: "Escribe tu % de Grasa:",
                        obscureText: false,
                        value: progreso[1],
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) return "Campo requerido!";
                          return null;
                        },
                      ),
                      positiveButtonText: "Confirmar",
                      positiveButtonAction: (value) {
                        Map<String, dynamic> post = {
                          "key": 3,
                          "id": progreso[0],
                          "peso": progreso[1],
                          "cintura": progreso[2],
                          "cadera": progreso[3],
                          "brazo": progreso[4],
                          "imc": progreso[5],
                          "grasa": value,
                          "musculo": progreso[7],
                          "fechaProgreso": DateTime.now()
                        };
                         _.editProgress(post, context, 'Se actualizó tu peso');
                      },
                      hideNeutralButton: false,
                      closeOnBackPress: true,
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('% Músculo:'),
                contentPadding: EdgeInsets.only(left: 16, right: 16),
                subtitle: Text(progreso[7]),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    customSingleInputDialog(
                      context,
                      Text("Editar % Músculo"),
                      DialogTextField(
                        label: "Escribe tu % de Músculo:",
                        obscureText: false,
                        value: progreso[1],
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) return "Campo requerido!";
                          return null;
                        },
                      ),
                      positiveButtonText: "Confirmar",
                      positiveButtonAction: (value) {
                        Map<String, dynamic> post = {
                          "key": 3,
                          "id": progreso[0],
                          "peso": progreso[1],
                          "cintura": progreso[2],
                          "cadera": progreso[3],
                          "brazo": progreso[4],
                          "imc": progreso[5],
                          "grasa": progreso[6],
                          "musculo": value,
                          "fechaProgreso": DateTime.now()
                        };
                         _.editProgress(post, context, 'Se actualizó tu peso');
                      },
                      hideNeutralButton: false,
                      closeOnBackPress: true,
                    );
                  },
                ),
              ),
            ]),
          );
        });
  }
}
