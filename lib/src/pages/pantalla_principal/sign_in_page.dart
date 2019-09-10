import 'package:flutter/material.dart'; 

//import 'package:itec_app/src/utils/utils.dart' as utils;
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
   final formKey     = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text('Registrarse'),
             
          ),
          body:    SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[ 
                    _crearNombre(),
                    _crearApellido(),
                    _crearCorreo(),
                    _crearGenero(),
                    _crearCarreraU(),
                    _crearTipoInscripcion(),
                    _crearPassword(), 
                    SizedBox(height: 20.0,) ,
                    _crearBoton()
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _crearNombre() {

    return TextFormField( 
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre*'
      ), 
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese solo sus nombres';
        } else {
          return null;
        }
      },
      
    );

  }

  Widget _crearApellido(){
    return TextFormField( 
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Apellido*'
      ),  
    );

  }
  Widget _crearCorreo(){
    return TextFormField( 
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Correo electronico*'
      ),  
    );
  }
  Widget _crearGenero(){
    return TextFormField( 
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Genero*'
      ),  
    );
  }
  Widget _crearCarreraU(){
    return TextFormField( 
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Carrera universitaria (opcional)'
      ),  
    );
  }
  Widget _crearTipoInscripcion(){
    return TextFormField( 
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Tipo de inscripcion*'
      ),  
    );
  }
  Widget _crearPassword(){
    return TextFormField( 
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Contraseña'
      ),  
    );
   }
  /*
  Widget _crearPrecio() {
    return TextFormField(
     // initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
     /* onSaved: (value) => producto.valor = double.parse(value),
     */
       validator: (value) {

        if ( utils.isNumeric(value)  ) {
          return null;
        } else {
          return 'Sólo números';
        }

      },
      
    );
  }
  */
  Widget _crearBoton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), 
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        textColor: Colors.white,
        label: Text('Guardar'),
        icon: Icon( Icons.save ),
        onPressed: _submit,
      ),
    );
  }

    void _submit() async {
      if ( !formKey.currentState.validate() ) return;
      formKey.currentState.save();
      print('Todo Ok@');
     
  }
}