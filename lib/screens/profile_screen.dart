import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app/constants.dart';
import 'package:user_app/components/edit_profile.dart';
import 'package:user_app/components/flutter_map.dart';
import 'package:user_app/data/provider.dart';
import 'package:provider/provider.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 55, horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ListTile(
                leading: Text('Account', style: kTextStyle),
                trailing: FlatButton(
                  child: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(),
                      ),
                    );
                  },
                ),
              ),
              Divider(
                thickness: 3,
                color: Colors.black,
              ),
              SizedBox(
                height: 33,
              ),
              CircleAvatar(
                radius: 68,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 66,
                  backgroundImage: AssetImage('assets/uu.jpg'),
                ),
              ),
              Text(
                'Mohammad Amanj',
                style: kTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 33,
              ),
              ListTile(
                leading: Text(
                  'Phone      :',
                  style: kBodyTextStyle,
                ),
                title: Text(
                  '${Provider.of<GetData>(context).getPhone}',
                  style: kBodyTextStyle,
                ),
              ),
              ListTile(
                leading: Text(
                  'Address   :',
                  style: kBodyTextStyle,
                ),
                title: Text(
                  '${Provider.of<GetData>(context).getAddress}',
                  style: kBodyTextStyle,
                ),
              ),
              ListTile(
                leading: Text(
                  'Location  :',
                  style: kBodyTextStyle,
                ),
              ),
              Container(
                height: 300,
                child: Map(
                  setLatLng: (l) {
                    Provider.of<GetData>(context).setCurrentLatLong(
                      lat: l.latitude,
                      long: l.longitude,
                    );
                  },
                  getLong: Provider.of<GetData>(context).getCurrentLat,
                  getLat: Provider.of<GetData>(context).getCurrentLong,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
