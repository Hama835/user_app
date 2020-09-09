import 'package:flutter/material.dart';
import 'package:user_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:user_app/data/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditProfile extends StatelessWidget {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<GetData>(builder: (context, data, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            data.updateCus(
              name: addressController.text,
              address: addressController.text,
            );
            Navigator.of(context);
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 77,
            horizontal: 45,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Settings',
                  style: kTextStyle,
                ),
                SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  style: textFieldStyle,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Your name',
                    labelText: 'Name',
                    icon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                TextField(
                  controller: addressController,
                  keyboardType: TextInputType.name,
                  style: textFieldStyle,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'your address',
                    labelText: 'Address',
                    hoverColor: Colors.black,
                    icon: Icon(Icons.location_searching),
                  ),
                ),
                SizedBox(
                  height: 44,
                ),
                Text(
                  'Language',
                  style: kBodyTextStyle,
                ),
                SizedBox(
                  height: 12,
                ),
                ToggleSwitch(
                  minHeight: 44,
                  minWidth: 66,
                  activeBgColor: Colors.black,
                  initialLabelIndex: 0,
                  labels: ['kurdish', 'english', 'arabic'],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
                SizedBox(
                  height: 55,
                ),
                RaisedButton(
                  elevation: 12,
                  onPressed: () {},
                  child: Text(
                    'logout',
                    style: kBodyTextStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
