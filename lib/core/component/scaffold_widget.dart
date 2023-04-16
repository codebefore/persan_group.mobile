import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';

import '../constant/enums.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final bool? resizeToAvoidBottomInset;
  const ScaffoldWidget(
      {super.key,
      required this.body,
      this.appBar,
      this.resizeToAvoidBottomInset});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (app) => Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar,
        body: Container(
          height: screenHeight,
          width: screenWidth,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * .05, vertical: screenHeight * .05),
          child: Stack(
            children: [
              app.status == Status.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Container(),
              body,
            ],
          ),
        ),
      ),
    );
  }
}
