import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:get/state_manager.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nutricion/controllers/panel_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Panel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<PanelController>(
      id: 'panel',
      init: PanelController(),
      // ignore: missing_return
      builder: (_){
        if(_.started){
          switch (_.paymentCode) {
            case "200":
              return Scaffold(
                  appBar: GradientAppBar(
                    title: Text('Nutrición Integral'),
                    gradient: LinearGradient(
                        colors: [HexColor('#ac5a65'), HexColor('#771929')]
                    ),
                    actions: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.settings,
                                color: Colors.white
                              ),
                              onPressed: () {
                                Get.bottomSheet(
                                  Container(
                                    height: MediaQuery.of(context).size.height * 1,
                                    color: HexColor('#efefef'),
                                    child: ListView(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        children: [
                                          Card(
                                            child: Container(
                                              color: Colors.white,
                                              height: 45,
                                              child: Center(
                                                child: Text("Configuración",
                                                  style: TextStyle(
                                                    fontSize: 17.5,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                            color: HexColor('#efefef'),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 15.0),
                                            child: Text("PERFIL DE USUARIO", 
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold
                                              ),
                                            )
                                          ),
                                          profileItem(),
                                          Divider(),
                                          Container(
                                            height: 10,
                                            color: HexColor('#efefef'),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 15.0),
                                            child: Text("SESIÓN",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold
                                              ),
                                            )
                                          ),
                                          Container(
                                            height: 10,
                                            color: HexColor('#efefef'),
                                          ),
                                          InkWell(
                                              customBorder: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                              ),
                                              onTap: () {},
                                              splashColor: Colors.red,
                                              child: ListTile(
                                                  title: Text("Cerrar Sesión"),
                                                  onTap: (){
                                                    _.closeSession();
                                                  },
                                              ),
                                          ),
                                          Divider(),
                                          Container(
                                            height: 10,
                                            color: HexColor('#efefef'),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 15.0),
                                            child: Text("INFORMACIÓN",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold
                                              ),
                                            )
                                          ),
                                          Container(
                                            height: 10,
                                            color: HexColor('#efefef'),
                                          ),
                                          InkWell(
                                              customBorder: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                              ),
                                              onTap: () {},
                                              splashColor: Colors.red,
                                              child: ListTile(
                                                  title: Text("Acerca De"),
                                                  onTap: (){
                                                    _.goAbout();
                                                  },
                                              ),
                                          ),
                                          Divider(),
                                        ],
                                      )
                                  ),
                                );
                              },
                            )
                          ],
                  ),
                  body: Stack(
                    children: <Widget>[
                      Container(                        
                        padding: EdgeInsets.all(16),
                        child: ListView(
                          children: <Widget>[
                            Text('Hola'),
                            Text(_.user[1], 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'Arial',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold
                                ),
                            ),
                            Container(
                              height: 10,
                              color: HexColor('#efefef'),
                            ),
                            ExpansionCard(
                              background: 
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(HexColor('#771929').withOpacity(0.5), BlendMode.srcOver),
                                child: Image.asset('assets/recetario.jpg'),
                              ),
                              title: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "RECETARIO",
                                    ),
                                    Text(
                                      "Recetas digitales",
                                    ),
                                  ],
                                ),
                              ),
                              children: <Widget>[
                                Container(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  child: Text("Aqui podrás ver tu recetario digital.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 200.0,
                                  height: 30.0,
                                  buttonColor: HexColor('#771929'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: RaisedButton(
                                    onPressed: () {
                                      _.goToRecipes();
                                    },
                                    child: Text('VER RECETARIOS', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                            Container(height: 15,),
                            ExpansionCard(
                              background: 
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(HexColor('#771929').withOpacity(0.5), BlendMode.srcOver),
                                child: Image.asset('assets/ejercicio.jpg'),
                              ),
                              title: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "EJERCICIOS",
                                    ),
                                    Text(
                                      "Rutinas digitales",
                                    ),
                                  ],
                                ),
                              ),
                              children: <Widget>[
                                Container(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  child: Text("Aqui podrás ver algunos ejercicios en digital.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 200.0,
                                  height: 30.0,
                                  buttonColor: HexColor('#771929'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: RaisedButton(
                                    onPressed: () {
                                      _.goToRutine();
                                    },
                                    child: Text('VER EJERCICIOS', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                            Container(height: 15,),
                            ExpansionCard(
                              background: 
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(HexColor('#771929').withOpacity(0.5), BlendMode.srcOver),
                                child: Image.asset('assets/citas.jpg'),
                              ),
                              title: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "CITAS",
                                    ),
                                    Text(
                                      "Mis citas",
                                    ),
                                  ],
                                ),
                              ),
                              children: <Widget>[
                                Container(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  child: Text("Aqui podrás ver tus citas agendadas.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 200.0,
                                  height: 30.0,
                                  buttonColor: HexColor('#771929'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: RaisedButton(
                                    onPressed: () {
                                      _.goToCitas();
                                    },
                                    child: Text('VER CITAS', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                            Container(height: 15,),
                            ExpansionCard(
                              background: 
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(HexColor('#771929').withOpacity(0.5), BlendMode.srcOver),
                                child: Image.asset('assets/progreso.jpg'),
                              ),
                              title: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "PROGRESO",
                                    ),
                                    Text(
                                      "Mi progreso",
                                    ),
                                  ],
                                ),
                              ),
                              children: <Widget>[
                                Container(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  child: Text("Aqui podrás visualizar y registrar tus progresos.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 200.0,
                                  height: 30.0,
                                  buttonColor: HexColor('#771929'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Text('IR A MI PROGRESO', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal
                                    ),),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              break;
            case "300":
              return Scaffold(
                  appBar: GradientAppBar(
                    title: Text('Nutrición Integral'),
                    gradient: LinearGradient(
                        colors: [HexColor('#ac5a65'), HexColor('#771929')]
                    ),
                    actions: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.settings,
                                color: Colors.white
                              ),
                              onPressed: () {
                                Get.bottomSheet(
                                  Container(
                                    height: MediaQuery.of(context).size.height * 1,
                                    color: HexColor('#efefef'),
                                    child: ListView(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        children: [
                                          Card(
                                            child: Container(
                                              color: Colors.white,
                                              height: 45,
                                              child: Center(
                                                child: Text("Configuración",
                                                  style: TextStyle(
                                                    fontSize: 17.5,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                            color: HexColor('#efefef'),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 15.0),
                                            child: Text("PERFIL DE USUARIO", 
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold
                                              ),
                                            )
                                          ),
                                          profileItem(),
                                          Divider(),
                                          Container(
                                            height: 10,
                                            color: HexColor('#efefef'),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 15.0),
                                            child: Text("SESIÓN",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold
                                              ),
                                            )
                                          ),
                                          Container(
                                            height: 10,
                                            color: HexColor('#efefef'),
                                          ),
                                          InkWell(
                                              customBorder: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                              ),
                                              onTap: () {},
                                              splashColor: Colors.red,
                                              child: ListTile(
                                                  title: Text("Cerrar Sesión"),
                                                  onTap: (){
                                                    _.closeSession();
                                                  },
                                              ),
                                          ),
                                          Divider(),
                                          Container(
                                            height: 10,
                                            color: HexColor('#efefef'),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 15.0),
                                            child: Text("INFORMACIÓN",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold
                                              ),
                                            )
                                          ),
                                          Container(
                                            height: 10,
                                            color: HexColor('#efefef'),
                                          ),
                                          InkWell(
                                              customBorder: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                              ),
                                              onTap: () {},
                                              splashColor: Colors.red,
                                              child: ListTile(
                                                  title: Text("Acerca De"),
                                                  onTap: (){
                                                    _.goAbout();
                                                  },
                                              ),
                                          ),
                                          Divider(),
                                        ],
                                      )
                                  ),
                                );
                              },
                            )
                          ],
                  ),
                  body: Stack(
                    children: <Widget>[
                      Container(                        
                        padding: EdgeInsets.all(16),
                        child: ListView(
                          children: <Widget>[
                            Text('Hola'),
                            Text(_.user[1], 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'Arial',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold
                                ),
                            ),
                            Container(
                              height: 10,
                              color: HexColor('#efefef'),
                            ),
                            ExpansionCard(
                              background: 
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(HexColor('#771929').withOpacity(0.5), BlendMode.srcOver),
                                child: Image.asset('assets/recetario.jpg'),
                              ),
                              title: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "RECETARIO",
                                    ),
                                    Text(
                                      "Recetas digitales",
                                    ),
                                  ],
                                ),
                              ),
                              children: <Widget>[
                                Container(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text("Para disfrutar de tu recetario digital es necesario pagar por el contenido.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 200.0,
                                  height: 30.0,
                                  buttonColor: HexColor('#771929'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: RaisedButton(
                                    onPressed: () {
                                      Get.dialog(
                                        AlertDialog(
                                          title: Text("RECETARIOS"),
                                          content: Text("Para acceder al contenido digital de los recetarios es necesario que se efectue un pago con la nutriologa."),
                                          actions: <Widget>[
                                            FlatButton(
                                                  onPressed: () async {
                                                    _.sendWhatsApp();
                                                    Get.back();
                                                  }, 
                                                  child: Text('CONTACTAR'),
                                            ),
                                            FlatButton(
                                              child: Text("CERRAR"),
                                              onPressed: () {
                                                Get.back();
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    child: Text('MÁS INFO', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                            Container(height: 15,),
                            ExpansionCard(
                              background: 
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(HexColor('#771929').withOpacity(0.5), BlendMode.srcOver),
                                child: Image.asset('assets/ejercicio.jpg'),
                              ),
                              title: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "EJERCICIOS",
                                    ),
                                    Text(
                                      "Rutinas digitales",
                                    ),
                                  ],
                                ),
                              ),
                              children: <Widget>[
                                Container(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  child: Text("Aqui podrás ver algunos ejercicios en digital.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 200.0,
                                  height: 30.0,
                                  buttonColor: HexColor('#771929'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: RaisedButton(
                                    onPressed: () {
                                      _.goToRutine();
                                    },
                                    child: Text('VER EJERCICIOS', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                            Container(height: 15,),
                            ExpansionCard(
                              background: 
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(HexColor('#771929').withOpacity(0.5), BlendMode.srcOver),
                                child: Image.asset('assets/citas.jpg'),
                              ),
                              title: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "CITAS",
                                    ),
                                    Text(
                                      "Mis citas",
                                    ),
                                  ],
                                ),
                              ),
                              children: <Widget>[
                                Container(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  child: Text("Aqui podrás ver tus citas agendadas.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 200.0,
                                  height: 30.0,
                                  buttonColor: HexColor('#771929'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: RaisedButton(
                                    onPressed: () {
                                      _.goToCitas();
                                    },
                                    child: Text('VER CITAS', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                            Container(height: 15,),
                            ExpansionCard(
                              background: 
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(HexColor('#771929').withOpacity(0.5), BlendMode.srcOver),
                                child: Image.asset('assets/progreso.jpg'),
                              ),
                              title: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "PROGRESO",
                                    ),
                                    Text(
                                      "Mi progreso",
                                    ),
                                  ],
                                ),
                              ),
                              children: <Widget>[
                                Container(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  child: Text("Aqui podrás visualizar y registrar tus progresos.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: 200.0,
                                  height: 30.0,
                                  buttonColor: HexColor('#771929'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Text('IR A MI PROGRESO', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal
                                    ),),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              break;
            case "error":
                return Scaffold(
                  appBar: GradientAppBar(
                    title: Text('Nutrición Integral'),
                    gradient: LinearGradient(
                        colors: [HexColor('#ac5a65'), HexColor('#771929')]
                    ),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Lottie.asset(
                          'assets/lottiefiles/no_signal.json',
                          height: 200,
                        ),
                        Text(
                          'Error al cargar',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text('Revisa que tu conexión a internet no este limitada.'),
                        Container(
                          height: 10,
                        ),
                        ButtonTheme(
                            minWidth: 200.0,
                            height: 30.0,
                            buttonColor: HexColor('#771929'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: RaisedButton(
                              padding: EdgeInsets.all(10),
                              onPressed: () {
                                _.getUser();
                              },
                              child: Text('VOLVER A CARGAR', style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'Arial',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal
                              ),),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              break;
          }
        }else{
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Color(0xAAA02837)),
              ),
            ),
          );
        }
      },
    );
  }


  Widget profileItem(){
    return GetBuilder<PanelController>(
      init: PanelController(),
      builder: (_){
        return ListTile(
          leading: Icon(Icons.account_circle, color: HexColor('#ac5a65'), size: 50.0,),
          title: Text(
            _.user[1] +" "+_.user[2]+" "+_.user[3],
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: 
              Text("Ver perfil", style: TextStyle(color: Colors.black),
          ),
          onTap: (){
            _.goToProfile();
          },
        );
      },
    );
  }

}