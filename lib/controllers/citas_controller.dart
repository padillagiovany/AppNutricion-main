import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:nutricion/api/notificationAPI.dart';
import 'package:nutricion/layouts/login.dart';
import 'package:nutricion/models/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/standalone.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationsController extends GetxController{

  List<NotificationModel> _notifications = [];
  List<NotificationModel> get notifications => _notifications;

  List _user = [];
  List get user => _user;

  bool _status = false;
  bool get status => _status;

  bool _notificationStatus = false;
  bool get notificationStatus => _notificationStatus;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

  @override
  void onInit() {
    super.onInit();
    initializing();
    tz.initializeTimeZones();
  }

  @override
  void onReady() {
    super.onReady();
    loadNotifications();
  }


  void initializing() async {
    androidInitializationSettings = AndroidInitializationSettings('app_icon');
    iosInitializationSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
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
        if(data[0].fechaCita != null){
          _notifications = data;
          _status = true;
          _notificationStatus = true;
        }else{
          _status = false;
          _notificationStatus = false;
        }
        update(['notificaciones']);
      }
    } catch (e) {
      print(e);
    }
  }

  _showNotifications(String date, String not, int id, String body) async {
  
    await notificationSchedule(date, not, id, body);
  }

  Future<void> notificationSchedule(String date, String not, int id, String body) async {
    //var timeDelayed = DateTime.now().add(Duration(days: 1, seconds: 25));
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'second channel ID', 'second Channel title', 'second channel body',
            priority: Priority.high,
            importance: Importance.max,
            ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails, iOS: iosNotificationDetails);
    
    var horaCita = DateTime.parse(date);
    var notificacion = DateTime.parse(not);


    print("$id.- HORA PREVIA --------------------------> $horaCita");
    print("$id.- HORA CITA -----------------------------> $notificacion");
    print(new DateTime.now());
    if(notificacion.isBefore(new DateTime.now())){
      print("Ya pasó");
    }else{
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,'Recordatorio Cita','Tienes una cita a las ${horaCita.hour}:${horaCita.minute}. NOTA: $body',
        TZDateTime.parse(tz.getLocation('America/Mexico_City'),not),
        notificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime
      );
    }
    
    print(flutterLocalNotificationsPlugin.pendingNotificationRequests().toString());
  }

  Future onSelectNotification(String payLoad) {
    if (payLoad != null) {
      print(payLoad);
    }
    // we can set navigator to navigate another screen
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print("");
            },
            child: Text("Okay")),
      ],
    );
  }

  bool getNotificationTime(String not){
    var notificacion = DateTime.parse(not);
    bool state = false;
    if(!notificacion.isBefore(new DateTime.now())){
      state = true;
    }
    return state;
  }

}