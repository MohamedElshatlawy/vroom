import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/request/orders/all_order_request.dart';
import 'package:v_room_app/models/response/orders/all_order_response.dart';
import 'package:v_room_app/repository/OrderRepo/orders_repo.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/journey/journey_details_page.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class RecentOrderItem extends StatelessWidget {
  RecentOrderItem();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AllOrderResponse>(
      future: OrdersRepository.getAllOrders(
        allOrderRequest: AllOrderRequest(status: null, type: 'recent'),
      ),
      builder:
          (BuildContext context, AsyncSnapshot<AllOrderResponse> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            {
              return Center(
                child: SpinKitWave(
                  color: ColorsUtils.kPrimaryColor,
                  size: 50.w,
                ),
              );
            }
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.data.message}',
                ),
              );
            } else {
              return snapshot.data.order.isEmpty ?  Center(
                child: Text(
                  'No orders yet',
                  style: TextStyle(
                    color: ColorsUtils.titleColor,
                    fontSize: 20.sp,
                  ),
                ),
              ): ListView.builder(
                itemCount: snapshot.data.order.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12.h),
                    margin: EdgeInsets.symmetric(vertical: 4.h),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image(
                            height: 64.h,
                            width: 64.h,
                            image: AssetImage('assets/images/truck.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              '${S.of(context).payload} : 30 tons',
                              style: TextStyle(
                                color: ColorsUtils.greyTextColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            CustomNavigator.pushScreen(
                              widget: JourneyDetails(),
                              context: context,
                            );
                          },
                          child: Container(
                            width: 94.w,
                            height: 28.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorsUtils.kButtonPrimaryColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              S.of(context).viewDetails,
                              style: TextStyle(
                                color: ColorsUtils.kPrimaryColor,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
        }
      },
    );
  }
}
