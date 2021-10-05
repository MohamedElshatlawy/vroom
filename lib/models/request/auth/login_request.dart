import 'package:flutter/material.dart';

class LoginRequest {
  String phone;
  String password;
  String countryId;

  LoginRequest(
      {@required this.countryId,
      @required this.password,
      @required this.phone});

  toJson() => {
        "phone": this.phone,
        "password": this.password,
        "contry_id": this.countryId
      };
}
