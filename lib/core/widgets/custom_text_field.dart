
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:microtectask/core/utils/color_constant.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final TextAlign textAlign;
  final String? hintText;
  final String? helperText;
  final Widget? icon;
  final bool enabled;
  final Widget? label;
  final Color? customBorderColor;
  final bool enableInteractiveSelection;
  bool obscureText;
  bool isPass;
  final TextDirection? textDirection;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onChanged;
  final String? Function(String? value)? onSaved;
  final String? Function(String? value)? onFieldSubmitted;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? textColor;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final double? borderRaduis;
  final double? borderWidth;
  final String? initialValue;
  final Widget? suffixIcon;
  final bool? isReadonly;
  final AutovalidateMode? autovalidateMode;

  CustomTextField({
    Key? key,
    this.customBorderColor,
    this.controller,
    this.suffixIcon,
    this.focusNode,
    this.borderRaduis,
    this.borderWidth,
    this.textColor,
    this.fillColor,
    this.keyboardType,
    this.maxLines,
    this.label,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.icon,
    this.hintText,
    this.helperText,
    this.contentPadding,
    this.enabled = true,
    this.enableInteractiveSelection = true,
    this.obscureText = false,
    this.isPass = false,
    this.textDirection,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.onTap,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.padding,
    this.inputFormatters,
    this.initialValue,
    this.isReadonly,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: TextFormField(

        minLines: widget.maxLines,
        readOnly: widget.isReadonly ?? false,

        initialValue: widget.initialValue,

        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: widget.textColor),
        //controller: widget.controller,
        controller: widget.controller?..selection = TextSelection.fromPosition( TextPosition(offset: widget.controller?.text.length ?? 0)),
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        textAlign: widget.textAlign,
        autovalidateMode: widget.autovalidateMode,
        // style: TextStyle(color: Colors.black),
        decoration: InputDecoration(

          fillColor: widget.fillColor ?? Colors.white,
          filled: true,
          hintText: widget.hintText,
          label: widget.label,

          helperText: widget.helperText,
          contentPadding: widget.contentPadding ??
              (widget.icon != null
                  ? EdgeInsets.zero
                  : EdgeInsetsDirectional.only(start: 20.w)),
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: widget.textColor),
          prefixIcon: widget.icon,
          suffixIcon: widget.suffixIcon ??
              (widget.isPass
                  ? InkWell(
                      child: Icon(
                        _visiblePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                        size: 14,
                      ),
                      onTap: () {
                        setState(() {
                          _visiblePassword = !_visiblePassword;
                          widget.isPass = !widget.isPass;
                          widget.obscureText = !widget.obscureText;
                        });
                      },
                    )
                  : null),

          counterStyle: const TextStyle(fontSize: 0, color: Colors.transparent),
          // suffixIcon: Padding(
          //   padding: EdgeInsets.only(right: 20),
          //   child: icon,
          // ),
          errorMaxLines: 3,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRaduis ?? 8),
            borderSide: BorderSide(
                color: widget.customBorderColor ?? borderColor,
                width: widget.borderWidth ?? 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRaduis ?? 8),
            borderSide: BorderSide(
                color: widget.customBorderColor ?? borderColor,
                width: widget.borderWidth ?? 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRaduis ?? 8),
            borderSide:
                BorderSide(color: Colors.red, width: widget.borderWidth ?? 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRaduis ?? 8),
            borderSide:
                BorderSide(color: Colors.red, width: widget.borderWidth ?? 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        enabled: widget.enabled,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        focusNode: widget.focusNode,
        inputFormatters: widget.inputFormatters!,
        obscureText: widget.isPass,
        textDirection: widget.textDirection,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onFieldSubmitted,
        onTap: widget.onTap,
      ),
    );
  }
}
