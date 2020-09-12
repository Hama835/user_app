import 'package:flutter/material.dart';
import 'package:app_user/components/navigate_next.dart';

class TopNavigation extends StatelessWidget {
  final onTap;
  TopNavigation({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 5.0),
            alignment: Alignment.centerRight,
            child: Text('Skip', style: TextStyle(fontSize: 16.0, color: Colors.white),),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: NavigateNext(),
        ),
      ],
    );
  }
}
