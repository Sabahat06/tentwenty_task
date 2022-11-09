import 'package:flutter/material.dart';
import 'package:tentwenty_task/app_config/app_keys.dart';

double? screenWidth = MediaQuery.of(AppKeys.mainNavigatorKey.currentContext!).size.width;
double? screenHeight = MediaQuery.of(AppKeys.mainNavigatorKey.currentContext!).size.height;
ThemeData appTheme = Theme.of(AppKeys.mainNavigatorKey.currentContext!);

class AppUtils {

  static void dismissLoader({@required BuildContext? context}) {
    if (context != null) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  static void pop({@required BuildContext? context, bool fromRoot = false, var valueToReturn}) {
    if (Navigator.of(context!, rootNavigator: fromRoot).canPop()) {
      Navigator.of(context, rootNavigator: fromRoot).pop(valueToReturn);
    }
  }

  static void pushAndRemoveRoute({@required BuildContext? context, @required Widget? route, Function? valueCallBack}) {
    Navigator.pushAndRemoveUntil(
        context!,
        MaterialPageRoute(builder: (BuildContext context) => route!),
            (route) => false).then((value) {
      if (valueCallBack != null) {
        valueCallBack(value);
      }
    });
  }

  static void pushRoute({@required BuildContext? context, bool fromRoot = false, Widget? route, Function? valueCallBack, bool pushReplacement = false,}) {
    _push(
        context: context,
        route: _getRoute(route!),
        valueCallBack: valueCallBack,
        fromRoot: fromRoot,
        pushReplacement: pushReplacement);
  }

  static MaterialPageRoute _getRoute(Widget route) {
    return MaterialPageRoute(
        settings: RouteSettings(name: route.toString()),
        builder: (context) {
          return route;
        });
  }

  static void _push({@required BuildContext? context, bool fromRoot = false, var route, Function? valueCallBack, bool pushReplacement = false}) {
    {
      if (pushReplacement) {
        Navigator.of(context!, rootNavigator: fromRoot)
            .pushReplacement(route)
            .then((value) {
          if (valueCallBack != null) {
            valueCallBack(value);
          }
        });
      } else {
        Navigator.of(context!, rootNavigator: fromRoot)
            .push(route)
            .then((dynamic value) {
          if (valueCallBack != null) {
            valueCallBack(value);
          }
        });
      }
    }
  }

}

