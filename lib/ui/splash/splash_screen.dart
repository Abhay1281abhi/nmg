  import 'dart:async';
import 'package:nmg/common/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../api/service/navigation_service.dart';
import '../../common/constant/app_utils.dart';
import '../../common/constant/color_constants.dart';
import '../../common/locator/locator.dart';
import '../../common/router/router.gr.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return  Timer(duration, navigationPage);
  }

  void navigationPage() async {
    locator<NavigationService>().pushAndRemoveUntil(const DashboardScreenRoute());
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return  Scaffold(
      backgroundColor: ColorConstants.blackColor,
      body: Center(
        child: Text(StringControl.appName,style: TextStyle(
          fontSize: 26.sp,
          color: ColorConstants.whiteColor,
          fontWeight: FontWeight.w400,
        ),),
      )
    );
  }
}
