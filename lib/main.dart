import 'package:flutter/material.dart';
import 'package:uber_client_clone/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wate',
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
