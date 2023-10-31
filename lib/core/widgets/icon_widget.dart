
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:microtectask/core/utils/color_constant.dart';
class IconWidget extends StatelessWidget {
 final String? imagePath;
 const IconWidget({Key? key, @required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.w,

      decoration: BoxDecoration(
        border: Border.all(
          color: dividerColor, // border color
        ),

        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
          child: Image.asset(imagePath!,width:20.w,
            height: 20.h,)
      ),

    );
  }
}
