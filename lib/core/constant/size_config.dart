import 'package:flutter/material.dart';
import 'package:get/get.dart';

double screenWidth = 0;
double screenHeight = 0;

double horizontalPadding = 0;
double verticalPadding = 0;

double marginHorizontal = 0;
double marginVertical = 0;

double marginBottom = 0;
double marginRight = 0;

double paddingVertical = 0;
double paddingHorizontal = 0;

double buttonTextSize = 0;
double buttonWidth = 0;
double buttonHeight = 0;

double rate = 0;
double factor = 0;

double iconSize = 0;
double leadingWidth = 0;

void sizeConfig(BuildContext context) {
  // final MediaQueryData mediaQueryData = MediaQuery.of(context);
  // screenWidth = mediaQueryData.size.width;
  // screenHeight = mediaQueryData.size.height;

  screenWidth = Get.width;
  screenHeight = Get.height;

  rate = (screenWidth / screenHeight + 1) / 2;

  factor = screenWidth * 0.0019 / rate;

  leadingWidth = screenWidth * 0.12;

  horizontalPadding = screenWidth * 0.05;
  verticalPadding = screenHeight * 0.06;
  iconSize = screenWidth * .05 / factor;
  marginHorizontal = screenWidth * 0.015;
  marginVertical = screenHeight * 0.01;
  marginBottom = screenHeight * 0.5;
  marginRight = screenWidth * 0.2;
  paddingVertical = screenWidth * 0.25;
  paddingHorizontal = screenWidth * 0.25;
  buttonWidth = screenWidth * 0.42;
  buttonHeight = screenHeight * 0.065;
}
