import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/intro_arrow_button.dart';
import 'package:v_room_app/screens/widgets/pageIndicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/viewModel/onboardViewModels/pageController.dart';

class IntroPage2 extends StatelessWidget {
  IntroPage2({
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
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage('assets/images/introBackground2.png'),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 100.h,
              child: Container(
                height: 328.65.h,
                width: 301.6.w,
                child: Image(
                  image: AssetImage('assets/images/intro2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          S.of(context).introTitle2,
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
            S.of(context).introDesc2,
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
              InkWell(
                onTap: () {
                  context.read(pageControllerProvider).state.animateToPage(
                        selectedIndex - 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                },
                child: IntroArrowButton(
                  image: 'arrow_left.png',
                ),
              ),
              PageIndicator(
                selectedIndex,
              ),
              InkWell(
                onTap: () {
                  context.read(pageControllerProvider).state.animateToPage(
                        selectedIndex + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
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
