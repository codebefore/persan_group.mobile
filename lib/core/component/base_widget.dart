import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/loader_controller.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';

import '../constant/enums.dart';

class BaseWidget extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final bool? resizeToAvoidBottomInset;
  final bool? noNeedPadding;
  final bool? isDark;
  const BaseWidget(
      {super.key,
      required this.body,
      this.appBar,
      this.resizeToAvoidBottomInset,
      this.noNeedPadding,
      this.isDark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: noNeedPadding == true
            ? const EdgeInsets.symmetric()
            : EdgeInsets.symmetric(
                horizontal: screenWidth * .05, vertical: screenHeight * .05),
        child: Stack(
          children: [
            GetBuilder<LoaderController>(
                builder: (controller) => controller.status == Status.loading
                    ? const Center(child: CircularProgressIndicator())
                    : body)
          ],
        ),
      ),
    );
  }
}
