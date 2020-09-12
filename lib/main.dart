import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_application/screens/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Service',
        home: CategoryScreen());
  }
}
