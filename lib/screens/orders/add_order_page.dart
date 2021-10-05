import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/request/orders/add_order_request.dart';
import 'package:v_room_app/models/response/home/truck_types_response.dart';
import 'package:v_room_app/repository/OrderRepo/orders_repo.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/helpers/view_functions.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/screens/orders/create_order_map_page.dart';
import 'package:v_room_app/screens/widgets/appBar.dart';
import 'package:v_room_app/screens/widgets/bottomNavigationBar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/utils/Enums.dart';
import 'package:v_room_app/viewModel/Orders/orders_controller.dart';

class AddOrder extends StatelessWidget {
  AddOrder({this.truckData});

  TextEditingController descriptionCnt = TextEditingController();
  Truck truckData;

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
                            image: NetworkImage(truckData.image),
                            fit: BoxFit.cover,
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
                            truckData.name,
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
                            InkWell(
                              onTap: () {
                                CustomNavigator.pushScreen(
                                  widget: CreateOrderMapPage(
                                    choosePoint: PointsEnum.start,
                                  ),
                                  context: context,
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Consumer(
                                      builder: (context, watch, widget) {
                                        final String start =
                                            watch(startingAddressProvider)
                                                .state;
                                        return Text(
                                          start == null
                                              ? 'Starting Point'
                                              : start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: ColorsUtils.titleColor,
                                            fontSize: 13.sp,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Icon(
                                    Icons.location_on,
                                    color: ColorsUtils.kPrimaryColor,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: ColorsUtils.dividerColor,
                              thickness: 1.5,
                            ),
                            InkWell(
                              onTap: () {
                                CustomNavigator.pushScreen(
                                  widget: CreateOrderMapPage(
                                    choosePoint: PointsEnum.end,
                                  ),
                                  context: context,
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Consumer(
                                      builder: (context, watch, widget) {
                                        final String end =
                                            watch(endingAddressProvider).state;
                                        return Text(
                                          end == null
                                              ? 'Where you want to go?'
                                              : end,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: ColorsUtils.titleColor,
                                            fontSize: 13.sp,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Icon(
                                    Icons.location_on,
                                    color: ColorsUtils.kPrimaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/images/journeyLocation.png'),
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
                      ViewFunctions.pickDateModalBottomSheet(context: context,orderType: 'create');
                    },
                    child: Consumer(
                      builder: (context,watch,widget){
                        final String time = watch(orderTimeProvider).state;
                        final String date = watch(orderDateProvider).state;
                      return Row(
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
                                date == null ? '2000-01-01':date,
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
                                time == null ? '12:00':time,
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
                      );},
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
                            controller: descriptionCnt,
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
                Consumer(
                  builder: (context, watch, widget) {
                    final bool addLoading =
                        watch(addOrderLoadingProvider).state;
                    return addLoading
                        ? SpinKitWave(
                            color: ColorsUtils.kPrimaryColor,
                            size: 35.w,
                          )
                        : CustomRoundedButton(
                            backgroundColor: ColorsUtils.kButtonPrimaryColor,
                            text: S.of(context).submit,
                            fontSize: 14.sp,
                            textColor: ColorsUtils.kPrimaryColor,
                            height: 49.h,
                            width: 256.w,
                            pressed: () {
                              context.read(addOrderLoadingProvider).state =
                                  true;
                              OrdersRepository.addOrder(
                                addOrderRequest: AddOrderRequest(
                                  truckTypeId: truckData.id,
                                  startLatitude: context
                                      .read(startingPointProvider)
                                      .state
                                      .latitude
                                      .toString(),
                                  startLongitude: context
                                      .read(startingPointProvider)
                                      .state
                                      .longitude
                                      .toString(),
                                  endLatitude: context
                                      .read(endingPointProvider)
                                      .state
                                      .latitude
                                      .toString(),
                                  endLongitude: context
                                      .read(endingPointProvider)
                                      .state
                                      .longitude
                                      .toString(),
                                  receiveDateStart: context
                                      .read(orderDateProvider)
                                      .state,
                                  receiveTimeStart: context
                                      .read(orderTimeProvider)
                                      .state,
                                  completeDateStart: '2021-10-06',
                                  completeTimeStart: '00:00',
                                  details: descriptionCnt.text,
                                ),
                              ).then(
                                (value) {
                                  context.read(addOrderLoadingProvider).state =
                                      false;
                                  ViewFunctions.messageDialog(
                                      context: context,
                                      message: value.message,
                                      function: value.code == 200
                                          ? () {
                                              context
                                                  .read(startingPointProvider)
                                                  .state = null;
                                              context
                                                  .read(endingPointProvider)
                                                  .state = null;
                                              CustomNavigator
                                                  .pushScreenRepcalement(
                                                context: context,
                                                widget: HomePage(),
                                              );
                                            }
                                          : null);
                                },
                              );
                            },
                          );
                  },
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
