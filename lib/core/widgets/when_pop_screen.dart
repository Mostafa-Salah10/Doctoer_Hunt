import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WhenPopScreen extends StatelessWidget {
  const WhenPopScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: child,
      onPopInvokedWithResult: (didPop, result) => SystemNavigator.pop(),
    );
  }
}
