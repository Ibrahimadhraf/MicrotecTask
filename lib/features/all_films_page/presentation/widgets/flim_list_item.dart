import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:microtectask/core/utils/color_constant.dart';
import 'package:microtectask/core/utils/consts.dart';
import 'package:microtectask/core/widgets/custom_text.dart';
class FilmsListItem extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? imageUrl;
  final String? name;

  final String? date;









  const FilmsListItem({super.key,this.onTap,this.imageUrl,this.name,this.date});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior:
        Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(10)),
        ),
        width: 120.w,
        child: Column(
          children: [
            SizedBox(
              height: 90.h,
              width: 170.w,
              child: Image.network(
                imageUrl??""
                ,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.all(8.0),
                  child:SizedBox(

                    width: 100,
                    height: 20,
                    child: Center(
                      child: CustomText(
                        name??"",
                        style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight:
                            FontWeight.w600,
                            fontFamily: montserratArabic),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                color: secondWhite,
                width: 120.w,
                height: 30.h,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .start,
                  children: [
                    CustomText(
                    "ReleaseDate:",
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight:
                          FontWeight.w400,
                          color: itemColor,
                          fontFamily: montserratArabic),
                      textAlign:
                      TextAlign.center,
                    ),
                    SizedBox(width: 4,),

                    CustomText(
                      "$date",
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight:
                          FontWeight.w400,
                          color: itemColor,
                          fontFamily: montserratArabic),
                      textAlign:
                      TextAlign.center,
                    ),
                  ],
                )),

          ],
        ),
      ),
    );
  }

}
