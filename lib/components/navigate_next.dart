import 'package:flutter/material.dart';

class NavigateNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5.0,
        right: 10.0,
      ),
      alignment: Alignment.centerRight,
      child: Icon(
        Icons.navigate_next,
        color: Colors.white,
        size: 35.0,
      ),
    );
  }
}
