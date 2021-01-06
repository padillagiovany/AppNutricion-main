
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nutricion/api/loginAPI.dart';
import 'package:nutricion/models/signin_model.dart';

class SignInController extends GetxController{

  String _status = '';
  String get status => _status;

  bool _button = true;
  bool get button => _button;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> signIn(Map<String, dynamic> datos) async{
    _button = false;
    final SigninPaciente data = await LoginAPI.instance.signIn(datos);
    if(data.code!=null){
      _button = true;
      this._status = '200';
    }else{
      this._status = '404';
      _button = true;
    }
    update(['signin']);
  }

}