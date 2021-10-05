import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/request/auth/login_request.dart';
import 'package:v_room_app/models/request/auth/register_request.dart';
import 'package:v_room_app/repository/authRepo/auth_repo.dart';
import 'package:v_room_app/screens/auth/forget_password_page.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/utils/Enums.dart';
import 'package:v_room_app/utils/TokenUtil.dart';
import 'package:v_room_app/viewModel/AuthViewModels/authController.dart';
import 'package:v_room_app/viewModel/Orders/orders_controller.dart';

class ViewFunctions {
  static void modalBottomSheetMenu({
    BuildContext context,
    String authType,
  }) {
    TextEditingController fullNameCnt = TextEditingController();
    TextEditingController phoneCnt = TextEditingController();
    TextEditingController passwordCnt = TextEditingController();
    StateProvider authTypeProvider = StateProvider<String>((ref) => authType);
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorsUtils.transparentColor,
      barrierColor: ColorsUtils.blackColor.withOpacity(0.48),
      isScrollControlled: true,
      builder: (builder) {
        return DraggableScrollableSheet(
          initialChildSize: .6,
          maxChildSize: .9,
          minChildSize: .6,
          builder: (BuildContext context, ScrollController scrollController) {
            return ListView(
              controller: scrollController,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 6.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                        color: ColorsUtils.whiteColor,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 610.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 34.h, horizontal: 50.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF202326).withOpacity(0.1),
                        blurRadius: 15,
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Consumer(
                    builder: (context, watch, widget) {
                      final String authTypeWatcher =
                          watch(authTypeProvider).state;
                      final bool authLoading = watch(authLoadingProvider).state;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.read(authTypeProvider).state =
                                        AuthTypesEnum.signUp;
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        S.of(context).createAccount,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: authTypeWatcher ==
                                                  AuthTypesEnum.signUp
                                              ? ColorsUtils.kPrimaryColor
                                              : ColorsUtils.darkGreyTextColor,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Container(
                                        height: 2.h,
                                        width: 80.w,
                                        color: authTypeWatcher ==
                                                AuthTypesEnum.signUp
                                            ? ColorsUtils.kPrimaryColor
                                            : ColorsUtils.transparentColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.read(authTypeProvider).state =
                                        AuthTypesEnum.logIn;
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        S.of(context).login,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: authTypeWatcher ==
                                                  AuthTypesEnum.logIn
                                              ? ColorsUtils.kPrimaryColor
                                              : ColorsUtils.darkGreyTextColor,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Container(
                                        height: 2.h,
                                        width: 77.w,
                                        color: authTypeWatcher ==
                                                AuthTypesEnum.logIn
                                            ? ColorsUtils.kPrimaryColor
                                            : ColorsUtils.transparentColor,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          authTypeWatcher == AuthTypesEnum.logIn
                              ? SizedBox(
                                  height: 59.h,
                                )
                              : SizedBox(
                                  height: 67.h,
                                ),
                          authTypeWatcher == AuthTypesEnum.signUp
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    S.of(context).fullName,
                                    style: TextStyle(
                                      color: ColorsUtils.darkBlueGreyTextColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          authTypeWatcher == AuthTypesEnum.signUp
                              ? SizedBox(
                                  height: 15.h,
                                )
                              : SizedBox(),
                          authTypeWatcher == AuthTypesEnum.signUp
                              ? CustomTextField(
                                  controller: fullNameCnt,
                                  hintText: S.of(context).fullNameHint,
                                  hintStyle: TextStyle(
                                    color: ColorsUtils.hintTextColor,
                                    fontSize: 12.sp,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              S.of(context).phoneNumber,
                              style: TextStyle(
                                color: ColorsUtils.darkBlueGreyTextColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomTextField(
                            controller: phoneCnt,
                            hintText: '0125254593',
                            isPhoneCode: true,
                            isMobile: true,
                            hintStyle: TextStyle(
                              color: ColorsUtils.hintTextColor,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              S.of(context).password,
                              style: TextStyle(
                                color: ColorsUtils.darkBlueGreyTextColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomTextField(
                            controller: passwordCnt,
                            hintText: '**** *** ***',
                            hintStyle: TextStyle(
                              color: ColorsUtils.hintTextColor,
                              fontSize: 12.sp,
                            ),
                            hasPassword: true,
                          ),
                          authTypeWatcher == AuthTypesEnum.logIn
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      CustomNavigator.pushScreenRepcalement(
                                        widget: ForgetPassword(),
                                        context: context,
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                        vertical: 23.h,
                                      ),
                                      child: Text(
                                        S.of(context).forgetPassword + "?",
                                        style: TextStyle(
                                          color: ColorsUtils.kPrimaryColor,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          Spacer(),
                          Align(
                            alignment: Alignment.center,
                            child: authLoading
                                ? SpinKitWave(
                                    size: 30.w,
                                    color: ColorsUtils.kPrimaryColor,
                                  )
                                : CustomRoundedButton(
                                    backgroundColor:
                                        ColorsUtils.kButtonPrimaryColor,
                                    text: authTypeWatcher == AuthTypesEnum.logIn
                                        ? S.of(context).login
                                        : S.of(context).register,
                                    fontSize: 14.sp,
                                    textColor: ColorsUtils.kPrimaryColor,
                                    height: 49.h,
                                    width: 256.w,
                                    pressed: authTypeWatcher ==
                                            AuthTypesEnum.logIn
                                        ? () {
                                            context
                                                .read(authLoadingProvider)
                                                .state = true;
                                            AuthRepository.login(
                                              loginRequest: LoginRequest(
                                                phone: phoneCnt.text,
                                                password: passwordCnt.text,
                                                countryId: context
                                                    .read(phoneCodeProvider)
                                                    .state,
                                              ),
                                            ).then(
                                              (value) {
                                                context
                                                    .read(authLoadingProvider)
                                                    .state = false;
                                                if (value.code == 200) {
                                                  TokenUtil.saveToken(
                                                      value.data[0].token);
                                                  CustomNavigator
                                                      .pushScreenRepcalement(
                                                    context: context,
                                                    widget: HomePage(),
                                                  );
                                                } else {
                                                  ViewFunctions.messageDialog(
                                                      context: context,
                                                      message: value.message);
                                                }
                                              },
                                            );
                                          }
                                        : () {
                                            context
                                                .read(authLoadingProvider)
                                                .state = true;
                                            AuthRepository.register(
                                              registerRequest: RegisterRequest(
                                                name: fullNameCnt.text,
                                                phone: phoneCnt.text,
                                                password: passwordCnt.text,
                                                countryId: context
                                                    .read(phoneCodeProvider)
                                                    .state,
                                                email: '',
                                                fcmToken: context
                                                    .read(fcmTokenProvider)
                                                    .state,
                                              ),
                                            ).then(
                                              (value) {
                                                context
                                                    .read(authLoadingProvider)
                                                    .state = false;
                                                if (value.code == 200) {
                                                  TokenUtil.saveToken(
                                                      value.data[0].token);
                                                  CustomNavigator
                                                      .pushScreenRepcalement(
                                                    context: context,
                                                    widget: HomePage(),
                                                  );
                                                } else {
                                                  ViewFunctions.messageDialog(
                                                      context: context,
                                                      message: value.message);
                                                }
                                              },
                                            );
                                          },
                                  ),
                          ),
                          SizedBox(
                            height: (authTypeWatcher == AuthTypesEnum.signUp)
                                ? 20.h
                                : 49.h,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  static void pickDateModalBottomSheet({
    BuildContext context,
    String orderType,
  }) {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2021, 9, 9),
      maxTime: DateTime(2025, 1, 1),
      onChanged: (date) {
        if (orderType == 'create') {
          context.read(orderDateProvider).state =
              date.toString().substring(0, 10);
          context.read(orderTimeProvider).state =
              date.toString().substring(11, 16);
        } else {
          context.read(editOrderDateProvider).state =
              date.toString().substring(0, 10);
          context.read(editOrderTimeProvider).state =
              date.toString().substring(11, 16);
        }
      },
      onConfirm: (date) {
        print('confirm $date');
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  static void showCustomSnackBar({
    String text,
    bool hasIcon,
    IconData iconType,
    BuildContext context,
    Color iconColor,
  }) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          hasIcon
              ? Icon(
                  iconType,
                  color: iconColor,
                )
              : Container(
                  height: 22.0,
                ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
        ],
      ),
    ));
  }

  static void messageDialog(
      {BuildContext context, String message, Function function}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: SelectableText(
          message,
        ),
        actions: [
          CupertinoDialogAction(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Ok',
              ),
            ),
            onPressed: function == null
                ? () {
                    Navigator.pop(context);
                  }
                : function,
          ),
        ],
      ),
    );
  }

  static getAddressByCoordinates(
      {BuildContext context,
      LatLng location,
      String point,
      String orderType}) async {
    final coordinates = new Coordinates(location.latitude, location.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    String finalAddress =
        '${first.locality ?? '-'}, ${first.adminArea}, ${first.countryName}';
    point == PointsEnum.start
        ? orderType == 'create'
            ? context.read(startingAddressProvider).state = finalAddress
            : context.read(editStartingAddressProvider).state = finalAddress
        : orderType == 'create'
            ? context.read(endingAddressProvider).state = finalAddress
            : context.read(editEndingAddressProvider).state = finalAddress;
  }

  static Future<File> pickImage() async {
    final ImagePicker _picker = ImagePicker();

    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final String fileName = pickedFile.path.split('/').last;

      final imageFile = await MultipartFile.fromPath('file', pickedFile.path,
          filename: fileName,
          contentType: MediaType('image', fileName.split('.').last));

      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
