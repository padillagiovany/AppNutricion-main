import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:nutricion/api/notificationAPI.dart';
import 'package:nutricion/layouts/login.dart';
import 'package:nutricion/models/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsController extends GetxController{

  List<NotificationModel> _notifications = [];
  List<NotificationModel> get notifications => _notifications;

  List _user = [];
  List get user => _user;

  bool _status = false;
  bool get status => _status;

  @override
  void onReady() {
    super.onReady();
    loadNotifications();
  }

  Future<void> loadNotifications() async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List userData = prefs.getStringList('user');
      if(user == null){
        Get.off(
          Login(),
          transition: Transition.cupertinoDialog,
        );
      }else{
        _user = userData;
        final data  = await NotificationAPI.instance.getNotifications(userData[3]);
        _notifications = data;
        _status = true;
        update(['notificaciones']);
      }
    } catch (e) {
      print(e);
    }
    
  }

}