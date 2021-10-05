import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class CustomRoundedButton extends StatelessWidget {
  String text;
  Function pressed;
  Color backgroundColor;
  Color textColor;
  Color borderColor;
  Icon icon;
  double width;
  double height;
  bool iconLeft;
  double fontSize;
  CustomRoundedButton(
      {this.pressed,
      this.text,
      this.backgroundColor,
      this.borderColor,
      this.icon,
      this.textColor,
      this.width,
      this.iconLeft = false,
      this.height,
      this.fontSize});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed ?? () {},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorsUtils.kButtonPrimaryColor,
          borderRadius: BorderRadius.circular(12.r),
          border: borderColor ?? Border.all(
            color: borderColor ?? ColorsUtils.transparentColor,
          ),
        ),
        child: iconLeft
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (icon == null) ? Container() : icon,
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w800,
                        fontSize: ScreenUtil().setSp(15)),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w800,
                        fontSize: fontSize ?? ScreenUtil().setSp(15),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  (icon == null) ? Container() : icon
                ],
              ),
      ),
    );
  }
}
