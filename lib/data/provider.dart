import 'dart:convert';
import 'package:flutter/material.dart';
import 'updatecustomer.dart';
import 'package:http/http.dart' as http;
import 'signup.dart';
import 'createrequest.dart';
import 'verifyphonenumber.dart';
import 'createcustomer.dart';
import 'getprogressrequests.dart';

class GetData extends ChangeNotifier {
  String apiUrl = 'https://eshukar.herokuapp.com/api/v1';

  List services;

  Future<dynamic> getCarts() async {
    final response = await http.get(
      Uri.encodeFull('http://10.0.2.2:8000/api/v1/carts'),
      headers: {'content-typw' : 'aplication/json'},
    );
    var extractData = json.decode(response.body);
    services = extractData['carts'];
    notifyListeners();
  }
  Future<updateUser> updateCus({String name, String address}) async{
    final response = await http.put(apiUrl + '/customers', body: {
      "name": name,
      "address": address,
    });
    notifyListeners();
    if(response.statusCode == 200){
      final String responseString = response.body;
      return updateUserFromJson(responseString);
    }else{
      return null;
    }
  }

  //nardni request
  Future<createRequest> sendRequest({
    String serviceId,
  String address,
  double lat,
  double long,
  String phoneNoOfPlace,
  }) async{
    final response = await http.post(apiUrl + 'auth/customer/login',
        body: {
      "phoneNo": '9647824583938',
    });
    notifyListeners();
    if(response.statusCode == 200){
      final String responseString = response.body;
      return createRequestFromJson(responseString);
    }else{
      return null;
    }
  }

  //drusr crdny account
  Future<signUp> signUpUser({String phone}) async{
    final response = await http.post(apiUrl + 'auth/customer/signup', body: {
      "phoneNo": phone,
    },);
     notifyListeners();
    if(response.statusCode == 200){
      final String responseString = response.body;
      return signupFromJson(responseString);
    }else{
      return null;
    }
  }
  Future<VerifyPhoneNo> verifyPhone({
    String phoneNo,
    String code,
  }) async{
    final response = await http.post(apiUrl + 'auth/customer/login',
        body: {
      "phoneNo": phoneNo,
      "code": code
    });
    notifyListeners();
    if(response.statusCode == 200){
      final String responseString = response.body;
      return verifyphonenumberFromJson(responseString);
    }else{
      return null;
    }
  }
  Future<createCustomer> createCustumer({
    String name,
    int lat,
    int long,
    String password
  }) async{
    final response = await http.post(apiUrl + 'auth/customer/login',
        body: {
          "name": name,
          "lat": lat,
          "long": long,
          "password": password
        });
    notifyListeners();
    if(response.statusCode == 200){
      final String responseString = response.body;
      return createCustomerFromJson(responseString);
    }else{
      return null;
    }
  }
  String _phone;
  String _address;
  double currentLat=0;
  double currentLong=0;
  double riquestlat=0;
  double riquestLong=0;
  void setPhone(String phone) {
    this._phone = phone;
    notifyListeners();
  }

  void setCurrentLatLong({double lat,double long}) {
    this.currentLat = lat;
    this.currentLong=long;
    notifyListeners();
  }
  void setRequestLatLong({double lat,double long}) {
    this.riquestlat = lat;
    this.riquestLong=long;
    notifyListeners();
  }
  void setAddress(String address) {
    this._address = address;
    notifyListeners();
  }

  double get getCurrentLat {
    return currentLat;
  }
  double get getCurrentLong {
    return currentLong;
  }
  double get getRiquestLat {
    return riquestlat;
  }
  double get getRiquestLong {
    return riquestLong;
  }
  String get getAddress {
    return _address;
  }

  String get getPhone {
    return _phone;
  }
}
