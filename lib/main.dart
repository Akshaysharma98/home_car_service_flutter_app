import 'package:flutter/material.dart';
import 'package:hcr/SignUp.dart';
import 'LoginPage.dart';
import 'package:flutter/rendering.dart';

// void main() => runApp(MyApp());
  void main() {
    debugPaintSizeEnabled = false;
    runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login' ,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),
    );
  }
}

