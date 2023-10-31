import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:microtectask/core/language_helper/app_localizations.dart';
import 'package:microtectask/core/main_blocs/local_cubit.dart';
import 'package:microtectask/core/main_blocs/local_state.dart';
import 'package:microtectask/core/navigation/navigator_service/navigator_service.dart';
import 'package:microtectask/core/navigation/routes/app_routes.dart';
import 'package:microtectask/core/theme/app_decoration.dart';
import 'package:microtectask/features/all_films_page/presentation/manager/films_bloc.dart';
import 'core/di/injector.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(340, 700),
        splitScreenMode: true,

        builder: (BuildContext context, Widget? child) {
          return  MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => LocaleCubit(di.sl())..getSavedLanguage()),

              BlocProvider(
                  create: (context) =>   FilmsBloc(getAllFilmsUseCase: di.sl(), getFilmDetailsUseCase: di.sl(), getFilmCastUseCase: di.sl(), getFilmsSearchResultUseCase: di.sl())),

            ],
            child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
              builder: (context, state) {
                return BlocConsumer<LocaleCubit, ChangeLocaleState>(
                  listener: (context, state) async{
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus &&
                        currentFocus.focusedChild != null) {
                      await Future.delayed(const Duration(milliseconds: 50));
                      currentFocus.focusedChild?.unfocus();
                    }},
                  builder: (context, state) {
                    return MaterialApp.router(
                      debugShowCheckedModeBanner: false,

                      locale: state.locale,
                      supportedLocales: const [ Locale('en')],
                      localizationsDelegates: [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate
                      ],
                      title: 'Task',
                      routerConfig: AppRoutes.router,



                    );
                  },
                );
              },

            ),
          );
        }

    );
  }
}


