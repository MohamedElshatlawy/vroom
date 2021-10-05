import 'package:flutter/material.dart';

class AllOrderRequest {
  String status;
  String type;

  AllOrderRequest({
    @required this.status,
    @required this.type,
  });

  toJson() => {
        "status": this.status.toString(),
        "type": this.type.toString(),
      };
}
