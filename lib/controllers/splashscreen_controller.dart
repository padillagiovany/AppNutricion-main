import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:nutricion/layouts/login.dart';
import 'package:nutricion/layouts/panel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
   
  @override
  void onReady() {
    super.onReady();
    checkUser();
  }

  void checkUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List user = prefs.getStringList('user');
      if(user == null){
        Future.delayed(Duration(seconds: 2), () {
              Get.off(
                Login(),
                transition: Transition.cupertinoDialog,
              );
        });
      }else{
        Future.delayed(Duration(seconds: 2), () {
          Get.off(
            Panel(),
            transition: Transition.cupertinoDialog,
          );
        });
      }
    } catch (e) {
      print(e);
    }
  }


}
