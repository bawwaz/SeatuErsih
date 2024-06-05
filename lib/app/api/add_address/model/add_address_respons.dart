import 'dart:convert';

import 'package:seatu_ersih/app/api/add_address/model/add_address_model.dart';

AddAddressRespons addAddressResponsFromJson(String str) =>
    AddAddressRespons.fromJson(json.decode(str));

String addAddressResponsToJson(AddAddressRespons data) =>
    json.encode(data.toJson());

class AddAddressRespons {
  String? message;
  List<AddAddressModel>? data;

  AddAddressRespons({
    this.message,
    this.data,
  });

  factory AddAddressRespons.fromJson(Map<String, dynamic> json) =>
      AddAddressRespons(
        message: json["message"],
        data: List<AddAddressModel>.from(
            json["data"].map((x) => AddAddressModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
