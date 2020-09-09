import 'dart:convert';

createRequest createRequestFromJson(String str) => createRequest.fromJson(json.decode(str));

String createRequestToJson(createRequest data) => json.encode(data.toJson());

class createRequest {
  createRequest({
    this.serviceId,
    this.address,
    this.lat,
    this.long,
    this.phoneNoOfPlace,
  });

  String serviceId;
  String address;
  double lat;
  double long;
  String phoneNoOfPlace;

  factory createRequest.fromJson(Map<String, dynamic> json) => createRequest(
    serviceId: json["serviceId"],
    address: json["address"],
    lat: json["lat"],
    long: json["long"],
    phoneNoOfPlace: json["phoneNoOfPlace"],
  );

  Map<String, dynamic> toJson() => {
    "serviceId": serviceId,
    "address": address,
    "lat": lat,
    "long": long,
    "phoneNoOfPlace": phoneNoOfPlace,
  };
}
