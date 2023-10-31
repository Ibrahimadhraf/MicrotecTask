
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:microtectask/core/utils/color_constant.dart';
import 'package:microtectask/core/utils/consts.dart';
import 'package:microtectask/core/widgets/custom_text.dart';

class CustomDropDownMenu extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final String? hint;
  final String? label;
  final Color? borderColor;
  final TextStyle? textStyle;
  final bool? isExpanded;
  final List<DropdownMenuItem<Object>> items;
  final Object? selectItem;
  final void Function(Object?)? onChanged;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? labelPadding;

  const CustomDropDownMenu(
      {Key? key,
      this.textStyle,
      this.labelStyle,
      required this.items,
      required this.selectItem,
      this.onChanged,
      this.borderColor,
      this.hint,
      this.label,
      this.color,
      this.width,
      this.labelPadding,
      this.height,
      this.margin,
      this.isExpanded,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        if (label != null)
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              CustomText(
                label!,
                style: labelStyle,
                padding: labelPadding,
              ),
            ],
          ),
        Container(
          width: width,
          height: height,
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color:Colors.white,
            border:
                Border.all(color: borderColor ?? dividerColor, width: 0.5),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DropdownButtonHideUnderline(
                child: items.isNotEmpty
                    ? DropdownButton(
                        isExpanded: isExpanded ?? false,
                        style: textStyle ??
                            Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: textColor),
                        value:
                            selectItem ?? (hint != "" ? null : items[0].value),
                        items: items,
                        hint: Text(
                          hint ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, color: textColor),
                        ),
                        icon: const Padding(
                          padding: EdgeInsetsDirectional.only(end: 5.0),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 24,
                            color: Colors.black,
                          ),
                        ),
                        onChanged: onChanged)
                    : const SizedBox(
                        height: 24.0 * 2,
                        width: double.infinity,
                      ),
              )),
        ),
      ],
    );
  }
}
