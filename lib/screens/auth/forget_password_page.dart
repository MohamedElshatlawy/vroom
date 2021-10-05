import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/request/auth/forget_password_request.dart';
import 'package:v_room_app/repository/authRepo/auth_repo.dart';
import 'package:v_room_app/screens/auth/reset_code_page.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/helpers/view_functions.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/viewModel/AuthViewModels/authController.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword();

  TextEditingController phoneCnt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: 1.sh - 44.h,
            width: 1.sw,
            padding: EdgeInsets.symmetric(
              horizontal: 50.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 53.1.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    height: 19.89.h,
                    width: 124.34.w,
                    image: AssetImage('assets/images/vRooom.png'),
                    color: ColorsUtils.kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 32.1.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    height: 281.29.h,
                    width: 292.w,
                    image: AssetImage('assets/images/trucks2.png'),
                  ),
                ),
                SizedBox(
                  height: 123.h,
                ),
                Text(
                  S.of(context).forgetPassword,
                  style: TextStyle(
                    color: ColorsUtils.darkBlueGreyTextColor,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  S.of(context).enterPhone,
                  style: TextStyle(
                    color: ColorsUtils.hintTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 34.h,
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
                  isMobile: true,
                  isPhoneCode: true,
                  hintStyle: TextStyle(
                    color: ColorsUtils.hintTextColor,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 38.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  child: Row(
                    children: [
                      Text(
                        S.of(context).rememberPassword,
                        style: TextStyle(
                          color: ColorsUtils.hintTextColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        S.of(context).signIn,
                        style: TextStyle(
                          color: ColorsUtils.kPrimaryColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Consumer(builder: (context, watch, widget) {
                  final bool forgetLoading =
                      watch(forgetPasswordLoadingProvider).state;
                  return Align(
                    alignment: Alignment.center,
                    child: forgetLoading
                        ? SpinKitWave(
                            size: 30.w,
                            color: ColorsUtils.kPrimaryColor,
                          )
                        : CustomRoundedButton(
                            backgroundColor: ColorsUtils.kButtonPrimaryColor,
                            text: S.of(context).submit,
                            fontSize: 14.sp,
                            textColor: ColorsUtils.kPrimaryColor,
                            height: 49.h,
                            width: 256.w,
                            pressed: () {
                              context
                                  .read(forgetPasswordLoadingProvider)
                                  .state = true;
                              AuthRepository.forgetPassword(
                                forgetPasswordRequest: ForgetPasswordRequest(
                                  phone: phoneCnt.text,
                                  countryId:
                                      context.read(phoneCodeProvider).state,
                                ),
                              ).then(
                                (value) {
                                  context
                                      .read(forgetPasswordLoadingProvider)
                                      .state = false;
                                  if (value.code == 200) {
                                    ViewFunctions.messageDialog(
                                        context: context,
                                        message: value.message,
                                        function: () {
                                          CustomNavigator.pushScreenRepcalement(
                                            context: context,
                                            widget: ResetCode(),
                                          );
                                        });
                                  } else {
                                    ViewFunctions.messageDialog(
                                        context: context,
                                        message: value.message);
                                  }
                                },
                              );
                            },
                          ),
                  );
                }),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
