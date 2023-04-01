import 'package:flutter/material.dart';

import '../constant/size_config.dart';

SizedBox blank({double? value}) {
  return SizedBox(
    height: screenHeight * (value ?? .025),
  );
}
