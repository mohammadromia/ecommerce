// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
const COLOR_PRIMARY = Colors.deepOrangeAccent;
const COLOR_ACCENT = Colors.orange;

ThemeData lightTheme = ThemeData(
  appBarTheme:  const AppBarTheme(backgroundColor: Color(0xfffdfbda),titleTextStyle: TextStyle(color: Color(0xff2d4569,),fontSize: 20)  ),
  bottomNavigationBarTheme:  const BottomNavigationBarThemeData(

    selectedItemColor: Color.fromARGB(255, 50, 116, 214)
    ,unselectedItemColor: Colors.grey
    
    ),
  brightness: Brightness.light,
  primaryColor: const Color(0xff2d4569),


);

ThemeData darkTheme = ThemeData(
  appBarTheme:  const AppBarTheme(backgroundColor: Color.fromARGB(255, 32, 31, 31) ,titleTextStyle: TextStyle(color: Color(0xff2d4569),fontSize: 20)),

  bottomNavigationBarTheme:  const BottomNavigationBarThemeData(

    selectedItemColor: Color.fromARGB(255, 50, 116, 214)
    ,unselectedItemColor: Color.fromARGB(255, 175, 163, 163)
    
    ),
    brightness: Brightness.dark,
    hintColor: Colors.white,

);





