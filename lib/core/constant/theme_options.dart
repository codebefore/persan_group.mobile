import 'package:flutter/material.dart';

class ThemeParameters {
  static const double borderRadiusValue = 16;
  static const Radius radiusCircular = Radius.circular(borderRadiusValue);
  static BorderRadiusGeometry borderRadiusGeometry =
      BorderRadius.circular(borderRadiusValue);
  static BorderRadius borderRadius = BorderRadius.circular(borderRadiusValue);
  static const ShapeBorder shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
    topLeft: radiusCircular,
    topRight: radiusCircular,
  ));
}
