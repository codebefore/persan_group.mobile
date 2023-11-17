import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/app/auth/loader_controller.dart';
import 'package:persangroup_mobile/app/product/product_controller.dart';
import 'package:persangroup_mobile/core/component/base_widget.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/theme_options.dart';
import 'package:persangroup_mobile/core/route/routes.dart';

import '../../core/component/base_text.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final productContoller = Get.find<ProductController>();
  final authContoller = Get.find<AuthController>();
  final loaderContoller = Get.find<LoaderController>();

  String title = Get.arguments['0'];
  String brandName = Get.arguments['1'];

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
          body: Flex(
            direction: Axis.vertical,
            children: [start],
          )),
    );
  }

  Container get start => Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/start_background.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenHeight * .1,
            ),
            logo,
            BaseText(
              title,
              textColor: Colors.white,
            ),
            Container(
                height: screenHeight * .7,
                width: screenWidth * .95,
                decoration: BoxDecoration(
                    borderRadius: ThemeParameters.borderRadius,
                    color: Theme.of(context).colorScheme.background),
                child: productContoller.categories.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 100),
                        itemCount: productContoller.categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                if (productContoller
                                            .categories[index].children !=
                                        null &&
                                    productContoller.categories[index].children!
                                        .isNotEmpty) {
                                  productContoller.setCategories(
                                      productContoller
                                          .categories[index].children!);
                                  Get.offAndToNamed(Routes.category,
                                      arguments: {
                                        '0': productContoller
                                            .categories[index].name,
                                        '1': productContoller
                                            .categories[index].brand
                                      });
                                } else if (productContoller
                                            .categories[index].products !=
                                        null &&
                                    productContoller.categories[index].products!
                                        .isNotEmpty) {
                                  if (productContoller
                                          .categories[index].products?.length ==
                                      1) {
                                    productContoller.setProducts(
                                        productContoller
                                            .categories[index].products!);
                                    Get.toNamed(Routes.productdetail,
                                        arguments: productContoller
                                            .categories[index].products?[0].id);
                                  } else {
                                    var sortedproduts = productContoller
                                        .sortProduct(productContoller
                                            .categories[index].products!);
                                    productContoller.setProducts(sortedproduts);
                                    Get.toNamed(Routes.product, arguments: {
                                      '0': productContoller
                                          .categories[index].name,
                                      '1': brandName
                                    });
                                  }
                                }
                              },
                              child: productItem(index, context));
                        })
                    : Container())
          ],
        ),
      );

  Card productItem(int index, BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.only(top: 15),
      child: Container(
        // margin: const EdgeInsets.only(top: 50),
        // width: screenWidth * .5,
        height: screenHeight * .25,
        decoration: BoxDecoration(
            borderRadius: ThemeParameters.borderRadius,
            image: productContoller.categories[index].image != null
                ? DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        productContoller.categories[index].image ?? ""),
                  )
                : null),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              height: screenHeight * .075,
              width: screenWidth,
              // color: Colors.amber,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    productContoller.categories[index].name ?? "",
                    style: TextStyle(
                        shadows: const [
                          Shadow(
                            blurRadius: 10.0, // shadow blur
                            color: Colors.black, // shadow color
                            offset: Offset(
                                2.0, 2.0), // how much shadow will be shown
                          ),
                        ],
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.background),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
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
            image: AssetImage('lib/assets/images/persanlogo.png'),
          ),
        ),
      );
}
