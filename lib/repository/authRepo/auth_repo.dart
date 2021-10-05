import 'package:v_room_app/models/request/auth/forget_password_request.dart';
import 'package:v_room_app/models/request/auth/login_request.dart';
import 'package:v_room_app/models/request/auth/register_request.dart';
import 'package:v_room_app/models/request/auth/reset_password_request.dart';
import 'package:v_room_app/models/response/auth/forget_password_response.dart';
import 'package:v_room_app/models/response/auth/login_response.dart';
import 'package:v_room_app/models/response/auth/register_response.dart';
import 'package:v_room_app/models/response/auth/reset_password_response.dart';
import 'package:v_room_app/network/ServicesURLs.dart';
import 'package:v_room_app/network/networkCallback/NetworkCallback.dart';
import 'package:v_room_app/utils/Enums.dart';

class AuthRepository {
  static Future<LoginResponse> login({LoginRequest loginRequest}) async {
    final response = await NetworkCall.makeCall(
      endPoint: ServicesURLs.LOGIN,
      method: HttpMethod.POST,
      requestBody: loginRequest.toJson(),
    );
    return LoginResponse.fromJson(response);
  }

  static Future<RegisterResponse> register({RegisterRequest registerRequest}) async {
    final response = await NetworkCall.makeCall(
      endPoint: ServicesURLs.REGISTER,
      method: HttpMethod.POST,
      requestBody: registerRequest.toJson(),
    );
    return RegisterResponse.fromJson(response);
  }

  static Future<ForgetPasswordResponse> forgetPassword({ForgetPasswordRequest forgetPasswordRequest}) async {
    final response = await NetworkCall.makeCall(
      endPoint: ServicesURLs.FORGET_PASSWORD,
      method: HttpMethod.POST,
      requestBody: forgetPasswordRequest.toJson(),
    );
    return ForgetPasswordResponse.fromJson(response);
  }

  static Future<ResetPasswordResponse> resetPassword({ResetPasswordRequest resetPasswordRequest}) async {
    final response = await NetworkCall.makeCall(
      endPoint: ServicesURLs.RESET_PASSWORD,
      method: HttpMethod.POST,
      requestBody: resetPasswordRequest.toJson(),
    );
    return ResetPasswordResponse.fromJson(response);
  }
}
