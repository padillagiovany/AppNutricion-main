import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nutricion/api/loginAPI.dart';
import 'package:nutricion/models/login_model.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  LoginPaciente _loginPaciente;
  LoginPaciente get loginPaciente => _loginPaciente;
  String _status = '';
  String get status => _status;


  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loginPacientes(String email, String password) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final LoginPaciente data = await LoginAPI.instance.loginAccess(email, password);

    if(data.nombre!=null){
      this._loginPaciente = data;
      this._status = '${data.nombre} ${data.apaterno} ${data.amaterno}';
      
      await prefs.setStringList('user', [
        data.nombre,
        data.apaterno,
        data.amaterno,
        data.email,
        data.telefono,
        data.nacimiento,
        data.acceso
      ]);

    }else{
      this._status = '404';
    }
    update(['login']);
  }


}