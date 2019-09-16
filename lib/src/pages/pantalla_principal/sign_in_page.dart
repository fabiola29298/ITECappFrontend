import 'package:flutter/material.dart';

import 'package:itec_app/src/bloc/provider.dart';
import 'package:itec_app/src/providers/person_provider.dart';
import 'package:itec_app/src/utils/utils.dart'; 

class SignInPage extends StatefulWidget {
   
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final personProvider = new PersonProvider(); 
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo( context ),
          _registerForm( context ),
        ],
      )
    );
  }

  Widget _registerForm(BuildContext context) {

    final bloc = Provider.signinBloc(context);
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
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric( vertical: 50.0 ),
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
                Text('Registrarse', style: TextStyle(fontSize: 20.0)),
                SizedBox( height: 10.0 ),
                Text('Datos obligatorios (*) \nContraseña con minimo 6 caracteres', style: TextStyle(fontSize: 12.0)),
                _crearName(bloc),
                SizedBox( height: 12.0 ),
                _crearLastname(bloc),
                SizedBox( height: 12.0 ),
                _crearEmail( bloc ),
                SizedBox( height: 12.0 ),
                _crearPassword( bloc ),
                SizedBox( height: 12.0 ),
                _crearGenero(bloc),
                SizedBox( height: 12.0 ),
                _creartipoInscripcion(bloc),
                SizedBox( height: 12.0 ),
                _crearCarrera(bloc),
                SizedBox( height: 12.0 ),
                

                _crearBoton( bloc ),
                
              ],
            ),
            
          ),
          FlatButton(
            child: Text('¿Ya tienes cuenta? Login'),
            onPressed: ()=> Navigator.pushReplacementNamed(context, 'login'),
          ), 
          SizedBox( height: 100.0 )
          
        ],
      ),
    );


  }

  Widget _crearEmail(SigninBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon( Icons.alternate_email, color:  Color(0xFF1D3F57)  ),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electrónico*',
            //counterText: snapshot.data,
            errorText: snapshot.error
          ),
          onChanged: bloc.changeEmail,
        ),

      );


      },
    );


  }

  Widget _crearName (SigninBloc bloc) {

    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon( Icons.person, color:  Color(0xFF1D3F57)  ),
            hintText: 'nombre',
            labelText: 'Nombres*',
            //counterText: snapshot.data,
            errorText: snapshot.error
          ),
          onChanged: bloc.changeName,
        ),

      );


      },
    );


  }

  Widget _crearLastname (SigninBloc bloc) {

    return StreamBuilder(
      stream: bloc.lastnameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon( Icons.person_outline, color:  Color(0xFF1D3F57)  ),
            hintText: 'apellido',
            labelText: 'Apellidos*',
            //counterText: snapshot.data,
            errorText: snapshot.error
          ),
          onChanged: bloc.changeLastname,
        ),

      );


      },
    );


  }

  Widget _crearPassword(SigninBloc bloc) {

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon( Icons.lock_outline, color:  Color(0xFF1D3F57)  ),
              labelText: 'Contraseña*',
              //counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),

        );

      },
    );


  }


  
  
  Widget _crearGenero(SigninBloc bloc) {

    return StreamBuilder(
      stream: bloc.genderStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        

        child:  DropdownButton<String>(
        
        value: snapshot.data,
        
        hint: new Text('Genero'),
        icon: Icon(Icons.arrow_drop_down), iconSize: 30, isExpanded: true, elevation: 16,
        underline: Container( height: 2, color:  Color(0xFF1D3F57)  ),
        onChanged: (String newValue) {
          setState(() { 
            bloc.changeGender(newValue);         
          });
        }, 
        items: <String>['Femenino', 'Masculino', 'Otro' ]
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value), );
          })
          .toList() 
      ),
      );
//<String>
          
      },
    );


  }

  
  Widget _crearCarrera(SigninBloc bloc) {

    return StreamBuilder(
      stream: bloc.careerStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        

        child:  DropdownButton<String>(
        
        value: snapshot.data,
        hint: new Text('Carrera'),
        icon: Icon(Icons.arrow_drop_down), iconSize: 30, isExpanded: true, elevation: 16,
        underline: Container( height: 2, color:  Color(0xFF1D3F57) ),
        onChanged: (String newValue) {
          setState(() { 
             bloc.changeCareer(newValue);
          });
        },
        items: <String>['Ing. de Telecomunicaciones', 'Ing. de Sistemas', 'Ing. Mecatrónica','Ing. Biomédica','Ing. Civil', 'Ing. Quimica']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value), );
          })
          .toList(),
      ),
      );
      },
    );


  }

  
  Widget _creartipoInscripcion(SigninBloc bloc) {

    return StreamBuilder(
      stream: bloc.typeStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        

        child:  DropdownButton<String>(
        
        value: snapshot.data,
        hint: new Text('Tipo de inscripción'),
        icon: Icon(Icons.arrow_drop_down), iconSize: 30, isExpanded: true, elevation: 16,
        underline: Container( height: 2, color:  Color(0xFF1D3F57)   ),
        onChanged: (String newValue) {
          setState(() { 
             bloc.changeType(newValue);
          });
        },
        items: <String>['Miembro IEEE', 'Estudiante', 'Profesional','Solo taller','Solo 2 charlas','Solo hackathon']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value), );
          })
          .toList(),
      ),
      );
      },
    );


  }
  Widget _crearBoton( SigninBloc bloc) {

    // formValidStream
    // snapshot.hasData
    //  true ? algo si true : algo si false

    return StreamBuilder(
      stream: bloc.fromValidStram,
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
          color:  Color(0xFF1D3F57) ,
          textColor: Colors.white,
          onPressed:  (){
            if (bloc.name ==null || bloc.lastname ==null || bloc.email ==null || bloc.password ==null){
              mostrarAlerta(context, 'Falta datos de registro');
              return;
            }
            if (bloc.name =='' || bloc.lastname =='' || bloc.email =='' || bloc.password ==''){
              mostrarAlerta(context, 'Falta datos de registro');
              return;
            }
            _register(bloc, context);
          }   
        );
      },
    );
  }

   _register(SigninBloc bloc, BuildContext context) async {
     String career ='', type='', gender ='';
            if (bloc.career !=null ){
              career=bloc.career;
            }
            if (bloc.gender !=null ){
              type=bloc.gender;
            }
            if (bloc.type !=null ){
              gender=bloc.type;
            }
    Map info = await personProvider.nuevoUsuario(bloc.name, bloc.lastname, bloc.email, bloc.password, gender, career, type );
    mostrarCargando( context,'Guardando su registro'  );
    if ( info['ok'] ) {
      Navigator.of(context).pop();
       Navigator.pushReplacementNamed(context, 'menumaterial');
    } else {
      Navigator.of(context).pop();
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
            children: <Widget>[
              Icon( Icons.person, color: Colors.white, size: 100.0 ),
              SizedBox( height: 10.0, width: double.infinity ),
              Text('ITEC 2019', style: TextStyle( color: Colors.white, fontSize: 25.0 ))
            ],
          ),
        )

      ],
    );

  }
}