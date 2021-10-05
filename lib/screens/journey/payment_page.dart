import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/helpers/view_functions.dart';
import 'package:v_room_app/screens/journey/journey_details_page.dart';
import 'package:v_room_app/screens/orders/create_order_map_page.dart';
import 'package:v_room_app/screens/widgets/appBar.dart';
import 'package:v_room_app/screens/widgets/bottomNavigationBar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.homeBackGroundColor,
      appBar: CustomAppBar(
        isBack: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 20.h,
            ),
            child: Column(
              children: [
                Container(
                  height: 88.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF222222).withOpacity(0.06),
                        blurRadius: 8,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image(
                            height: 64.h,
                            width: 64.h,
                            image: AssetImage('assets/images/truck.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mohamed Ali',
                            style: TextStyle(
                              color: ColorsUtils.titleColor,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            "58 \$",
                            style: TextStyle(
                              color: ColorsUtils.greyTextColor,
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: ColorsUtils.greenColor,
                              size: 9.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Active',
                              style: TextStyle(
                                color: ColorsUtils.greyTextColor,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Container(
                  height: 463.99.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 11.h,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          S.of(context).payment,
                          style: TextStyle(
                            color: ColorsUtils.titleColor,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                CustomRoundedButton(
                    backgroundColor: ColorsUtils.kButtonPrimaryColor,
                    text: S.of(context).submit,
                    fontSize: 14.sp,
                    textColor: ColorsUtils.kPrimaryColor,
                    height: 49.h,
                    width: 256.w,
                    pressed: () {
                      CustomNavigator.pushScreen(
                        widget: JourneyDetails() , context: context,
                      );
                    }
                ),
                SizedBox(
                  height: 70.h,
                ),
                CustomBottomNavigationBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
