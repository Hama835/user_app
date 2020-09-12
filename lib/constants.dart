// This class consist of whole constants that we inside the app such as
// Text Style or Text decoration.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TextStyle serviceItemTitle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

const TextStyle serviceItemType =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

const kTextStyle = TextStyle(
  fontSize: 30,
  color: CupertinoColors.black,
  fontWeight: FontWeight.bold,
);
const kBodyTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);
const kTextFieldDecoration = InputDecoration(
  hintText: '',
  labelText: '',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25.0),
    ),
  ),
  labelStyle: TextStyle(
    color: Colors.black,
  ),
  hintStyle: TextStyle(
    color: Colors.blueGrey,
  ),
);
const textFieldStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w900,
  fontSize: 20.0,
);
