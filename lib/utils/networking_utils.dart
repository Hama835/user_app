import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:user_application/data/category_service.dart';
import 'package:user_application/data/service_company.dart';

class NetworkingUtils {

  static final String _CATEGORIES_URL = "https://eshukar.herokuapp.com/api/v1/categories";

  // Method gets json response from the url.
  static Future _getJsonData(String url) async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      // The returned data.
      var decodedData = jsonDecode(data);

      return decodedData;
    } else {
      print('StatusCode = ${response.statusCode}');
    }
  }

  // Method returns the list of categories.
  static Future<List<Category>> getCategories() async {
    List<Category> categories = new List<Category>();
    var decodedJson = await _getJsonData(_CATEGORIES_URL);
    int count = decodedJson["count"];
    for (int i = 0; i < count; i++) {
      String id = decodedJson["data"][i]["_id"];
      String name = decodedJson['data'][i]["name"];
      categories.add(new Category(id,name));
      print("$id $name");
    }
    return categories;
  }

  // Method returns the list of Services.
  static Future<List<ServiceCompany>> getServicesByCategoryId(String categoryId) async {
    // Create the url of current category to get services.
    String urlOfCurrentCategory = "https://eshukar.herokuapp.com/api/v1/categories/$categoryId/services";
    // List of services
    List<ServiceCompany> services = new List<ServiceCompany>();
    var decodedJson = await _getJsonData(urlOfCurrentCategory);
    int count = decodedJson["count"];
    for (int i = 0; i < count; i++) {
      String id = decodedJson["data"][i]["_id"];
      String name = decodedJson['data'][i]["name"];
      String info = decodedJson['data'][i]['info'];
      String categoryName = decodedJson['data'][i]['categoryId'];
      String availabilityFrom = decodedJson['data'][i]['availability'][0]['from'];
      String availabilityTo = decodedJson['data'][i]['availability'][0]['to'];
      print("$id $name");
      services.add(new ServiceCompany(id, name, info, availabilityFrom, availabilityTo, categoryName));
    }
    return services;
  }
}
