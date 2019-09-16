import 'package:flutter/material.dart';

import 'package:itec_app/src/bloc/provider.dart';
import 'package:itec_app/src/providers/person_provider.dart';
import 'package:itec_app/src/utils/utils.dart';

class LoginPage extends StatelessWidget {

  final personProvider = new PersonProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo( context ),
          _loginForm( context ),
        ],
      )
    );
  }

  Widget _loginForm(BuildContext context) {

    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),

          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            padding: EdgeInsets.symmetric( vertical: 20.0 ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text('Iniciar Sesion', style: TextStyle(fontSize: 20.0)),
                SizedBox( height: 20.0 ),
                _crearEmail( bloc ),
                SizedBox( height: 20.0 ),
                _crearPassword( bloc ),
                SizedBox( height: 20.0 ),
                _crearBoton( bloc )
              ],
            ),
            
          ),
          FlatButton(
            child: Text('Crear una nueva cuenta'),
            onPressed: ()=> Navigator.pushReplacementNamed(context, 'signin'),
          ), 
          SizedBox( height: 100.0 )
          
        ],
      ),
    );


  }

  Widget _crearEmail(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon( Icons.alternate_email, color: Color(0xFF1D3F57) ),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electrónico',
            //counterText: snapshot.data,
            errorText: snapshot.error
          ),
          onChanged: bloc.changeEmail,
        ),

      );


      },
    );


  }

  Widget _crearPassword(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon( Icons.lock_outline, color: Color(0xFF1D3F57) ),
              labelText: 'Contraseña',
              //counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),

        );

      },
    );


  }
  Widget _crearBoton( LoginBloc bloc) {

    // formValidStream
    // snapshot.hasData
    //  true ? algo si true : algo si false

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Color(0xFF1D3F57),
          textColor: Colors.white,
          onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
        );
      },
    );
  }

   _login(LoginBloc bloc, BuildContext context) async {
      
    Map info = await personProvider.login(bloc.email, bloc.password );

    if ( info['ok'] ) {
      Center(child: CircularProgressIndicator());
       Navigator.pushReplacementNamed(context, 'menumaterial');
    } else {
      mostrarAlerta( context, info['mensaje'] );
    }
    
  }


  Widget _crearFondo(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color(0xFF1D3F57),
            Color(0xFF1F636E)
          ]
        )
      ),
    );

     


    return Stack(
      children: <Widget>[
        fondoModaro, 
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            
            children: <Widget>[
              Icon( Icons.person_add, color: Colors.white, size: 100.0 ),
              SizedBox( height: 10.0, width: double.infinity ),
              Text('ITEC 2019', style: TextStyle( color: Colors.white, fontSize: 25.0 ))
              
               
               
         
            ],
          ),
        )

      ],
    );

  }

}