import 'dart:convert';

createCustomer createCustomerFromJson(String str) => createCustomer.fromJson(json.decode(str));

String createCustomerToJson(createCustomer data) => json.encode(data.toJson());

class createCustomer {
  createCustomer({
    this.name,
    this.lat,
    this.long,
    this.password,
  });

  String name;
  int lat;
  int long;
  String password;

  factory createCustomer.fromJson(Map<String, dynamic> json) => createCustomer(
    name: json["name"],
    lat: json["lat"],
    long: json["long"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lat": lat,
    "long": long,
    "password": password,
  };
}
