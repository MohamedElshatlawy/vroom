import 'package:flutter/material.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_room_app/viewModel/bottom_navigation_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  CustomBottomNavigationBarItem({
    this.routeTo,
    this.page,
    this.image,
  });

  Widget routeTo;
  String page;
  String image;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, widget) {
      final String currentPage = watch(bottomNavigationProvider).state;
      return InkWell(
        onTap: () {
          context.read(bottomNavigationProvider).state = page;
          CustomNavigator.pushScreenRepcalement(
            widget: routeTo,
            context: context,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Image(
              image: AssetImage('assets/images/$image.png'),
              color: currentPage == page? ColorsUtils.kPrimaryColor:ColorsUtils.whiteColor,
            ),
            SizedBox(
              height: 5.h,
            ),
            Icon(
              Icons.circle,
              size: 5.w,
              color: currentPage == page? ColorsUtils.kPrimaryColor :ColorsUtils.blackFillColor,
            )
          ],
        ),
      );
    },
    );
  }
}
