import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{
  bool _status = false;
  bool get status => _status;

  List _profile = [];
  List get profile => _profile;

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
}