import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/request/orders/all_order_request.dart';
import 'package:v_room_app/models/response/orders/all_order_response.dart';
import 'package:v_room_app/models/response/orders/get_order_response.dart';
import 'package:v_room_app/repository/OrderRepo/orders_repo.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/offers/offers.dart';
import 'package:v_room_app/screens/orders/edit_order_page.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class CurrentOrderItem extends StatelessWidget {
  CurrentOrderItem();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AllOrderResponse>(
      future: OrdersRepository.getAllOrders(
        allOrderRequest: AllOrderRequest(status: null, type: 'current'),
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
              return snapshot.data.order.isEmpty
                  ? Center(
                      child: Text(
                        'No orders yet',
                        style: TextStyle(
                          color: ColorsUtils.titleColor,
                          fontSize: 20.sp,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data.order.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 114.h,
                          padding: EdgeInsets.symmetric(
                            vertical: 11.h,
                            horizontal: 7.w,
                          ),
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
                                  height: 92.h,
                                  width: 92.h,
                                  image: NetworkImage(snapshot.data.order[index].truckType.image),
                                  fit: BoxFit.fill,
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
                                    snapshot.data.order[index].truckType.name ,
                                    style: TextStyle(
                                      color: ColorsUtils.titleColor,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    '${S.of(context).payload} : 30 tons',
                                    style: TextStyle(
                                      color: ColorsUtils.greyTextColor,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color:snapshot.data.order[index].status == 'Active'? ColorsUtils.greenColor :ColorsUtils.kPrimaryColor,
                                        size: 9.w,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        snapshot.data.order[index].status,
                                        style: TextStyle(
                                          color: ColorsUtils.greyTextColor,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      CustomNavigator.pushScreen(
                                        widget: OffersPage(),
                                        context: context,
                                      );
                                    },
                                    child: Container(
                                      width: 94.w,
                                      height: 34.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ColorsUtils.kButtonPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Text(
                                        S.of(context).viewOffers,
                                        style: TextStyle(
                                          color: ColorsUtils.kPrimaryColor,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      CustomNavigator.pushScreen(
                                        widget: EditOrderPage(
                                          orderData: snapshot.data.order[index],
                                        ),
                                        context: context,
                                      );
                                    },
                                    child: Container(
                                      width: 94.w,
                                      height: 34.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ColorsUtils.kButtonRedColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Text(
                                        S.of(context).edit,
                                        style: TextStyle(
                                          color: ColorsUtils.whiteColor,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
