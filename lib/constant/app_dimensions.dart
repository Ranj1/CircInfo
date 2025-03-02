import 'package:flutter/material.dart';

class AppDimensions {
  static double getWidth(BuildContext context, {double percentage = 1}) {
    return MediaQuery.of(context).size.width * percentage;
  }

  static double getHeight(BuildContext context, {double percentage = 1}) {
    return MediaQuery.of(context).size.height * percentage;
  }
}
