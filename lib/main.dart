
import 'package:flutter/material.dart';
import 'package:itogovaya_rabota/screens/details.dart';
import 'package:itogovaya_rabota/global_theme.dart';
import 'package:itogovaya_rabota/screens/login.dart';
import 'package:itogovaya_rabota/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/detail': (context) => ScreenProfile(user: null,),
        '/home': (context) => const MyHomePage(),
        '/login': (context) => const Login(),
      },
      title: 'Дипломная работа',
      theme: globalTheme(),
      home: const Login(),
    );
  }
}

