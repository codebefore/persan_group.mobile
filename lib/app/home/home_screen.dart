import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/app/auth/loader_controller.dart';
import 'package:persangroup_mobile/app/home/html_viewer.dart';
import 'package:persangroup_mobile/app/home/pdf_viewer.dart';
import 'package:persangroup_mobile/app/product/product_controller.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/component/base_widget.dart';
import 'package:persangroup_mobile/core/constant/enums.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/route/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authcontoller = Get.find<AuthController>();
  final loadercontroller = Get.find<LoaderController>();
  final productcontroller = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      isDark: false,
      noNeedPadding: true,
      body: Flex(
        direction: Axis.vertical,
        children: [home],
      ),
    );
  }

  Container get home => Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/start_background.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: screenHeight * .075,
            ),
            logo,
            SizedBox(
              height: screenHeight * .22,
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  productBox('lib/assets/images/shadowsystems.jpeg',
                      'shading_systems'.tr),
                  productBox('lib/assets/images/categories/titan.png',
                      'giosan_systems'.tr)
                ],
              ),
            ),
            catalogs,
            callButton,
            logoutButton,
          ],
        ),
      );

  Row get catalogs => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BaseButton(
            width: screenWidth * .35,
            // height: screenHeight * .05,
            prefixIcon: const Icon(Icons.adobe),
            text: "persan_catalog".tr,
            style: const TextStyle(fontSize: 12),
            textColor: Colors.black,
            onTap: () => {Get.to(const PdfViewerScreen())},
            bgColor: Colors.white,
          ),
          BaseButton(
            width: screenWidth * .35,
            style: const TextStyle(fontSize: 12),
            prefixIcon: const Icon(Icons.adobe),
            textColor: Colors.black,
            text: "giosan_catalog".tr,
            onTap: () => {Get.to(const PdfViewerScreen())},
            bgColor: Colors.white,
          )
        ],
      );

  BaseButton get logoutButton => BaseButton(
        text: "logout".tr,
        width: screenWidth * .5,
        onTap: () async {
          loadercontroller.setStatus(Status.loading);
          await authcontoller.logout();
          loadercontroller.setStatus(Status.initial);
          await Get.toNamed(Routes.login);
        },
        bgColor: Colors.transparent,
        textColor: Theme.of(context).colorScheme.background,
        prefixIcon: const Icon(Icons.logout, color: Colors.white),
      );
  BaseButton get callButton => BaseButton(
        text: "contact".tr,
        width: screenWidth * .33,
        height: screenHeight * .05,
        onTap: () => {Get.to(const HtmlViewerScreen())},
        bgColor: Colors.white,
        textColor: Theme.of(context).colorScheme.primary,
        prefixIcon: const Icon(Icons.call, color: Colors.black),
      );
  GestureDetector productBox(String imageUrl, String title) => GestureDetector(
        onTap: () async {
          loadercontroller.setStatus(Status.loading);
          await productcontroller.fetchProducts();
          loadercontroller.setStatus(Status.initial);
          await Get.toNamed(Routes.product, arguments: title);
        },
        child: Card(
          color: Colors.white,
          shadowColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child: SizedBox(
                  width: screenWidth * .45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage(imageUrl),
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Container get logo => Container(
        width: screenWidth,
        height: screenHeight * .15,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/logo_dark.png'),
          ),
        ),
      );
}
