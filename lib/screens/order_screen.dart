import 'package:flutter/material.dart';

import '../constants.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            shadowColor: Colors.blueGrey,
            elevation: 11,
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.access_time),text: 'current',),
                Tab(icon: Icon(Icons.history),text: 'history',),
              ],
            ),
            title: Text(
                'Orders',
              style: kTextStyle.copyWith(
                color: Colors.white
              ),
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
