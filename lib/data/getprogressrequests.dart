import 'dart:convert';

getProgressRequests getCurrentRequestsFromJson(String str) => getProgressRequests.fromJson(json.decode(str));

String getCurrentRequestsToJson(getProgressRequests data) => json.encode(data.toJson());

class getProgressRequests {
  getProgressRequests({
    this.data,
  });

  bool success;
  int count;
  List<Datum> data;

  factory getProgressRequests.fromJson(Map<String, dynamic> json) => getProgressRequests(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.status,
    this.id,
    this.address,
    this.phoneNoOfPlace,
    this.customerId,
    this.serviceId,
    this.teamId,
  });

  String status;
  String id;
  String address;
  String phoneNoOfPlace;
  String customerId;
  String serviceId;
  String teamId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    status: json["status"],
    id: json["_id"],
    address: json["address"],
    phoneNoOfPlace: json["phoneNoOfPlace"],
    customerId: json["customerId"],
    serviceId: json["serviceId"],
    teamId: json["teamId"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "_id": id,
    "address": address,
    "phoneNoOfPlace": phoneNoOfPlace,
    "customerId": customerId,
    "serviceId": serviceId,
    "teamId": teamId,
  };
}
