import 'package:flutter/material.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class Constants {
  static const token = "Token";
  static const keyOnBoarding = "keyOnBoarding";

  static const unAuthorizedError = "Unauthorized Error";

  static const unAuthorizedUserMessage =
      "You are not authorized, please login first to proceed";

  static const languageCode = "language_code";

  static const countryCode = "countryCode";

  static const unBlockVehicle = "unBlockVehicle";

  static const minimumHoursToBookingKey =
      "App.CountryManagement.MinimumHoursToBooking";

  static const embeddedVehicleECheck =
      "App.BranchManagement.EmbeddedVehicleECheck";

  static const contractMinimumHoursKey =
      "App.CountryManagement.ContractMinimumHours";

  static const maxDaysWhenAddContractKey =
      "App.CountryManagement.MaxDaysWhenAddContract";

  static const enablePosKey = "App.BranchManagement.EnablePoS";

  static const cardId = "291";

  static String fleetErrorImgUrl =
      "http://ejar-st.alwefaq.com:5400/Common/Images/no_vehicle.png";

  static  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: ColorsUtils.borderColor));

}
