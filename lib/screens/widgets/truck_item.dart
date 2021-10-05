import 'package:flutter/material.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/response/home/truck_types_response.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/orders/add_order_page.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TruckItem extends StatelessWidget {
  TruckItem({this.truckData});

  Truck truckData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        CustomNavigator.pushScreen(
          widget: AddOrder(truckData: truckData,), context: context,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 16,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6.r),
                topRight: Radius.circular(6.r),
              ),
              child: Image(
                image: NetworkImage(truckData.image),
                fit: BoxFit.fill,
                height: 120.h,
              ),
            ),
            Spacer(),
            Text(
              truckData?.name ?? '-',
              style: TextStyle(
                color: ColorsUtils.titleColor,
                fontSize: 13.sp,
              ),
            ),
            Spacer(),
            Text(
              '${S.of(context).payload} : 30 tons',
              style: TextStyle(
                color: ColorsUtils.greyTextColor,
                fontSize: 13.sp,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
