import 'package:flutter/material.dart';
import 'package:itec_app/src/bloc/login_bloc.dart';
export 'package:itec_app/src/bloc/login_bloc.dart';

import 'package:itec_app/src/bloc/singin_bloc.dart';
export 'package:itec_app/src/bloc/singin_bloc.dart';

import 'package:itec_app/src/bloc/activity_bloc.dart';
export 'package:itec_app/src/bloc/activity_bloc.dart';

class Provider extends InheritedWidget {
  final loginBloc      = new LoginBloc();
  final singinBloc     = new SigninBloc();
  final activityBloc     = new ActivityBloc();
  static Provider _instancia;

  factory Provider({ Key key, Widget child }) {

    if ( _instancia == null ) {
      _instancia = new Provider._internal(key: key, child: child );
    }

    return _instancia;

  }

  Provider._internal({ Key key, Widget child })
    : super(key: key, child: child );

 

  // Provider({ Key key, Widget child })
  //   : super(key: key, child: child );

 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of ( BuildContext context ) {
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider ).loginBloc;
  }
  static SigninBloc signinBloc ( BuildContext context ) {
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider ).singinBloc;
  }

  static ActivityBloc activityBlocOf ( BuildContext context ) {
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider ).activityBloc;
  }
}