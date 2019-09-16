import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'avatar': Icons.list,
  'input': Icons.input,
  'tune': Icons.tune,
  'list': Icons.list,
  'calendar_today': Icons.calendar_today,
  'schedule': Icons.schedule,
  'people': Icons.people,
  'announcement': Icons.announcement,
  'home': Icons.home,
  'cerrar': Icons.account_circle,
  'gps':Icons.person_pin_circle

};



Icon getIcon (String nombreIcono){
  return Icon(_icons[nombreIcono], color: Colors.blue);
}