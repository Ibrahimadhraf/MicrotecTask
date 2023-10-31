import 'package:flutter/material.dart';


import 'package:go_router/go_router.dart';
class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext currentContext() {
    return navigatorKey.currentContext!;
  }
  static Future<dynamic> pushNamed(String routeName,
      {dynamic arguments}) async {

    // Construct the route path by adding path parameters to the routeName
    final path =  routeName;
    print("arguments$arguments");

    // Use the constructed path to navigate
    return GoRouter.of(navigatorKey.currentContext!).push(routeName
      ,
      extra: arguments,
    );
  }

  static void goBack() {
    return  GoRouter.of(navigatorKey.currentContext!).pop();

  }

  static Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {bool routePredicate = false, dynamic arguments}) async {

    navigatorKey.currentContext!.pushReplacement(routeName);


  }

  static Future<dynamic> popAndPushNamed(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }

}