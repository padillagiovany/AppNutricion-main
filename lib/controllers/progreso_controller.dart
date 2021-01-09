

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nutricion/api/progresoAPI.dart';
import 'package:nutricion/models/progress_model.dart';
import 'package:nutricion/models/signin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_alert/status_alert.dart';

class ProgresoController extends GetxController{
  int _currentIndex;
  int get currentIndex => _currentIndex;

  List _profile = [];
  List get profile => _profile;

  String _status = '';
  String get status => _status;

  bool _statusP = false;
  bool get statusP => _statusP;

  bool _progresoStatus = false;
  bool get progresoStatus => _progresoStatus;

  List<PacienteProgreso> _progreso = [];
  List<PacienteProgreso> get progreso => _progreso;

  @override
    void onInit() {
      // TODO: implement onInit
      super.onInit();
      loadProgress();
    }

  @override
  void onReady() {
      // TODO: implement onReady
    super.onReady();
    setCurrentIndex(0);
  }

  void setCurrentIndex(int index) async{
    _currentIndex = index;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List data = prefs.getStringList('user');
    _profile = data;
    print(_profile);
    update(['progreso']);
  }

  Future<void> sendProgress(Map<String, dynamic> datos) async{
    final SigninPaciente data = await ProgresoAPI.instance.signIn(datos);
    print(data.code);
    if(data.code!=null){
      this._status = '200';
    }else{
      this._status = '404';
    }
    update(['progreso']);
  }

  Future<void> editProgress(Map<String, dynamic> datos, context, String msg) async{
    final SigninPaciente data = await ProgresoAPI.instance.editarProgreso(datos);
    print(data.code);
    if(data.code!=null){
      this._status = '200';
      message(context, 'Cambio exitoso',msg, Icons.done, 2);
      await Future.delayed(const Duration(seconds: 2));
      Get.back();
    }else{
      this._status = '404';
    }
  }

  Future<void> loadProgress() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List userData = prefs.getStringList('user');
    final data  = await ProgresoAPI.instance.getProgress(userData[4]);
    if(data.length == 0){
      _statusP = true;
      _progresoStatus = false;
    }else{
      if(data[0].peso != null){
        _progreso = data;
        _statusP = true;
        _progresoStatus = true;
      }else{
        _statusP = false;
        _progresoStatus = false;
      }
    }
    update(['progreso']);
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