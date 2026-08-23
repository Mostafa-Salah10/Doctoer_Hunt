import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigateExtensions on BuildContext {
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return push<T>(routeName, extra: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    return pushReplacement(routeName, extra: arguments);
  }

  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    go(routeName, extra: arguments);
  }

  void pop<T extends Object?>([T? result]) {
    if (canPop()) {
      pop<T>(result);
    }
  }
}
