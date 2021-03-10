import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:ui';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _botonesRedondeados(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
          ],
        ),
      ),
    );

    final cajaRosada = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 171),
            ],
          ),
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100,
          child: cajaRosada,
        ),
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Classify transaction',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Classify this transaction into a particular category',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
//CAMBIA LAS PROPIEDADES DE LA BOTTOMNAVIGATION BAR
    return Theme(
      data: Theme.of(context).copyWith(
          //CAMBIA EL COLOR DE FONDO DE LA BARRA
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          //CAMBIA EL COLOR DEL ITEM PRINCIPAL
          primaryColor: Colors.pinkAccent,
          //CAMBIA EL COLOR DE LOS OTROS ITEMS
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 30.0),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment, size: 30.0),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, size: 30.0),
            title: Container(),
          ),
        ],
      ),
    );
  }

  Widget _botonesRedondeados() {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.blue, Icons.drag_indicator, 'General' ),
            _crearBotonRedondeado( Colors.purple.shade300, Icons.directions_bus, 'Transport' ),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.pink[200], Icons.shopping_bag, 'Shopping' ),
            _crearBotonRedondeado( Colors.orange[300], Icons.attach_money, 'Bills' ),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.blue[900], Icons.movie, 'Entertainment' ),
            _crearBotonRedondeado( Colors.green[400], Icons.fastfood, 'Grocery' ),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado( Colors.red, Icons.collections, 'photos' ),
            _crearBotonRedondeado( Colors.teal, Icons.help_outline, 'Help' ),
          ],
        ),
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icono, String texto) {
    //SI SE USA UN BLUR HAY QUE USAR UN CLIPRECT PARA QUE EL WIDGET PRINCIPAL SE APLIQUE BIEN
    return ClipRect(
      //EN EL CHILD DEL CLIPRECT COLOCAMOS EL BACKDROPFILTER
      child: BackdropFilter(
        //EN EL FILTER COLOCAMOS EL BLUR :D
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.70),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(
                  icono,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              Text(
                texto,
                style: TextStyle(color: color),
              ),
              SizedBox(
                height: 5.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
