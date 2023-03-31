import 'package:flutter/material.dart';

import '../constant/size_config.dart';

Widget baseScreen({required Widget child, bool isInScrollView = false}) {
  return Container(
    margin: EdgeInsets.only(
        top: !isInScrollView ? 0 : verticalPadding * 0,
        bottom: !isInScrollView ? 0 : verticalPadding * 0),
    padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: !isInScrollView ? verticalPadding : 0),
    child: child,
  );
}
