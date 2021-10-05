import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_room_app/screens/helpers/view_functions.dart';
import 'package:v_room_app/screens/widgets/appBar.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:v_room_app/utils/Enums.dart';
import 'package:v_room_app/viewModel/Orders/orders_controller.dart';

class EditOrderMapPage extends StatelessWidget {
  EditOrderMapPage({
    this.choosePoint,
  });

  String choosePoint;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(29.965606, 31.270301),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.homeBackGroundColor,
      appBar: CustomAppBar(
        isBack: true,
      ),
      body: Stack(
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            color: ColorsUtils.darkBlueGreyTextColor,
            child: Consumer(
              builder: (context, watch, widget) {
                final Map<MarkerId, Marker> markers =
                    watch(editOrderMarkersProvider).state;
                watch(editStartingPointProvider).state;
                watch(editEndingPointProvider).state;
                return GoogleMap(
                  mapType: MapType.normal,
                  compassEnabled: false,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationEnabled: false,
                  initialCameraPosition: _kGooglePlex,
                  markers: Set<Marker>.of(markers.values),
                  onTap: (value) {
                    if (choosePoint == PointsEnum.start) {
                      final MarkerId markerId = MarkerId('starting');
                      context.read(editOrderMarkersProvider).state[markerId] =
                          Marker(
                        markerId: MarkerId('starting'),
                        position: value,
                        infoWindow: InfoWindow(
                          title: 'starting point',
                        ),
                      );
                      context.read(editStartingPointProvider).state = value;
                      ViewFunctions.getAddressByCoordinates(
                        context: context,
                        location: value,
                        point: PointsEnum.start,
                        orderType: 'edit'
                      );
                    } else {
                      final MarkerId markerId = MarkerId('ending');
                      context.read(editOrderMarkersProvider).state[markerId] =
                          Marker(
                        markerId: MarkerId('ending'),
                        position: value,
                        infoWindow: InfoWindow(
                          title: 'ending point',
                        ),
                      );
                      context.read(editEndingPointProvider).state = value;
                      ViewFunctions.getAddressByCoordinates(
                        context: context,
                        location: value,
                        point: PointsEnum.end,
                        orderType: 'edit'
                      );
                    }
                  },
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  height: 195.h,
                  width: 364.w,
                  margin: EdgeInsets.symmetric(
                    horizontal: 32.w,
                  ),
                  padding: EdgeInsets.only(
                    left: 12.w,
                    right: 12.w,
                    top: 34.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsUtils.blackFillColor,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 58.h,
                            width: 58.h,
                            decoration: BoxDecoration(
                              color:
                                  ColorsUtils.greyFillColor.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Icon(
                              Icons.location_on,
                              color: ColorsUtils.kPrimaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Home',
                                style: TextStyle(
                                  color: ColorsUtils.whiteColor,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                '23 st Marsa Matrouh Egypt',
                                style: TextStyle(
                                  color: ColorsUtils.greyFillColor,
                                  fontSize: 17.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Divider(
                        color: ColorsUtils.dividerColor,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.line_weight,
                              color: ColorsUtils.kPrimaryColor,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              'Add to my places',
                              style: TextStyle(
                                color: ColorsUtils.greyFillColor,
                                fontSize: 17.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 6.h,
                  width: 40.h,
                  decoration: BoxDecoration(
                    color: ColorsUtils.blackFillColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                SizedBox(
                  height: 54.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
