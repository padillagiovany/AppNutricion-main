import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:about/about.dart';
import 'package:hexcolor/hexcolor.dart';

class AcercaDe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIos = theme.platform == TargetPlatform.iOS ||
        theme.platform == TargetPlatform.macOS;

    const Widget aboutPage = AboutPage(
      title: Text('Acerca de'),
      applicationVersion: 'Version {{ version }}, build {{ buildNumber }}.',
      applicationDescription: Text(
        'Nutrición integral es una aplicación móvil la cual tiene como principal objetivo que los pacientes'+
        'puedan llevar una mejor administración de sus datos de progreso, así como una mayor'+
        'comunicación después de la consulta con el especialista en nutrición, añadiendo características'+
        'adicionales para hacer del usuario una mejor experiencia.',
        textAlign: TextAlign.justify,
      ),
      applicationIcon: const SizedBox(
        width: 100,
        height: 100,
        child: Image(
          image: AssetImage('assets/icon.png'),
        ),
      ),
      applicationLegalese: 'ITIC Juan Jovany Padilla Avila, {{ year }}',
    );

    if (isIos) {
      return CupertinoApp(
        title: 'Nutricion Integral',
        debugShowCheckedModeBanner: false,
        home: aboutPage,
        theme: CupertinoThemeData(
          brightness: theme.brightness,
          primaryColor: HexColor('#ac5a65')
        ),
      );
    }

    return MaterialApp(
      title: 'Nutricion Integral',
      debugShowCheckedModeBanner: false,
      home: aboutPage,
      theme: ThemeData(
        primaryColor: HexColor('#ac5a65')
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}