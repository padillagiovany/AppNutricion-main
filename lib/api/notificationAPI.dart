
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nutricion/models/notification_model.dart';
import 'package:nutricion/models/signin_model.dart';

class NotificationAPI {
  
  NotificationAPI._internal();
  static NotificationAPI _instance = NotificationAPI._internal();
  static NotificationAPI get instance => _instance;
  final _dio = Dio();

  Future <List<NotificationModel>> getNotifications(String email) async{
    try {
      FormData formData = FormData.fromMap({
          "key": 1,
          "email": email,
      });

      final Response response = await this._dio.post(
        'https://www.nutricion.caitec.mx/controller/citasController.php', 
        data: formData, 
      );
      
      return (jsonDecode(response.data) as List).map((e) => NotificationModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future <SigninPaciente> createCita(Map<String, dynamic> datos) async{
    try{
      FormData formData = FormData.fromMap(datos);
      final Response response = await this._dio.post(
        'https://www.nutricion.caitec.mx/controller/citasController.php', 
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