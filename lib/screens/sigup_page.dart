import 'package:app_user/components/custom_text_field.dart';
import 'package:app_user/components/navigate_next.dart';
import 'package:app_user/components/top_navigation.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _username;
  String _phone;
  String _password;
  String _address;
  var _data;

  @override
  Widget build(BuildContext context) {
    _data = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.lightBlue,
              Colors.lightBlueAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: <Widget>[
            TopNavigation(onTap: _loginAsGuest,),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 40,
                      right: 5.0,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 2.5),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2.5),
                    margin: EdgeInsets.only(
                      right: 40,
                      left: 5.0,
                    ),
                    child: RaisedButton(
                      disabledElevation: 5.0,
                      elevation: 5.0,
                      color: Colors.white,
                      onPressed: () {
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10.0,
              ),
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFieldTitle(
                    title: 'Username',
                  ),
                  TextFields(
                    hintText: 'Enter your username',
                    obscureText: false,
                    onChanged: (value) {
                      _username = value;
                      print(_username);
                    },
                  ),
                  TextFieldTitle(
                    title: 'Phone',
                  ),
                  TextFields(
                    hintText: 'Enter your phone number',
                    obscureText: false,
                    onChanged: (value) {
                      _phone = value;
                      print(_phone);
                    },
                  ),
                  TextFieldTitle(
                    title: 'Password',
                  ),
                  TextFields(
                    hintText: 'Enter your password',
                    obscureText: true,
                    onChanged: (value) {
                      _password = value;
                      print(_password);
                    },
                  ),
                  TextFieldTitle(
                    title: 'Address',
                  ),
                  TextFields(
                    hintText: 'Enter your your address',
                    obscureText: false,
                    onChanged: (value) {
                      _address = value;
                      print(_address);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Center(
                child: Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              height: 35.0,
              width:_data.size.width * 0.4,
              child: RaisedButton(
                elevation: 5.0,
                onPressed: () {},
                color: Colors.white,
                disabledColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
void _loginAsGuest(){}
}
