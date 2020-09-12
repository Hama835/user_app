import 'package:app_user/components/custom_text_field.dart';
import 'package:app_user/components/navigate_next.dart';
import 'package:app_user/screens/sigup_page.dart';
import 'package:app_user/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const colors = [
  Colors.blue,
  Colors.lightBlue,
  Colors.lightBlueAccent,
];

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _phoneNumber;
  String _password;
  var _data;
  @override
  Widget build(BuildContext context) {
    _data = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _loginAsGuest();
                },
                child: NavigateNext(),
              ),
              Container(
                width: _data.size.width * 0.4,
                height: _data.size.height * 0.3,
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'images/hashtag.png',
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    'Dwrandaz',
                    style: kDwrandazTextStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
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
                        onPressed: () {},
                        color: Colors.white,
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
                        color: Colors.white70,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
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
                    TextFieldTitle(title: 'Phone'),
                    TextFields(
                      onChanged: (value) {
                        setState(() {
                          _phoneNumber = value;
                          print(_phoneNumber);
                        });
                      },
                      hintText: 'Enter your phone number',
                      obscureText: false,
                    ),
                    TextFieldTitle(
                      title: 'Password',
                    ),
                    TextFields(
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                          print(_password);
                        });
                      },
                      hintText: 'Enter your password',
                      obscureText: true,
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  height: 35.0,
                  width: _data.size.width * 0.4,
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
                        'Login',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginAsGuest() {
    _phoneNumber = '';
    _password = null;
    //Navigator.push(context, MaterialPageRoute(builder: (context) => RequestPage(),),);
  }

  Function _login() {}
}
