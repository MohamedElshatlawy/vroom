import 'package:v_room_app/models/request/home/truck_types_request.dart';
import 'package:v_room_app/models/request/orders/add_order_request.dart';
import 'package:v_room_app/models/request/orders/all_order_request.dart';
import 'package:v_room_app/models/request/orders/edit_order_request.dart';
import 'package:v_room_app/models/request/orders/get_order_request.dart';
import 'package:v_room_app/models/response/home/truck_types_response.dart';
import 'package:v_room_app/models/response/orders/add_order_response.dart';
import 'package:v_room_app/models/response/orders/all_order_response.dart';
import 'package:v_room_app/models/response/orders/edit_order_response.dart';
import 'package:v_room_app/models/response/orders/get_order_response.dart';
import 'package:v_room_app/network/ServicesURLs.dart';
import 'package:v_room_app/network/networkCallback/NetworkCallback.dart';
import 'package:v_room_app/utils/Enums.dart';

class OrdersRepository {
  static Future<AddOrderResponse> addOrder({AddOrderRequest addOrderRequest}) async {
    final response = await NetworkCall.makeCall(
      endPoint: ServicesURLs.ADD_ORDER,
      method: HttpMethod.POST,
      requestBody: addOrderRequest.toJson(),
    );
    return AddOrderResponse.fromJson(response);
  }

  static Future<EditOrderResponse> editOrder({EditOrderRequest editOrderRequest}) async {
    final response = await NetworkCall.makeCall(
      endPoint: ServicesURLs.EDIT_ORDER,
      method: HttpMethod.POST,
      requestBody: editOrderRequest.toJson(),
    );
    return EditOrderResponse.fromJson(response);
  }

  static Future<GetOrderResponse> getOrderById({String orderId}) async {
    final response = await NetworkCall.makeCall(
      endPoint: ServicesURLs.GET_ORDER + '/$orderId',
      method: HttpMethod.GET,
    );
    return GetOrderResponse.fromJson(response);
  }

  static Future<AllOrderResponse> getAllOrders({AllOrderRequest allOrderRequest}) async {
    final response = await NetworkCall.makeCall(
      endPoint: ServicesURLs.ALL_ORDER ,
      method: HttpMethod.GET,
      queryParams: allOrderRequest.toJson(),
    );
    return AllOrderResponse.fromJson(response);
  }


}
