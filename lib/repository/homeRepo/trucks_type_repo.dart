import 'package:v_room_app/models/request/home/truck_types_request.dart';
import 'package:v_room_app/models/response/home/truck_types_response.dart';
import 'package:v_room_app/network/ServicesURLs.dart';
import 'package:v_room_app/network/networkCallback/NetworkCallback.dart';
import 'package:v_room_app/utils/Enums.dart';

class TrucksTypeRepository {
  static Future<TruckTypesResponse> getTruckTypes({TruckTypesRequest truckTypesRequest}) async {
    final response = await NetworkCall.makeCall(
      endPoint: ServicesURLs.TRUCK_TYPES,
      method: HttpMethod.GET,

    );
    return TruckTypesResponse.fromJson(response);
  }
}
