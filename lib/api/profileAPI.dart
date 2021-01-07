import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nutricion/models/signin_model.dart';

class ProfileAPI {
  ProfileAPI._internal();
  static ProfileAPI _instance = ProfileAPI._internal();
  static ProfileAPI get instance => _instance;
  final _dio = Dio();

  Future <SigninPaciente> signIn(Map<String, dynamic> datos) async{
    try{
      FormData formData = FormData.fromMap(datos);
      final Response response = await this._dio.post(
        'https://www.nutricion.caitec.mx/controller/pacienteController.php', 
        data: formData, 
      );
      print("PROFILEAPI LINE-------------");
      print(response.data);
      return SigninPaciente.fromJson(jsonDecode(response.data));
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}