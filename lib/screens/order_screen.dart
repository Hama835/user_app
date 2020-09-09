import 'package:flutter/material.dart';
import 'package:user_app/constants.dart';
import 'package:user_app/data/provider.dart';
import 'package:user_app/data/getprogressrequests.dart';
class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.blueGrey,
            elevation: 11,
            bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: [
                Tab(icon: Icon(Icons.access_time),text: 'current',),
                Tab(icon: Icon(Icons.history),text: 'history',),
              ],
            ),
            title: Text(
                'Orders',
              style: kTextStyle,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(21),
            child: TabBarView(
              children: <Widget>[
              ListView.builder(
            itemBuilder: (BuildContext context,i){
              return null;
            }
            ),
                ListView(
                  children:const <Widget>[
                    Text('wdjoiwd'),
                    Text('wdjoiwd'),
                    Text('wdjoiwd'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
