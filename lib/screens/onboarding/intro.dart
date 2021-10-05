import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_room_app/screens/onboarding/introPage1.dart';
import 'package:v_room_app/screens/onboarding/introPage2.dart';
import 'package:v_room_app/screens/onboarding/introPage3.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/viewModel/onboardViewModels/pageController.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, widget) {
          final selectedIndex = watch(selectedIndexProvider).state;
          final pageController = watch(pageControllerProvider).state;
          return Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (int page) {
                    context.read(selectedIndexProvider).state = page;
                  },
                  scrollDirection: Axis.horizontal,
                  children: [
                    IntroPage1(
                      selectedIndex: selectedIndex,
                    ),
                    IntroPage2(
                      selectedIndex: selectedIndex,
                    ),
                    IntroPage3(
                      selectedIndex: selectedIndex,
                    ),
                  ],
                ),
              ),
              Text(
                'vrooom',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorsUtils.kPrimaryColor,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          );
        },
      ),
    );
  }
}
