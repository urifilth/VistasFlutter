import 'package:disenos/src/pages/basico_page.dart';
import 'package:disenos/src/pages/botones_page.dart';
import 'package:disenos/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

//TODO ESTE CÓDIGO MODIFICA LOS COLORES DE LA BARRA DE TAREAS Y LA BARRA DE NAVEGACIÓN EN ANDROID //
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black87,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'scroll',
      routes: {
        'basico'  : (BuildContext context) => BasicoPage(),
        'scroll'  : (BuildContext context) => ScrollPage(),
        'botones' : (BuildContext context) => BotonesPage(),
      },
    );
  }
}