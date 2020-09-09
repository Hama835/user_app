import 'dart:convert';

VerifyPhoneNo verifyphonenumberFromJson(String str) => VerifyPhoneNo.fromJson(json.decode(str));

String verifyphonenumberToJson(VerifyPhoneNo data) => json.encode(data.toJson());

class VerifyPhoneNo {
  VerifyPhoneNo({
    this.phoneNo,
    this.code,
  });

  String phoneNo;
  String code;

  factory VerifyPhoneNo.fromJson(Map<String, dynamic> json) => VerifyPhoneNo(
    phoneNo: json["phoneNo"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "phoneNo": phoneNo,
    "code": code,
  };
}
