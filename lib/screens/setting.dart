import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/appBar.dart';
import 'package:v_room_app/screens/widgets/bottomNavigationBar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatelessWidget {
  SettingPage();

  StateProvider notificationProvider = StateProvider<bool>((ref) => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.homeBackGroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Text(
                  S.of(context).setting,
                  style: TextStyle(
                    color: ColorsUtils.titleColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 133.h,
                  width: 329.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11.r),
                    boxShadow: [
                      BoxShadow(
                        color: ColorsUtils.blackColor.withOpacity(0.06),
                        blurRadius: 12,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/language.png'),
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          Text(
                            S.of(context).language,
                            style: TextStyle(
                              color: ColorsUtils.darkBlueGreyTextColor,
                              fontSize: 18.sp,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14.w,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/rateUs.png'),
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          Text(
                            S.of(context).notification,
                            style: TextStyle(
                              color: ColorsUtils.darkBlueGreyTextColor,
                              fontSize: 18.sp,
                            ),
                          ),
                          Spacer(),
                          FlutterSwitch(
                            width: 30.w,
                            height: 18.h,
                            toggleSize: 25.w,
                            padding: 2.h,
                            activeColor: ColorsUtils.kPrimaryColor,
                            value: true,
                            showOnOff: true,
                            onToggle: (val) {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/rateUs.png'),
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          Text(
                            S.of(context).rate,
                            style: TextStyle(
                              color: ColorsUtils.darkBlueGreyTextColor,
                              fontSize: 18.sp,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14.w,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 41.h,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomRoundedButton(
                  backgroundColor: ColorsUtils.kButtonPrimaryColor,
                  text: S.of(context).logOut,
                  fontSize: 14.sp,
                  textColor: ColorsUtils.kPrimaryColor,
                  height: 49.h,
                  width: 256.w,
                  pressed: () {},
                ),
              ),
              SizedBox(
                height: 451.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: CustomBottomNavigationBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
