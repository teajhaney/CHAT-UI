import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CHAT UI',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blue[800],
      ),
      home: HomeScreen(),
    );
  }
}
