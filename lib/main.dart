import 'package:flutter/material.dart';

import 'Screens/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF17082A),
      ),
      home: const HomePage(),
    );
  }
}
