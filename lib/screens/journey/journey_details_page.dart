import 'package:flutter/material.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/helpers/view_functions.dart';
import 'package:v_room_app/screens/journey/payment_page.dart';
import 'package:v_room_app/screens/orders/create_order_map_page.dart';
import 'package:v_room_app/screens/widgets/appBar.dart';
import 'package:v_room_app/screens/widgets/bottomNavigationBar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JourneyDetails extends StatelessWidget {
  const JourneyDetails();

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
                            'Truck type + cargo',
                            style: TextStyle(
                              color: ColorsUtils.titleColor,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            S.of(context).payload + " : 30 tons",
                            style: TextStyle(
                              color: ColorsUtils.greyTextColor,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 88.w,
                        height: 28.h,
                        margin: EdgeInsets.symmetric(horizontal: 27.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorsUtils.kButtonPrimaryColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          S.of(context).change,
                          style: TextStyle(
                            color: ColorsUtils.kPrimaryColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  height: 113.h,
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/startPoint.png'),
                            ),
                            Container(
                              width: 1.w,
                              height: 40.h,
                              color: ColorsUtils.blackColor,
                            ),
                            Image(
                              image: AssetImage('assets/images/endPoint.png'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Starting point',
                                  style: TextStyle(
                                    color: ColorsUtils.titleColor,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.location_on,
                                  color: ColorsUtils.kPrimaryColor,
                                ),
                              ],
                            ),
                            Divider(
                              color: ColorsUtils.dividerColor,
                              thickness: 1.5,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Where you want to go?',
                                  style: TextStyle(
                                    color: ColorsUtils.titleColor,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.location_on,
                                  color: ColorsUtils.kPrimaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          CustomNavigator.pushScreen(
                            widget: CreateOrderMapPage(),
                            context: context,
                          );
                        },
                        child: Image(
                          image:
                              AssetImage('assets/images/journeyLocation.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Container(
                  height: 88.64.h,
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: InkWell(
                    onTap: () {
                      ViewFunctions.pickDateModalBottomSheet(context: context);
                    },
                    child: Row(
                      children: [
                        Text(
                          'Date & Time',
                          style: TextStyle(
                            color: ColorsUtils.titleColor,
                            fontSize: 13.sp,
                          ),
                        ),
                        SizedBox(
                          width: 49.5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.date_range,
                              color: ColorsUtils.blackColor,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '21/8/2021',
                              style: TextStyle(
                                color: ColorsUtils.titleColor,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 1.w,
                          height: 41.h,
                          margin: EdgeInsets.symmetric(horizontal: 11.w),
                          color: ColorsUtils.blackColor,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: ColorsUtils.blackColor,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '2:15 PM',
                              style: TextStyle(
                                color: ColorsUtils.titleColor,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Icon(
                            Icons.more_horiz,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Container(
                  height: 245.48.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          color: ColorsUtils.titleColor,
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Expanded(
                        child: Container(
                          height: 185,
                          child: CustomTextField(
                            isNotes: true,
                            filledColor: ColorsUtils.descriptionFilledColor,
                            maxLine: 10,
                            hasBorder: false,
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
                        widget: PaymentPage(),
                        context: context,
                      );
                    }),
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
