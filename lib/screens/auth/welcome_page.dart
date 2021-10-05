import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/helpers/view_functions.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/utils/Enums.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.whiteColor,
      body: SafeArea(
        child: Container(
          height: 1.sh,
          width: 1.sw,
          child: SingleChildScrollView(
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
                Image(
                  height: 281.29.h,
                  width: 292.w,
                  image: AssetImage('assets/images/trucks.png'),
                ),
                SizedBox(
                  height: 95.h,
                ),
                Text(
                  S.of(context).welcome,
                  style: TextStyle(
                    color: ColorsUtils.titleColor,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 86.w),
                  child: Text(
                    S.of(context).registerFirst,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorsUtils.titleColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 66.h,
                ),
                CustomRoundedButton(
                  backgroundColor: ColorsUtils.kButtonPrimaryColor,
                  text: S.of(context).createAccount,
                  fontSize: 14.sp,
                  textColor: ColorsUtils.kPrimaryColor,
                  height: 49.h,
                  width: 256.w,
                  pressed: () => ViewFunctions.modalBottomSheetMenu(
                    context: context,
                    authType: AuthTypesEnum.signUp,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomRoundedButton(
                  backgroundColor: ColorsUtils.kButtonSecondaryColor,
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
                SizedBox(
                  height: 76.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).byLogin,
                      style: TextStyle(
                        color: ColorsUtils.blackTextColor,
                        fontSize: 10.sp,
                      ),
                    ),
                    Text(
                      S.of(context).termsAndConditions,
                      style: TextStyle(
                        color: ColorsUtils.kPrimaryColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).and,
                      style: TextStyle(
                        color: ColorsUtils.blackTextColor,
                        fontSize: 10.sp,
                      ),
                    ),
                    Text(
                      S.of(context).privacy,
                      style: TextStyle(
                        color: ColorsUtils.kPrimaryColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
