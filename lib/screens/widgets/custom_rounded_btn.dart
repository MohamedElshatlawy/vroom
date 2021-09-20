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
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: borderColor ?? ColorsUtils.primaryGreen)),
        color: backgroundColor,
        onPressed: pressed ?? () {},
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
                        fontSize: fontSize ?? ScreenUtil().setSp(15)),
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
