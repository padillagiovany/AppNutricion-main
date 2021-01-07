import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nutricion/models/progress_model.dart';
import 'package:nutricion/models/signin_model.dart';

class ProgresoAPI {
  ProgresoAPI._internal();
  static ProgresoAPI _instance = ProgresoAPI._internal();
  static ProgresoAPI get instance => _instance;
  final _dio = Dio();

  Future <SigninPaciente> signIn(Map<String, dynamic> datos) async{
    try{
      FormData formData = FormData.fromMap(datos);
      final Response response = await this._dio.post(
        'https://www.nutricion.caitec.mx/controller/progresoController.php', 
        data: formData, 
      );
      print("PROGRESOAPI LINE-------------");
      print(response.data);
      return SigninPaciente.fromJson(jsonDecode(response.data));
    }catch(e){
      print(e.toString());
      return null;
    }
  }

    Future <List<PacienteProgreso>> getProgress(String email) async{
    try {
      FormData formData = FormData.fromMap({
          "key": 2,
          "email": email,
      });

      final Response response = await this._dio.post(
        'https://www.nutricion.caitec.mx/controller/progresoController.php', 
        data: formData, 
      );
      print("GET PROGRESOAPI LINE-------------");
      print(response.data);
      return (jsonDecode(response.data) as List).map((e) => PacienteProgreso.fromJson(e)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}