
import 'package:flutter/material.dart';

class EditOrderRequest {

  int orderId;
  int truckTypeId;
  String startLatitude;
  String startLongitude;
  String endLatitude;
  String endLongitude;
  String receiveDateStart;
  String receiveTimeStart;
  String completeDateStart;
  String completeTimeStart;
  String details;

  EditOrderRequest(
    {@required this.orderId,
     @required this.truckTypeId,
    @required this.startLatitude,
    @required this.startLongitude,
    @required this.endLatitude,
    @required this.endLongitude,
    @required this.receiveDateStart,
    @required this.receiveTimeStart,
    @required this.completeDateStart,
    @required this.completeTimeStart,
    @required this.details,
   });

  toJson() =>
      {
        "truck_type_id": this.truckTypeId.toString(),
        "order_id": this.orderId.toString(),
        "start_latitude": this.startLatitude,
        "start_longitude": this.startLongitude,
        "end_latitude": this.endLatitude,
        "start_longitude": this.endLongitude,
        "receive_date_start": this.receiveDateStart,
        "receive_time_start": this.receiveTimeStart,
        "complete_date_start": this.completeDateStart,
        "complete_time_start": this.completeTimeStart,
        "payload": '9999',
        "payload_type": 'kg',
        "details": this.details,
      };
}
