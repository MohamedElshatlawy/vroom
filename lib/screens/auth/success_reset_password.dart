import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/helpers/view_functions.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/utils/Enums.dart';

class SuccessResetPassword extends StatelessWidget {
  SuccessResetPassword();

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
                  S.of(context).congratulation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsUtils.hintLightGrayColor,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: CustomRoundedButton(
                    backgroundColor: ColorsUtils.kButtonPrimaryColor,
                    text: S.of(context).login,
                    fontSize: 14.sp,
                    textColor: ColorsUtils.kPrimaryColor,
                    height: 49.h,
                    width: 256.w,
                    pressed: () => ViewFunctions.modalBottomSheetMenu(
                      context: context,
                      authType: AuthTypesEnum.logIn,
                    ),
                  ),
                ),
                SizedBox(
                  height: 57.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
