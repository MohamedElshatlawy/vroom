import 'package:v_room_app/models/response/base_response.dart';

class GetOrderResponse extends BaseResponse {
  List<Order> order;

  GetOrderResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['data'] != null) {
      order = <Order>[];
      json['data'].forEach((v) {
        order.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['data'] = this.order.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class Order {
  int id;
  int userId;
  int truckTypeId;
  String startLatitude;
  String startLongitude;
  String endLatitude;
  String endLongitude;
  String receiveDateStart;
  String receiveTimeStart;
  String details;
  String status;

  Order(
      {this.id,
      this.truckTypeId,
      this.userId,
      this.startLatitude,
      this.startLongitude,
      this.receiveDateStart,
      this.receiveTimeStart,
      this.endLatitude,
      this.endLongitude,
      this.status,
      this.details,
      });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    truckTypeId = json['truck_type_id'];
    startLatitude = json['start_latitude'];
    startLongitude = json['start_longitude'];
    endLatitude = json['end_latitude'];
    endLongitude= json['end_longitude'];
    receiveDateStart= json['receive_date_start'];
    receiveTimeStart= json['receive_time_start'];
    details= json['details'];
    status= json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['truck_type_id'] = this.truckTypeId;
    data['start_longitude'] = this.startLongitude;
    data['start_latitude'] = this.startLatitude;
    data['end_longitude'] = this.endLongitude;
    data['end_latitude'] = this.endLatitude;
    data['receive_date_start'] = this.receiveDateStart;
    data['receive_time_start'] = this.receiveTimeStart;
    data['details'] = this.details;
    data['status'] = this.status;
    return data;
  }
}
