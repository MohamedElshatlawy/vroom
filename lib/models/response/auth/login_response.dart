import 'package:v_room_app/models/response/base_response.dart';

class LoginResponse extends BaseResponse {
  List<Data> data;

  LoginResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int id;
  String name;
  int phone;
  String email;
  int contryId;
  String token;
  String tokenType;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.contryId,
      this.token,
      this.tokenType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    contryId = json['contry_id'];
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['contry_id'] = this.contryId;
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    return data;
  }
}
