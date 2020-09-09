import 'dart:convert';

signUp signupFromJson(String str) => signUp.fromJson(json.decode(str));

String signupToJson(signUp data) => json.encode(data.toJson());

class signUp {
  signUp({
    this.phoneNo,
  });

  String phoneNo;

  factory signUp.fromJson(Map<String, dynamic> json) => signUp(
    phoneNo: json["phoneNo"],
  );

  Map<String, dynamic> toJson() => {
    "phoneNo": phoneNo,
  };
}
