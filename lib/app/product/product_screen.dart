import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/product/product_controller.dart';
import 'package:persangroup_mobile/core/component/base_text.dart';
import 'package:persangroup_mobile/core/component/base_widget.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/theme_options.dart';
import 'package:persangroup_mobile/core/route/routes.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});
  @override
  State<ProductScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<ProductScreen> {
  final productContoller = Get.find<ProductController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.background),
        ),
        body: BaseWidget(
          isDark: true,
          noNeedPadding: true,
          body: GetBuilder<ProductController>(builder: (productcontroller) {
            return Flex(
              direction: Axis.vertical,
              children: [start],
            );
          }),
        ));
  }

  Container get start => Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/start_background.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenHeight * .1,
            ),
            logo,
            Container(
                height: screenHeight * .7,
                width: screenWidth * .95,
                decoration: BoxDecoration(
                    borderRadius: ThemeParameters.borderRadius,
                    color: Theme.of(context).colorScheme.background),
                child: productContoller.products.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 100),
                        itemCount: productContoller.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () => {
                                    Get.toNamed(Routes.productdetail,
                                        arguments:
                                            productContoller.products[index].id)
                                  },
                              child: categoryItem(index, context));
                        })
                    : Container())
          ],
        ),
      );

  Card categoryItem(int index, BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.only(top: 15),
      child: Container(
        // margin: const EdgeInsets.only(top: 50),
        // width: screenWidth * .5,
        height: screenHeight * .25,
        decoration: BoxDecoration(
          borderRadius: ThemeParameters.borderRadius,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                productContoller.products[index].images?.first.image ?? ""),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              height: screenHeight * .075,
              width: screenWidth * .3,
              child: BaseText(productContoller.products[index].name ?? "",
                  style: const TextStyle(shadows: [
                    Shadow(
                      blurRadius: 10.0, // shadow blur
                      color: Colors.black, // shadow color
                      offset: Offset(2.0, 2.0), // how much shadow will be shown
                    ),
                  ], fontSize: 20, fontWeight: FontWeight.w700),
                  textColor: Theme.of(context).colorScheme.background),
            ),
          ],
        ),
      ),
    );
  }

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
