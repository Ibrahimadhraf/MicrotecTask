import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/consts.dart';



class CustomButton extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;
  final Function()? onLongPress;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double?height;
  final bool? fixed;
  final BorderSide? side;
  final double? borderRadius;

  const CustomButton({
    Key? key,
    this.child,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.width,
    this.fixed = false,
    this.onPressed,
    this.side,
    this.onLongPress,
    this.height,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      width: fixed! ? width : double.infinity,
      height:height?? 40.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? radius),
            side: side ?? BorderSide.none,
          ),
          elevation: 0.0,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: onPressed == null
            ? const CircularProgressIndicator()
            : Center(child: child),
      ),
    );
  }
}
