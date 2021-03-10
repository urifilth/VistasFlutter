import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(context),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage(
            'https://static.photocdn.pt/images/articles/2018/12/03/articles/2017_8/mountain-landscape-ponta-delgada-island-azores-picture-id944812540.jpg'),
            height: 200.0,
            fit: BoxFit.cover
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, //alinea al inicio de manera horizontal
                children: <Widget>[
                  Text('Vista panorámica', style: estiloTitulo),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text('Vista desde una montaña :D', style: estiloSubTitulo)
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.redAccent,
              size: 30.0,
            ),
            Text(
              '31',
              style: TextStyle(fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _crearAccion(Icons.call, 'Call'),
        _crearAccion(Icons.near_me, 'Route'),
        _crearAccion(Icons.share, 'Share'),
      ],
    );
  }

  Widget _crearAccion(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
          size: 30.0,
        ),
        SizedBox(height: 6.0),
        Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue)),
      ],
    );
  }

  Widget _crearTexto(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
        child: Column(
          children: <Widget>[
            Text(
              'Eu ut voluptate qui dolor qui est officia sunt voluptate do proident quis nostrud quis. Culpa laboris incididunt nisi pariatur aute elit cupidatat. Ex nisi laborum mollit est laboris nulla laborum culpa consectetur irure. Mollit reprehenderit ipsum laboris nisi et. Culpa veniam minim cupidatat commodo sit exercitation deserunt ad elit. Nisi anim voluptate laboris aliquip tempor. Incididunt dolor magna exercitation ea dolore officia fugiat reprehenderit culpa est.',
              style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold,),
              textAlign: TextAlign.justify,
            ),
            RaisedButton(
              disabledColor: Colors.teal,
              splashColor: Colors.teal,
              color: Colors.blueAccent,
              padding: EdgeInsets.symmetric(horizontal: 150.0),
              textColor: Colors.white,
              animationDuration: Duration(milliseconds: 150),
              child: Text('Ir a esquema'),
              onPressed: (){
                Navigator.pushNamed(context, 'botones');
              },
            ),
            /*FloatingActionButton(
              child: Icon(Icons.arrow_forward),
              backgroundColor: Colors.teal,
              elevation: 50.0,
              onPressed: (){
                Navigator.popAndPushNamed(context, 'botones');
              },
            )*/
          ],
        ),
      ),
    );
  }
}
