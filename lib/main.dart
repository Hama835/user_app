import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_application/data/provider.dart';

import 'components/navigation_bar.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetData>(
      create: (context) => GetData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavBar(),
      ),
    );

  }
}
