import 'package:v_room_app/models/response/base_response.dart';

class TruckTypesResponse extends BaseResponse {
  List<Truck> data;

  TruckTypesResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['data'] != null) {
      data = <Truck>[];
      json['data'].forEach((v) {
        data.add(new Truck.fromJson(v));
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

class Truck {
  int id;
  String name;
  String payload;
  String image;

  Truck(
      {this.id,
      this.name,
      this.payload,
      this.image,
      });

  Truck.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    payload = json['payload'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['payload'] = this.payload;
    data['image'] = this.image;
    return data;
  }
}
