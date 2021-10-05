import 'package:flutter/material.dart';

class ForgetPasswordRequest {
  String phone;
  String countryId;

  ForgetPasswordRequest(
      {@required this.countryId,
      @required this.phone});

  toJson() => {
        "phone": this.phone,
        "contry_id": this.countryId
      };
}
