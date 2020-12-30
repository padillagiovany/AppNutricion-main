import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nutricion/api/loginAPI.dart';
import 'package:nutricion/layouts/acercade/acerca_de.dart';
import 'package:nutricion/layouts/citas/citas.dart';
import 'package:nutricion/layouts/login.dart';
import 'package:nutricion/layouts/perfil/perfil.dart';
import 'package:nutricion/layouts/recetarios/menu_recetarios.dart';
import 'package:nutricion/layouts/recetarios/recetario_viewer.dart';
import 'package:nutricion/layouts/rutina/rutina.dart';
import 'package:nutricion/models/payment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PanelController extends GetxController{
  List _user = [];
  List get user => _user;

  bool _started = false;
  bool get started => _started;

  String _paymentCode = 'error';
  String get paymentCode => _paymentCode;

  bool _status = false;
  bool get status => _status;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  @override
  void onReady() {
    super.onReady();
    
  }

  Future<void> checkPayment(String email) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final Payment data = await LoginAPI.instance.checkPayment(email);

      try {
        if(data.response != null){
          
          await prefs.setStringList('payment', [
            data.code,
          ]);
          _started = true;
          _paymentCode = data.code;
          update(['panel']);
        }
      } catch (e) {
        _started = true;
        _paymentCode = 'error';
        update(['panel']);
      }
      
  }

  void getUser() async{
     try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List data = prefs.getStringList('user');
      if(user == null){
        Get.off(
          Login(),
          transition: Transition.cupertinoDialog,
        );
      }else{
        _user = data;
        checkPayment(data[3]);
      }
    } catch (e) {
      print(e);
    }
  }


  void goToProfile(){
    Get.to(PerfilUsuario(), preventDuplicates:false, transition: Transition.cupertinoDialog);
  }

  void goToRecipes(){
    Get.to(MenuRecetarios(), preventDuplicates:false, transition: Transition.cupertinoDialog);
  }

  void goToCitas(){
    Get.to(Citas(), preventDuplicates:false, transition: Transition.cupertinoDialog);
  }

   void goAbout(){
    Get.to(AcercaDe(), preventDuplicates:false, transition: Transition.cupertinoDialog);
  }

  void viewPDF1(){
    Get.to(RecetarioViewer(), preventDuplicates:false, transition: Transition.cupertinoDialog, arguments: ['Recetario General','1.pdf']);
  }

  void viewPDF2(){
    Get.to(RecetarioViewer(), preventDuplicates:false, transition: Transition.cupertinoDialog, arguments: ['Recetario Aguas Frescas','2.pdf']);
  }

  void viewPDF3(){
    Get.to(RecetarioViewer(), preventDuplicates:false, transition: Transition.cupertinoDialog, arguments: ['Recetario Healty','3.pdf']);
  }

  void goToRutine(){
    Get.to(Rutina(), preventDuplicates:false, transition: Transition.cupertinoDialog);
  }

  void closeSession() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Get.offAll(Login(), transition: Transition.cupertinoDialog);
  }
}