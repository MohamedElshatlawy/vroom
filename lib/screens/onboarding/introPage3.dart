import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/auth/welcome_page.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/widgets/intro_arrow_button.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/screens/widgets/pageIndicator.dart';
import 'package:v_room_app/viewModel/onboardViewModels/pageController.dart';

class IntroPage3 extends StatelessWidget {
  IntroPage3({
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
                image: AssetImage('assets/images/introBackground3.png'),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 278.h,
              width: 271.w,
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/images/intro3.png'),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 80.h,
              left: 30.w,
              child: Container(
                height: 170.h,
                width: 230.w,
                child: Image(
                  image: AssetImage('assets/images/intro3lines.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 70.h,
              right: 5.w,
              child: Container(
                height: 37.h,
                width: 37.h,
                child: Image(
                  image: AssetImage('assets/images/star.png'),
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
          S.of(context).introTitle3,
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
            S.of(context).introDesc3,
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
                  CustomNavigator.pushScreenRepcalement(
                    widget: WelcomePage(), context: context,
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
