import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/appBar.dart';
import 'package:v_room_app/screens/widgets/bottomNavigationBar.dart';
import 'package:v_room_app/screens/widgets/current_order_item.dart';
import 'package:v_room_app/screens/widgets/recent_order_item.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_room_app/utils/Enums.dart';

class OrdersPage extends StatelessWidget {
  OrdersPage();

  StateProvider ordersTypeProvider = StateProvider<String>((ref) => OrdersTypesEnum.current);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.homeBackGroundColor,
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 13.w,
          vertical: 21.h,
        ),
        child: Column(
          children: [
            Container(
              height: 34.h,
              width: 229.w,
              decoration: BoxDecoration(
                color: ColorsUtils.kPrimaryColor,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: ColorsUtils.kPrimaryColor,
                  width: 2,
                ),
              ),
              child: Consumer(
                builder: (context, watch, widget) {
                  final String ordersType = watch(ordersTypeProvider).state;
                  return Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.read(ordersTypeProvider).state =
                                OrdersTypesEnum.recent;
                          },
                          child: Container(
                            color: ordersType == OrdersTypesEnum.recent
                                ? ColorsUtils.whiteColor
                                : ColorsUtils.kPrimaryColor,
                            alignment: Alignment.center,
                            child: Text(
                              S.of(context).recent,
                              style: TextStyle(
                                color: ordersType == OrdersTypesEnum.recent
                                    ? ColorsUtils.kPrimaryColor
                                    : ColorsUtils.whiteColor,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.read(ordersTypeProvider).state =
                                OrdersTypesEnum.current;
                          },
                          child: Container(
                            color: ordersType == OrdersTypesEnum.current
                                ? ColorsUtils.whiteColor
                                : ColorsUtils.kPrimaryColor,
                            alignment: Alignment.center,
                            child: Text(
                              S.of(context).current1,
                              style: TextStyle(
                                color: ordersType == OrdersTypesEnum.current
                                    ? ColorsUtils.kPrimaryColor
                                    : ColorsUtils.whiteColor,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).filterLTH,
                      style: TextStyle(
                        color: ColorsUtils.titleColor,
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(
                      width: 6.3.w,
                    ),
                    Image(
                      height: 26.h,
                      width: 24.h,
                      image: AssetImage('assets/images/filter.png'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Expanded(
              child: Consumer(
                builder: (context, watch, widget) {
                  final String ordersType = watch(ordersTypeProvider).state;
                  return ordersType == OrdersTypesEnum.current
                      ? CurrentOrderItem()
                      : RecentOrderItem();
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomBottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
