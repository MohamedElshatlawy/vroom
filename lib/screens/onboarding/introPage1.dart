import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/intro_arrow_button.dart';
import 'package:v_room_app/screens/widgets/pageIndicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/viewModel/onboardViewModels/pageController.dart';

class IntroPage1 extends StatelessWidget {
  IntroPage1({
    @required this.selectedIndex,
  });
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.h,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 461.67.h,
              width: 1.sw,
              child: Image(
                image: AssetImage('assets/images/introBackground1.png'),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 206.h,
              width: 347.w,
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/images/intro1.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              left: 250.w,
              top: 220.h,
              child: Container(
                height: 72.h,
                width: 89.4.w,
                child: Image(
                  image: AssetImage('assets/images/intro_truck.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          S.of(context).introTitle1,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsUtils.titleColor,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0.w),
          child: Text(
            S.of(context).introDesc1,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorsUtils.smallTextColor,
              fontSize: 12.sp,
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 54.46.w,
              ),
              PageIndicator(
                selectedIndex,
              ),
              InkWell(
                onTap: () {
                  context.read(pageControllerProvider).state.animateToPage(
                      selectedIndex + 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: IntroArrowButton(
                  image: 'arrow_right.png',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
