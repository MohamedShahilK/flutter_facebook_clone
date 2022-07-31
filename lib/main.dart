import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_clone/color/colors.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Facebook Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: ColorPalette.scaffold,
        textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(
            // primary: Colors.red, // Button color
            onPrimary: Colors.black, // Text color
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
