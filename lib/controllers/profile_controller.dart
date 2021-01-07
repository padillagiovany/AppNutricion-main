import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:nutricion/api/profileAPI.dart';
import 'package:nutricion/models/signin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_alert/status_alert.dart';

class ProfileController extends GetxController{
  bool _status = false;
  bool get status => _status;

  List _profile = [];
  List get profile => _profile;

  bool _updateStatus = false;
  bool get updateStatus => _updateStatus;

  @override
  void onReady() {
    super.onReady();
    getUserProfile();
  }

  void getUserProfile() async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List data = prefs.getStringList('user');
      _profile = data;
      _status = true;
      update(['profile']);
    } catch (e) {
      print(e);
    }
  }

  void editProfile(Map<String, dynamic> datos, List storage, context, String msg) async{
    final SigninPaciente data = await ProfileAPI.instance.signIn(datos);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("PROFILECONTROLLER LINE-------------");
    print(data.code);
    if(data.code!=null){
      print("PRE STORAGE-------------");
      print(storage);
      await prefs.setStringList('user', storage);
      message(context, 'Cambio exitoso',msg, Icons.done, 2);
      List newData = prefs.getStringList('user');
      print("NEW STORAGE-------------");
      print(newData);
      update(['profile']);
    }else{
      _updateStatus = false;
    }
  }

  void clearStorage() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

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