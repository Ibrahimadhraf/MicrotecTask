import 'package:flutter/material.dart';
import 'package:microtectask/core/navigation/navigator_service/navigator_service.dart';
import 'package:microtectask/core/navigation/routes/app_routes.dart';
import 'package:microtectask/core/utils/app_end_point.dart';
import 'package:microtectask/core/utils/color_constant.dart';
import 'package:microtectask/core/utils/consts.dart';
import 'package:microtectask/core/widgets/custom_text.dart';
import 'package:microtectask/features/all_films_page/domain/params/all_films_params.dart';
import 'package:microtectask/features/all_films_page/presentation/manager/films_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microtectask/features/all_films_page/presentation/widgets/flim_list_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultScreen extends StatefulWidget {
  final Map<String, dynamic>?extraData;

  const SearchResultScreen({super.key,this.extraData});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  int page = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
     BlocProvider.of<FilmsBloc>(context).add(GetFilmsSearchResultEvent(AllFilmsParams(page:page,title: widget.extraData?[ "title"])));
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (BlocProvider.of<FilmsBloc>(context).filmsModel != null &&
          page <= BlocProvider.of<FilmsBloc>(context).filmsModel!.totalPages!) {
        page = page + 1;
        setState(() {});
        BlocProvider.of<FilmsBloc>(context).add(GetFilmsSearchResultEvent(AllFilmsParams(page:page,title: widget.extraData?[   "title"])));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   CustomText(
          widget.extraData?[   "title"],
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight:
              FontWeight.w400,

              color: white,

              fontFamily: montserratArabic),
          textAlign:
          TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: BlocConsumer<FilmsBloc, FilmsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is Loading
              ? Center(child: const CircularProgressIndicator())
              : GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                  ),
                  itemCount: BlocProvider.of<FilmsBloc>(context)
                          .filmsModelResult
                          ?.results
                          ?.length ??
                      0,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        NavigatorService.pushNamed(AppRoutes.filmDetailsScreen,
                            arguments: {
                              "film_id": BlocProvider.of<FilmsBloc>(context)
                                  .filmsModelResult
                                  ?.results?[index]
                                  .id
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 170.w,
                          height: 206.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: textColor),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FilmsListItem(
                            imageUrl:
                                "$baseImageUrl${BlocProvider.of<FilmsBloc>(context).filmsModelResult?.results?[index].posterPath}",
                            name: BlocProvider.of<FilmsBloc>(context)
                                .filmsModelResult
                                ?.results?[index]
                                .title,
                            date:
                                "${BlocProvider.of<FilmsBloc>(context).filmsModelResult?.results?[index].releaseDate?.year}-${BlocProvider.of<FilmsBloc>(context).filmsModelResult?.results?[index].releaseDate?.month}-${BlocProvider.of<FilmsBloc>(context).filmsModelResult?.results?[index].releaseDate?.day}",
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
