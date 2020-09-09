import 'dart:convert';

updateUser updateUserFromJson(String str) => updateUser.fromJson(json.decode(str));

String updateUserToJson(updateUser data) => json.encode(data.toJson());

class updateUser {
  updateUser({
    this.name,
    this.address,
  });

  String name;
  String address;

  factory updateUser.fromJson(Map<String, dynamic> json) => updateUser(
    name: json["name"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
  };
}
