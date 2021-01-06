import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nutricion/models/login_model.dart';
import 'package:nutricion/models/payment_model.dart';
import 'package:nutricion/models/signin_model.dart';
class LoginAPI{
  
  LoginAPI._internal();
  static LoginAPI _instance = LoginAPI._internal();
  static LoginAPI get instance => _instance;
  final _dio = Dio();

  Future <LoginPaciente> loginAccess(String email, String password) async{
    try{
      FormData formData = FormData.fromMap({
          "key": 5,
          "email": email,
          "password": password,
      });

      final Response response = await this._dio.post(
        'https://www.nutricion.caitec.mx/controller/pacienteController.php', 
        data: formData, 
      );
      
      return LoginPaciente.fromJson(jsonDecode(response.data));
    
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future <SigninPaciente> signIn(Map<String, dynamic> datos) async{
    try{
      FormData formData = FormData.fromMap(datos);

      final Response response = await this._dio.post(
        'https://www.nutricion.caitec.mx/controller/pacienteController.php', 
        data: formData, 
      );
      
      return SigninPaciente.fromJson(jsonDecode(response.data));
    
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future <Payment> checkPayment(String email) async{
    try{
      FormData formData = FormData.fromMap({
          "key": 6,
          "email": email,
      });

      final Response response = await this._dio.post(
        'https://www.nutricion.caitec.mx/controller/pacienteController.php', 
        data: formData, 
      );
      
      return Payment.fromJson(jsonDecode(response.data));
    
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}