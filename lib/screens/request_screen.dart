import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app/constants.dart';
import 'package:user_app/components/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:user_app/data/provider.dart';

class RequistScreen extends StatelessWidget {
  final TextEditingController addressController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  bool icon = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       // backgroundColor: Colors.blue,
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Mh1 Company',
                    style: kTextStyle,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Consumer<GetData>(builder: (context, getData, child) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(33),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 15,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 500,
                            child: Map(
                              setLatLng: (l) {
                                Provider.of<GetData>(context).setRequestLatLong(
                                  lat: l.latitude,
                                  long: l.longitude,
                                );
                              },
                              getLong:
                              Provider.of<GetData>(context).getRiquestLong,
                              getLat:
                              Provider.of<GetData>(context).getRiquestLat,
                            ),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          TextField(
                            controller: addressController,
                            decoration: kTextFieldDecoration.copyWith(
                              labelText: 'Address',
                            ),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          TextField(
                            controller: phoneController,
                            decoration: kTextFieldDecoration.copyWith(
                              labelText: 'Phone',
                            ),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          TextField(
                            decoration: kTextFieldDecoration.copyWith(
                              labelText: 'Info',
                            ),
                          ),
                          SizedBox(
                            height: 33,
                          ),
                          RaisedButton(
                            color: Colors.blue,
                            elevation: 12,
                            onPressed: () {
                              icon = true;
                              getData.sendRequest(
                                address: addressController.text,
                                phoneNoOfPlace: phoneController.text,
                                lat: getData.getRiquestLat,
                                long: getData.getRiquestLat,
                              );
                            },
                            child: icon
                                ? Icon(Icons.check)
                                : Text(
                                    'Requist',
                              style: kTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
