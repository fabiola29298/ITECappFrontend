import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2(context)
        ],
      ),
    );
  }

  Widget _pagina1(){
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos()
      ],
    );
  }
  Widget _pagina2(BuildContext context){
    return Container(
      width:  double.infinity,
      height: double.infinity,
      color:Color.fromRGBO(24, 64, 87, 1.0),
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
              shape: StadiumBorder(),
              color: Color(0xFF1F396E),
              textColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                child: Text('Iniciar Sesion', style: TextStyle(fontSize: 20.0),),
              ),
              onPressed: (){
                Navigator.pushNamed(context, 'login' );
              },
            ),
            SizedBox(height: 10.0,),

            RaisedButton(
              
              shape: StadiumBorder(),
              color: Color(0xFF1F396E),
              textColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                
                child: Text('Registrarse    ', style: TextStyle(fontSize: 20.0),),
              ),
              onPressed: (){
                Navigator.pushNamed(context, 'signin' );
              },
            ),
            SizedBox(height: 10.0,),

            RaisedButton(
              shape: StadiumBorder(),
              color: Color(0xFF1F396E),
              textColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                child: Text('   Invitado    ', style: TextStyle(fontSize: 20.0),),
              ),
              onPressed: (){
                Navigator.pushNamed(context, 'menumaterial' );
              },
            ),
          ],
        )
        
      
    );
  }

  Widget _colorFondo(){
    return Container(
      width:  double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(24, 64, 87, 1.0)
    );
  }
  Widget _imagenFondo(){
    return Container(
      width:  double.infinity,
      height: double.infinity, 
      child: Image(image: AssetImage('assets/img/fondopantalla.png'),
        fit:BoxFit.cover),

    );
  }
  Widget _textos(){
    final estilo = TextStyle(color: Colors.white, fontSize: 56.0);
    return SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              //Text('ITEC 2019', style: estilo),
              //Text('UCB', style: estilo),
              Expanded(
                child: Container(),
              ),
              Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white),
            ],
      ),
    );
  }
}