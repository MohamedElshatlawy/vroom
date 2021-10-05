import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/request/home/truck_types_request.dart';
import 'package:v_room_app/models/response/home/truck_types_response.dart';
import 'package:v_room_app/repository/homeRepo/trucks_type_repo.dart';
import 'package:v_room_app/screens/widgets/appBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/screens/widgets/bottomNavigationBar.dart';
import 'package:v_room_app/screens/widgets/truck_item.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.homeBackGroundColor,
      appBar: CustomAppBar(),
      body: FutureBuilder<TruckTypesResponse>(
        future: TrucksTypeRepository.getTruckTypes(
            truckTypesRequest: TruckTypesRequest()),
        builder:
            (BuildContext context, AsyncSnapshot<TruckTypesResponse> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              {
                return Center(
                  child: SpinKitWave(
                    color: ColorsUtils.kPrimaryColor,
                    size: 50.w,
                  ),
                );
              }
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.data.message}',
                  ),
                );
              } else {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 19.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).trucksType,
                        style: TextStyle(
                          color: ColorsUtils.titleColor,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            //  mainAxisExtent: 190.h,
                            childAspectRatio: 1,
                            crossAxisSpacing: 17.w,
                            mainAxisSpacing: 17.h,
                          ),
                          itemCount: snapshot?.data?.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return TruckItem(
                              truckData: snapshot.data.data[index],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomBottomNavigationBar(),
                      ),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
