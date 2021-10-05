import 'package:flutter/material.dart';

class ResetPasswordRequest {
  String phone;
  String countryId;
  String password;

  ResetPasswordRequest({
    @required this.countryId,
    @required this.password,
    @required this.phone,
  });

  toJson() => {
        "phone": this.phone,
        "contry_id": this.countryId,
        "password": this.countryId,
      };
}
