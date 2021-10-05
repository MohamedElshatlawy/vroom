import 'package:flutter/material.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({this.isBack = false});
  bool isBack;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        height: 97.h,
        padding: EdgeInsets.only(
          bottom: 10.h,
        ),
        width: 1.sw,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: ColorsUtils.kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isBack
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.w),
                    child: InkWell(
                      onTap: (){
                        CustomNavigator.popScreen(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: ColorsUtils.whiteColor,
                      ),
                    ),
                  )
                : SizedBox(
                    width: 60.w,
                  ),
            Image(
              image: AssetImage('assets/images/vRooom.png'),
            ),
            SizedBox(
              width: 60.w,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
