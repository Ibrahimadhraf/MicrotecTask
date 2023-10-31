import 'package:flutter/material.dart';
import 'package:microtectask/core/navigation/navigator_service/navigator_service.dart';
import 'package:microtectask/core/navigation/routes/app_routes.dart';
import 'package:microtectask/core/utils/color_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    setSplashTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Scaffold(
          backgroundColor: primaryColor,


        ),

      ],
    );
  }
  setSplashTimer() {


    Future.delayed(
      const Duration(milliseconds: 2000),
          () async {



      },
    ).then((value) => {
      Future.delayed(const Duration(milliseconds: 2000), () async {

        NavigatorService.    pushNamedAndRemoveUntil(AppRoutes.filmsScreen);






      })
    });

  }
}

