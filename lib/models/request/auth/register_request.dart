import 'package:flutter/material.dart';

class RegisterRequest {
  String name;
  String email;
  String phone;
  String password;
  String countryId;
  String fcmToken ;

  RegisterRequest(
      {@required this.countryId,
      @required this.password,
      @required this.phone,
      @required this.name,
      @required this.email,
      @required this.fcmToken,
      }){
    print('');
  }

  toJson() => {
        "name": this.name,
        "email": this.email,
        "phone": this.phone,
        "password": this.password,
        "contry_id": this.countryId,
        "fcm_token": this.fcmToken,
      };
}
