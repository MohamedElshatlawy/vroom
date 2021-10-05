import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/auth/reset_password_page.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/phoneCodeTextField.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class ResetCode extends StatelessWidget {
  ResetCode();
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
                        color: ColorsUtils.kButtonPrimaryColor.withOpacity(0.58),
                        offset: Offset(0,10),
                        blurRadius: 60,
                      ),
                    ]
                  ),
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
                  S.of(context).success,
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
                  S.of(context).checkPhone,
                  style: TextStyle(
                    color: ColorsUtils.hintGrayColor,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PhoneCodeTextField(),
                      PhoneCodeTextField(),
                      PhoneCodeTextField(),
                      PhoneCodeTextField(),
                      PhoneCodeTextField(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).canNotGetEmail,
                      style: TextStyle(
                        color: ColorsUtils.hintGrayColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Text(
                      S.of(context).reSubmit,
                      style: TextStyle(
                        color: ColorsUtils.kPrimaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: CustomRoundedButton(
                    backgroundColor: ColorsUtils.kButtonPrimaryColor,
                    text: S.of(context).submit,
                    fontSize: 14.sp,
                    textColor: ColorsUtils.kPrimaryColor,
                    height: 49.h,
                    width: 256.w,
                    pressed: () {
                      CustomNavigator.pushScreenRepcalement(
                        widget: ResetPassword(), context: context,
                      );
                    }
                  ),
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
