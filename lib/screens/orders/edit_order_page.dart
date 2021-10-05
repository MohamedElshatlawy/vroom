import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/request/orders/edit_order_request.dart';
import 'package:v_room_app/models/response/orders/all_order_response.dart';
import 'package:v_room_app/repository/OrderRepo/orders_repo.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/helpers/view_functions.dart';
import 'package:v_room_app/screens/orders/edit_order_map_page.dart';
import 'package:v_room_app/screens/orders/orders.dart';
import 'package:v_room_app/screens/widgets/appBar.dart';
import 'package:v_room_app/screens/widgets/bottomNavigationBar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/utils/Enums.dart';
import 'package:v_room_app/viewModel/Orders/orders_controller.dart';
import 'package:validators/sanitizers.dart';

class EditOrderPage extends StatelessWidget {
  EditOrderPage({this.orderData});

  Order orderData;
  bool called = false;
  TextEditingController descriptionCnt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (called == false) {
      called = true;
      WidgetsBinding.instance.addPostFrameCallback(
            (_) async{
              descriptionCnt.text = orderData?.details ?? '';
              final MarkerId startMarkerId = MarkerId('starting');
              context
                  .read(editOrderMarkersProvider)
                  .state[startMarkerId] =
                  Marker(
                    markerId: MarkerId('starting'),
                    position: LatLng(
                      toDouble(orderData?.startLatitude ?? 0),
                      toDouble(orderData?.startLongitude ?? 0),
                    ),
                    infoWindow: InfoWindow(
                      title: 'starting point',
                    ),
                  );
              context
                  .read(editStartingPointProvider)
                  .state = LatLng(
                toDouble(orderData?.endLatitude ?? 0),
                toDouble(orderData?.endLongitude ?? 0),
              );
              final MarkerId markerId = MarkerId('ending');
              context
                  .read(editOrderMarkersProvider)
                  .state[markerId] = Marker(
                markerId: MarkerId('ending'),
                position: LatLng(
                  toDouble(orderData?.endLatitude ?? 0),
                  toDouble(orderData?.endLongitude ?? 0),
                ),
                infoWindow: InfoWindow(
                  title: 'ending point',
                ),
              );
              context
                  .read(editEndingPointProvider)
                  .state = LatLng(
                toDouble(orderData?.endLatitude ?? 0),
                toDouble(orderData?.endLongitude ?? 0),
              );
              ViewFunctions.getAddressByCoordinates(
                  context: context,
                  location: LatLng(
                    toDouble(orderData?.startLatitude ?? 0),
                    toDouble(orderData?.startLongitude ?? 0),
                  ),
                  point: PointsEnum.start,
                  orderType: 'edit',
              );
              ViewFunctions.getAddressByCoordinates(
                  context: context,
                  location: LatLng(
                    toDouble(orderData?.endLatitude ?? 0),
                    toDouble(orderData?.endLongitude ?? 0),
                  ),
                  point: PointsEnum.end,
                  orderType: 'edit',
              );
        },
      );
    }

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
                            image: NetworkImage(orderData.truckType.image),
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
                            orderData.truckType.name,
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
                                  widget: EditOrderMapPage(
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
                                            watch(editStartingAddressProvider)
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
                                  widget: EditOrderMapPage(
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
                                            watch(editEndingAddressProvider)
                                                .state;
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
                      ViewFunctions.pickDateModalBottomSheet(
                          context: context, orderType: 'edit',
                      );
                    },
                    child: Consumer(builder: (context, watch, widget) {
                      final String time = watch(editOrderTimeProvider).state;
                      final String date = watch(editOrderDateProvider).state;
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
                                date == null
                                    ? orderData?.receiveDateStart ?? ''
                                    : date,
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
                                time == null
                                    ? orderData?.receiveTimeStart ?? ''
                                    : time,
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
                      );
                    },),
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
                            controller: descriptionCnt,
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
                        watch(editOrderLoadingProvider).state;
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
                              context.read(editOrderLoadingProvider).state =
                              true;
                              OrdersRepository.editOrder(
                                editOrderRequest: EditOrderRequest(
                                  orderId: orderData.id,
                                  truckTypeId: orderData.truckTypeId,
                                  startLatitude: context
                                              .read(editStartingPointProvider)
                                              .state ==
                                          null
                                      ? orderData.startLatitude
                                      : context
                                          .read(editStartingPointProvider)
                                          .state
                                          .latitude
                                          .toString(),
                                  startLongitude: context
                                              .read(editStartingPointProvider)
                                              .state ==
                                          null
                                      ? orderData.startLongitude
                                      : context
                                          .read(editStartingPointProvider)
                                          .state
                                          .longitude
                                          .toString(),

                                  endLatitude: context
                                              .read(editEndingPointProvider)
                                              .state ==
                                          null
                                      ? orderData.endLatitude
                                      : context
                                          .read(editEndingPointProvider)
                                          .state
                                          .toString(),
                                  endLongitude: context
                                              .read(editEndingPointProvider)
                                              .state ==
                                          null
                                      ? orderData.endLongitude
                                      : context
                                          .read(editEndingPointProvider)
                                          .state
                                          .longitude
                                          .toString(),
                                  receiveDateStart: context
                                              .read(editOrderDateProvider)
                                              .state ==
                                          null
                                      ? orderData.receiveDateStart
                                      : context
                                          .read(editOrderDateProvider)
                                          .state,
                                  receiveTimeStart: context
                                              .read(editOrderTimeProvider)
                                              .state ==
                                          null
                                      ? orderData.receiveTimeStart
                                      : context
                                          .read(editOrderTimeProvider)
                                          .state,
                                  completeDateStart: '2021-10-06',
                                  completeTimeStart: '00:00',
                                  details: descriptionCnt.text,
                                ),
                              ).then(
                                (value) {
                                  context.read(editOrderLoadingProvider).state =
                                      false;
                                  ViewFunctions.messageDialog(
                                      context: context,
                                      message: value.message,
                                      function: value.code == 200
                                          ? () {
                                              context
                                                  .read(
                                                      editStartingPointProvider)
                                                  .state = null;
                                              context
                                                  .read(editEndingPointProvider)
                                                  .state = null;
                                              CustomNavigator
                                                  .pushScreenRepcalement(
                                                context: context,
                                                widget: OrdersPage(),
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
