import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/app/auth/loader_controller.dart';
import 'package:persangroup_mobile/app/home/html_viewer.dart';
import 'package:persangroup_mobile/app/home/pdf_viewer.dart';
import 'package:persangroup_mobile/app/product/product_controller.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/component/base_text.dart';
import 'package:persangroup_mobile/core/component/base_widget.dart';
import 'package:persangroup_mobile/core/component/blank.dart';
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
            image: AssetImage('lib/assets/images/start_background.jpg'),
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
                  productBox('lib/assets/images/shadowsystems.jpg',
                      'shading_systems'.tr, "PERSAN"),
                  productBox('lib/assets/images/gioglass.jpg',
                      'giosan_systems'.tr, "GIOSAN")
                ],
              ),
            ),
            catalogs,
            callButton,
            user
          ],
        ),
      );

  Row get catalogs => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BaseButton(
            width: screenWidth * .40,
            assetImage: const AssetImage('lib/assets/images/icon.png'),
            text: "persan_catalog".tr,
            style: const TextStyle(fontSize: 12),
            textColor: Colors.black,
            onTap: () => {Get.to(const PdfViewerScreen())},
            bgColor: Colors.white,
          ),
          BaseButton(
            width: screenWidth * .40,
            style: const TextStyle(fontSize: 12),
            assetImage: const AssetImage('lib/assets/images/icon.png'),
            textColor: Colors.black,
            text: "giosan_catalog".tr,
            onTap: () => {Get.to(const PdfViewerScreen())},
            bgColor: Colors.white,
          )
        ],
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

  Row get user => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BaseButton(
            text: "delete_account".tr,
            width: screenWidth * .40,
            // height: screenHeight * .05,
            onTap: () async {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (BuildContext context) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        BaseText(
                          textAlign: TextAlign.center,
                          'are_you_sure_user_delete'.tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        blank(),
                        BaseText(
                          textAlign: TextAlign.center,
                          '${'email'.tr}: ${authcontoller.user.email}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: BaseButton(
                                bgColor: Colors.red,
                                onTap: () async {
                                  var isSuccess =
                                      await authcontoller.userDelete();

                                  if (isSuccess == true) {
                                    loadercontroller.setStatus(Status.loading);
                                    await authcontoller.logout();
                                    loadercontroller.setStatus(Status.initial);
                                    await Get.toNamed(Routes.login);
                                  } else {
                                    Get.snackbar(
                                        "Error", "checkyourcredentials".tr,
                                        snackPosition: SnackPosition.TOP,
                                        duration: const Duration(seconds: 5),
                                        icon: const Icon(Icons.error,
                                            color: Colors.red),
                                        overlayColor: Colors.black,
                                        colorText: Colors.red);
                                  }
                                },
                                text: 'yes'.tr,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: BaseButton(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                text: 'no'.tr,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            bgColor: Colors.white,
            textColor: Theme.of(context).colorScheme.primary,
            prefixIcon:
                const Icon(Icons.person_off_rounded, color: Colors.black),
          ),
          BaseButton(
            text: "logout".tr,
            width: screenWidth * .40,

            onTap: () async {
              loadercontroller.setStatus(Status.loading);
              await authcontoller.logout();
              loadercontroller.setStatus(Status.initial);
              await Get.toNamed(Routes.login);
            },
            bgColor: Colors.transparent,
            textColor: Colors.black,
            prefixIcon: const Icon(Icons.logout, color: Colors.black),
          ),
        ],
      );

  GestureDetector productBox(String imageUrl, String title, String brandName) =>
      GestureDetector(
        onTap: () async {
          loadercontroller.setStatus(Status.loading);
          await productcontroller.fetchCategories(brandName);
          loadercontroller.setStatus(Status.initial);
          await Get.toNamed(Routes.category,
              arguments: {'0': title, '1': brandName});
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
            image: AssetImage('lib/assets/images/persanlogo.png'),
          ),
        ),
      );
}
