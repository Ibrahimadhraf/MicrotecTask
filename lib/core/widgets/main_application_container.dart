
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:microtectask/core/utils/color_constant.dart';
class MainApplicationContainer extends StatelessWidget {
  final Widget? child;
  const MainApplicationContainer({super.key,this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(

        width: double.infinity,
        height: ScreenUtil.defaultSize.height*.8,
        decoration: BoxDecoration(

          color: backGround,

          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.h),
              topRight: Radius.circular(35.h)
          ),
        ),
        child: child,
      ),
    );
  }
}
