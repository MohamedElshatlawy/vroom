import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';




class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {

    });
    // Future.delayed(Duration(seconds: 2), () {
    //   CustomFunctions.pushScreenRepcalement(
    //       widget: OnBoardingHome(), context: context);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('test App'),
      ),
    );
  }
}
