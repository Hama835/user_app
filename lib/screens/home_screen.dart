import 'package:provider/provider.dart';
import 'package:user_app/data/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data;



  @override
  Widget build(BuildContext context) {
    Provider.of<GetData>(context).getCarts();
    data=Provider.of<GetData>(context).services;
    Provider.of<GetData>(context).signUpUser(phone:'+9647824583938');

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
        ),

        body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i) {
            return Column(
              children: [
                Image.asset(data[2]["image"]),
                Text('${data[i]["title"]}+${data[i]["disc"]}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
