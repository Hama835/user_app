import 'package:flutter/material.dart';
import 'components/navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:user_app/data/provider.dart';

void main() => runApp(UserApp());

class UserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => GetData(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Color(0xffFAFDFF),
        ),
        home:NavBar(),
      ),
    );
  }
}
