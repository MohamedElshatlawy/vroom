import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/auth/reset_password_page.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/helpers/view_functions.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/phoneCodeTextField.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/viewModel/AuthViewModels/otp_provider.dart';

class VerificationCode extends StatefulWidget {

  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {

  TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: 1.sh - 44.h,
            width: 1.sw,
            child: Column(
              children: [
                SizedBox(
                  height: 53.1.h,
                ),
                Image(
                  height: 19.89.h,
                  width: 124.34.w,
                  image: AssetImage('assets/images/vRooom.png'),
                  color: ColorsUtils.kPrimaryColor,
                ),
                SizedBox(
                  height: 32.1.h,
                ),
                Image(
                  height: 281.29.h,
                  width: 292.w,
                  image: AssetImage('assets/images/trucks2.png'),
                ),
                SizedBox(
                  height: 56.h,
                ),
                Container(
                  height: 82.h,
                  width: 82.w,
                  decoration: BoxDecoration(
                      color: ColorsUtils.kButtonPrimaryColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color:
                          ColorsUtils.kButtonPrimaryColor.withOpacity(0.58),
                          offset: Offset(0, 10),
                          blurRadius: 60,
                        ),
                      ]),
                  child: Icon(
                    Icons.check,
                    color: ColorsUtils.whiteColor,
                    size: 55.w,
                  ),
                ),
                SizedBox(
                  height: 29.h,
                ),
                Text(
                  S
                      .of(context)
                      .success,
                  style: TextStyle(
                    color: ColorsUtils.darkBlueGreyTextColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  S
                      .of(context)
                      .checkPhone,
                  style: TextStyle(
                    color: ColorsUtils.hintGrayColor,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                PinCodeTextField(
                  controller: controller,
                  maxLength: 6,
                  textDirection: TextDirection.ltr,
                  pinBoxRadius: 8.0,
                  pinBoxHeight: 48.0,
                  pinBoxWidth: 48.0,
                  pinBoxColor: ColorsUtils.filledColor,
                  defaultBorderColor: ColorsUtils.filledColor,
                  pinBoxBorderWidth: 0.5,
                  pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 5.0),
                  keyboardType: TextInputType.number,
                  pinTextStyle:
                  TextStyle(color: ColorsUtils.blackColor, fontSize: 20),
                  onTextChanged: (val) {},
                  onDone: (val) {},
                ),
                SizedBox(
                  height: 35.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S
                          .of(context)
                          .canNotGetEmail,
                      style: TextStyle(
                          color: ColorsUtils.hintGrayColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      S
                          .of(context)
                          .reSubmit,
                      style: TextStyle(
                        color: ColorsUtils.kPrimaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Consumer(
                  builder: (context, watch, _) {
                    final provider = watch(otpProvider);
                    return Align(
                      alignment: Alignment.center,
                      child: CustomRoundedButton(
                          backgroundColor: ColorsUtils.kButtonPrimaryColor,
                          text: S
                              .of(context)
                              .submit,
                          fontSize: 14.sp,
                          textColor: ColorsUtils.kPrimaryColor,
                          height: 49.h,
                          width: 256.w,
                          pressed: () async {
                            final userId = await provider.submitOTP(
                                smsCode: controller.text);
                            if (userId.isNotEmpty) {
                              CustomNavigator.pushScreenRepcalement(
                                widget: HomePage(), context: context,
                              );
                            } else {
                              ViewFunctions.showCustomSnackBar(
                                context: context,
                                text: provider.errorMessage,
                              );
                            }
                          }),
                    );
                  },
                ),
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
