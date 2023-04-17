import 'package:flutter/material.dart';

import '../constant/size_config.dart';

SizedBox blank({double? value}) => SizedBox(
      height: screenHeight * (value ?? .025),
    );
