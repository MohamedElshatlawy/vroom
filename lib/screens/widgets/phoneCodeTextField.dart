import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneCodeTextField extends StatelessWidget {
  PhoneCodeTextField({
    this.controller,
  });

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67.h,
      width: 60.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: ColorsUtils.filledColor
      ),
      child: TextFormField(
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide.none
          ),
          disabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide.none
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide.none
          ),
          fillColor: ColorsUtils.filledColor,
          filled: true,
        ),
      ),
    );
  }
}
