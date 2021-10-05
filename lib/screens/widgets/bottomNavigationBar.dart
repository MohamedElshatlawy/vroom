import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/screens/orders/orders.dart';
import 'package:v_room_app/screens/profile.dart';
import 'package:v_room_app/screens/setting.dart';
import 'package:v_room_app/screens/widgets/bottom_navigation_bar_item.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/utils/Enums.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({this.page});

  String page;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67.h,
      width: 375.w,
      decoration: BoxDecoration(
        color: ColorsUtils.blackFillColor,
        borderRadius: BorderRadius.circular(19.r),
      ),
      child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationBarItem(
                page: PagesEnum.setting,
                image: 'setting-lines',
                routeTo: SettingPage(),
              ),
              CustomBottomNavigationBarItem(
                page: PagesEnum.profile,
                image: 'user',
                routeTo: ProfilePage(),
              ),
              CustomBottomNavigationBarItem(
                page: PagesEnum.orders,
                image: 'timetable',
                routeTo: OrdersPage(),
              ),
              CustomBottomNavigationBarItem(
                page: PagesEnum.home,
                image: 'home',
                routeTo: HomePage(),
              ),
            ],
          ),
    );
  }
}
