import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/appBar.dart';
import 'package:v_room_app/screens/widgets/bottomNavigationBar.dart';

class OffersPage extends StatelessWidget {
  OffersPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        appBar: CustomAppBar(),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 13.w,
            vertical: 21.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).offers,
                    style: TextStyle(
                      color: Color(0xFF1F2937),
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).filterLTH,
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(
                        width: 6.3.w,
                      ),
                      Image(
                        height: 26.h,
                        width: 24.h,
                        image: AssetImage('assets/images/filter.png'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 27.h,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(12.h),
                        margin: EdgeInsets.symmetric(vertical: 4.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF222222).withOpacity(0.06),
                                blurRadius: 8,
                                offset: Offset(0, 1),
                              ),
                            ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image(
                                height: 64.h,
                                width: 64.h,
                                image: AssetImage('assets/images/truck.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 15.9.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mohamed Ali',
                                  style: TextStyle(
                                    color: Color(0xFF1F2937),
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 9.h,
                                ),
                                Text(
                                  '58 \$',
                                  style: TextStyle(
                                    color: Color(0xFF1F2937),
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 88.w,
                                  height: 28.h,
                                  margin: EdgeInsets.only(bottom: 9.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF50DB88),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Text(
                                    S.of(context).accept,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Image(
                                     height: 9.h,
                                     width: 9.h,
                                     image: AssetImage('assets/images/location.png'),
                                   ),
                                   SizedBox(
                                     width: 6.3.w,
                                   ),
                                   Text(
                                     '3 KM away',
                                     style: TextStyle(
                                       color: Color(0xFF1F2937),
                                       fontSize: 10.sp,
                                     ),
                                   ),
                                 ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomBottomNavigationBar(),
            ],
          ),
        ),
    );
  }
}
