import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microtectask/core/navigation/navigator_service/navigator_service.dart';
import 'package:microtectask/core/navigation/routes/app_routes.dart';
import 'package:microtectask/core/utils/app_end_point.dart';
import 'package:microtectask/core/utils/color_constant.dart';
import 'package:microtectask/core/utils/consts.dart';
import 'package:microtectask/core/widgets/custom_text.dart';
import 'package:microtectask/core/widgets/custom_text_field.dart';
import 'package:microtectask/features/all_films_page/domain/params/all_films_params.dart';
import 'package:microtectask/features/all_films_page/presentation/manager/films_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:microtectask/features/all_films_page/presentation/widgets/flim_list_item.dart';

class FilmsPage extends StatefulWidget {
  const FilmsPage({super.key});

  @override
  State<FilmsPage> createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  int page=1;
  final ScrollController _scrollController = ScrollController();
  TextEditingController searchTextEditingController = TextEditingController();
  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    BlocProvider.of<FilmsBloc>(context).add(GetAllFilmsEvent(AllFilmsParams(page:page)));
    super.initState();
  }
  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      if(BlocProvider.of<FilmsBloc>(context).filmsModel!=null&&page<=BlocProvider.of<FilmsBloc>(context).filmsModel!.totalPages!){
        page=page+1;
        setState(() {

        });
        BlocProvider.of<FilmsBloc>(context).add(GetAllFilmsEvent(AllFilmsParams(page: page)));

      }


      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BlocConsumer<FilmsBloc, FilmsState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return State is Loading?const CircularProgressIndicator(
      color: primaryColor,
    ):
    SafeArea(
      child: Column(
        children: [
          CustomTextField(
            borderRaduis: 25.w,
            customBorderColor: strokColor,
            controller: searchTextEditingController,
            margin: EdgeInsets.all(13.w),
            label: CustomText(
              "Search For Films"
              ,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: textColor,fontSize: 13.sp),
            ),
            icon: GestureDetector(
              onTap: (){
                if(searchTextEditingController.text.isNotEmpty){

                  NavigatorService.pushNamed(AppRoutes.searchResultScreen,
                      arguments: {
                        "title":searchTextEditingController.text
                      }
                  );
                }

              },
              child: Icon(Icons.search,size: 20.w,),
            ),
            keyboardType: TextInputType.text,
            fillColor: Colors.white,
            inputFormatters: const [],
            validator: (value) {

                if (value!.isEmpty) {
                  return "thisFieldIsRequired";
                }

                return null;

            },
          ),
       state is Loading  ?const CircularProgressIndicator():  Expanded(
            child: GridView.builder(
                controller: _scrollController,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .85,
                ),
                itemCount:BlocProvider.of<FilmsBloc>(context).filmsModel?.results?.length??0,
                itemBuilder:
                    (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                  NavigatorService.pushNamed(AppRoutes.filmDetailsScreen,
                    arguments: {
                    "film_id":BlocProvider.of<FilmsBloc>(context).filmsModel?.results?[index].id
                    }
                  );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 170.w,
                          height: 206.h,

                          decoration: BoxDecoration(
                            border: Border.all(
                                color: textColor),
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(
                                10),
                          ),
                           child: FilmsListItem(
                             imageUrl: "$baseImageUrl${BlocProvider.of<FilmsBloc>(context).filmsModel?.results?[index].posterPath}",
                             name: BlocProvider.of<FilmsBloc>(context).filmsModel?.results?[index].title,
                             date:"${BlocProvider.of<FilmsBloc>(context).filmsModel?.results?[index].releaseDate?.year}-${BlocProvider.of<FilmsBloc>(context).filmsModel?.results?[index].releaseDate?.month}-${BlocProvider.of<FilmsBloc>(context).filmsModel?.results?[index].releaseDate?.day}" ,


                           ),
                          ),
                    ),
                  );
                },
              ),
          ),
        ],
      ),
    );
  },
),
    );
  }
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}
