import 'package:flutter/material.dart';
import 'package:microtectask/core/navigation/navigator_service/navigator_service.dart';
import 'package:microtectask/core/utils/app_end_point.dart';
import 'package:microtectask/core/utils/color_constant.dart';
import 'package:microtectask/core/utils/consts.dart';
import 'package:microtectask/core/widgets/custom_text.dart';
import 'package:microtectask/features/all_films_page/domain/params/flim_details_params.dart';
import 'package:microtectask/features/all_films_page/presentation/manager/films_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:microtectask/features/all_films_page/presentation/widgets/cast_list_item.dart';

class FilmDetailsScreen extends StatefulWidget {
  final Map<String, dynamic>?extraData;

  const FilmDetailsScreen({super.key, this.extraData});

  @override
  State<FilmDetailsScreen> createState() => _FilmDetailsScreenState();
}

class _FilmDetailsScreenState extends State<FilmDetailsScreen> {
  @override
  void initState() {
    debugPrint("arguments{${widget.extraData}");
    BlocProvider.of<FilmsBloc>(context).add(
        GetFilmDetailsEvent(FilmDetailsParam(
            widget.extraData?[ "film_id"]
        )));
    BlocProvider.of<FilmsBloc>(context).add(GetFilmCastEvent(FilmDetailsParam(
        widget.extraData?[ "film_id"]
    )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FilmsBloc, FilmsState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return state is Loading?Center(child: CircularProgressIndicator()): Column(
            children: [
              SafeArea(
                child: Stack(
                  children: [
                    Image(
                      image: NetworkImage(
                          "$baseImageUrl${BlocProvider.of<FilmsBloc>(context).filmsDetailsModel?.posterPath}"
                          ),
                      height: 256.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 50.h,
                      right: 20.w,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: white,
                        child:    BackButton(


                          color: blackColor,

                          onPressed: () {
                            NavigatorService.goBack();
                          },
                        ),
                      ),
                    ),

                  ],
                ),

              ),
              SizedBox(
                height: 40.h,
                child: Padding(
                     padding:  EdgeInsets.only(left: 10.w),
                  child: CustomText(
                    BlocProvider.of<FilmsBloc>(context).filmsDetailsModel?.title??"",
                    style: TextStyle(

                      fontFamily: montserratArabic,
                      color: brownColor,
                      fontSize: 15.sp,

                      fontWeight: FontWeight.bold,
                    ),

                    textAlign:
                    TextAlign.start,
                  ),
                ),
              ),
              SizedBox(
                height: 120.h,
                child: Padding(
                  padding:  EdgeInsets.only(left: 10.w),
                  child: CustomText(
                    BlocProvider.of<FilmsBloc>(context).filmsDetailsModel?.overview??"" ,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight:
                        FontWeight.w400,
                        color: itemColor,
                        fontFamily: montserratArabic),
                    textAlign:
                    TextAlign.start,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10.w,),
                  CustomText(
                    "Film Cast",
                    style: TextStyle(

                        fontFamily: montserratArabic,
                        color: brownColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),

                  ),
                ],
              ),
              SizedBox(
                height: 180.h,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,



                  itemCount:BlocProvider.of<FilmsBloc>(context).castModel?.cast?.length??0,
                  itemBuilder:
                      (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150.w,


                        decoration: BoxDecoration(
                          border: Border.all(
                              color: textColor),
                          color: white,
                          borderRadius:
                          BorderRadius.circular(
                              10),
                        ),
                        child: CastListItem(
                          imageUrl: "$baseImageUrl${BlocProvider.of<FilmsBloc>(context).castModel?.cast?[index].profilePath}",
                          name: BlocProvider.of<FilmsBloc>(context).castModel?.cast?[index].name,
                          character: BlocProvider.of<FilmsBloc>(context).castModel?.cast?[index].character ,
                        ),

                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
