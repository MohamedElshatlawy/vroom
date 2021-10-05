import 'package:flutter/material.dart';

class GetOrderRequest {
  int orderId;

  GetOrderRequest({
    @required this.orderId,
  });

  toJson() => {
        "order_id": this.orderId.toString(),
      };
}
