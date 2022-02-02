import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
      splashColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ).copyWith(secondary: Colors.yellowAccent, primary: Colors.purple),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        headline5: TextStyle(fontStyle: FontStyle.italic,  fontSize: 25, color: Colors.white),
        bodyText1: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent),
        bodyText2: TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
