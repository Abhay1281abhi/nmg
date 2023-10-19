import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_constants.dart';

class FilledButton extends StatelessWidget {
  String?title;
  Color?textColor;
  Widget?widget;
  Color?boxColor;
  double?width;
  double?height;
  double?textSize;
  void Function()? onTap;
   FilledButton({Key? key,this.title,this.widget,this.height,this.textSize,this.onTap,this.width,this.boxColor,this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: height??37.h,
        width: width??MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color:boxColor?? ColorConstants.lightBlue,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget??SizedBox(),
              Text(title??"",style: TextStyle(
                color:textColor??ColorConstants.blackColor,
                fontSize: textSize??16.sp,
                fontWeight: FontWeight.w600,
              )),
            ],
          ),
        ),
      ),
    );
  }
}


class EmptyButton extends StatelessWidget {
  String?title;
  Color?textColor,boxColor;
  void Function()? onTap;
   EmptyButton({Key? key,this.title,this.boxColor,this.onTap,this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: 37.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: boxColor??ColorConstants.lightBlue),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Center(
          child: Text(title??"",style: TextStyle(
            color: textColor??ColorConstants.lightBlue,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
    );
  }
}
