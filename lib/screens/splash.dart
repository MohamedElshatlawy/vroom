import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/models/request/auth/login_request.dart';
import 'package:v_room_app/repository/authRepo/auth_repo.dart';
import 'package:v_room_app/screens/helpers/routes.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/screens/onboarding/intro.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/utils/TokenUtil.dart';
import 'package:v_room_app/viewModel/AuthViewModels/authController.dart';

import '../main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Stream<String> _tokenStream;

  void setToken(String token) {
    print('FCM Token: $token');
    context.read(fcmTokenProvider).state=token;
  }
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {});
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Splash(),),);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => Splash(),),);
    });

    FirebaseMessaging.instance
        .getToken(
        vapidKey:
        'AAAAuX90nwQ:APA91bE7BrmzCF4ypsnP9djpNvf01p0HNxzpsL0Uam1suVyFfVZ-XkSWmvT8IZ1nbuwTaQzJ-722XFeBZbw692yubVb_4CfIG6gPTAWQnvhKlIF5pb6coB6DtXFEcUt87hNs282HdGS1')
        .then(setToken);
    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream.listen(setToken);

    Future.delayed(Duration(seconds: 2), () async {
      CustomNavigator.pushScreenRepcalement(
        widget: IntroPage() ,
        context: context,
      );
      // var loginData = LoginRequest(
      //     countryId: "966", password: "123456789", phone: "123443322");

      // var m = await AuthRepository.login(loginRequest: loginData);

      // log("${m.toJson()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        color: ColorsUtils.kPrimaryColor,
        alignment: Alignment.center,
        child: Container(
          height: 86.35.h,
          width: 239.46.w,
          child: Image(
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
