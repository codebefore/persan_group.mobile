import 'package:flutter/material.dart';

class ThemeParameters {
  static const double borderRadiusValue = 56;
  static const Radius radiusCircular = Radius.circular(borderRadiusValue);
  static BorderRadiusGeometry borderRadius =
      BorderRadius.circular(borderRadiusValue);
  static const ShapeBorder shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
    topLeft: radiusCircular,
    topRight: radiusCircular,
  ));
}
