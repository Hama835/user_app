import 'package:flutter/material.dart';

class TextFieldTitle extends StatelessWidget {
  final String title;

  TextFieldTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.0, left: 5.0),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
    );
  }
}

class TextFields extends StatefulWidget {
  final String hintText;
  final Function onChanged;
  final bool obscureText;

  TextFields({this.hintText, this.onChanged, this.obscureText});

  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      child: TextField(
        obscureText: widget.obscureText,
        keyboardType: TextInputType.text,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white24,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.7),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
