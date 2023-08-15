import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/app/product/product_controller.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/component/base_input.dart';
import 'package:persangroup_mobile/core/component/base_text.dart';
import 'package:persangroup_mobile/core/component/base_widget.dart';
import 'package:persangroup_mobile/core/component/blank.dart';
import 'package:persangroup_mobile/core/constant/enums.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/theme_options.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<ProductDetailScreen> {
  final productcontroller = Get.find<ProductController>();
  final authcontroller = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode widthFocus = FocusNode();
  FocusNode width2Focus = FocusNode();
  final id = Get.arguments;
  @override
  void initState() {
    super.initState();
    productcontroller.setPrice("");
  }

  int counter = 0;

  void update() {
    setState(() {
      counter++;
    });
  }

  Future<void> validateAndSave() async {
    final FormState? form = _formKey.currentState;

    if (form?.validate() ?? false) {
      // var string = json.encode(productcontroller.products
      //     .where((element) => element.id == id)
      //     .first
      //     .excel_cell_customer);
      // print(string);
      authcontroller.setStatus(Status.loading);
      await productcontroller.fetchCreateOffer(
          productcontroller.products.indexWhere((element) => element.id == id));
      // form?.reset();
      authcontroller.setStatus(Status.initial);
    }
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
              children: [start(productcontroller)],
            );
          }),
        ));
  }

  Container start(ProductController productcontroller) => Container(
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
            BaseText(
              productcontroller.products
                      .firstWhere((element) => element.id == id)
                      .name ??
                  "",
              textColor: Colors.white,
            ),
            Container(
                height: screenHeight * .71,
                width: screenWidth * .95,
                decoration: BoxDecoration(
                    borderRadius: ThemeParameters.borderRadius,
                    color: Theme.of(context).colorScheme.background),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<AuthController>(
                            builder: (authController) => Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: BaseText(
                                    authController.status != Status.loading
                                        ? (productcontroller.price.isNotEmpty
                                            ? "${"price".tr} : ${productcontroller.price} TL"
                                            : "")
                                        : "...",
                                    textColor: Colors.green[800],
                                    style: const TextStyle(
                                      fontSize: 26,
                                    ),
                                  ),
                                )),
                        excelField(),
                        getPriceButton,
                        blank()
                      ],
                    ),
                  ),
                ))
          ],
        ),
      );

  SizedBox excelField() => SizedBox(
      width: screenWidth * .9,
      height: screenHeight * .45,
      // color: Colors.red,
      child: productcontroller.products
                      .firstWhere((element) => element.id == id)
                      .excel_cell_customer !=
                  null &&
              productcontroller.products
                  .firstWhere((element) => element.id == id)
                  .excel_cell_customer!
                  .isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: productcontroller.products
                  .firstWhere((element) => element.id == id)
                  .excel_cell_customer
                  ?.length,
              itemBuilder: (BuildContext context, int index) {
                // controller
                var excelCell = productcontroller.products
                    .firstWhere((element) => element.id == id)
                    .excel_cell_customer?[index];
                var celltype = excelCell?.input_or_output;
                if (excelCell != null && celltype != null) {
                  var productIndex = productcontroller.products
                      .indexWhere((element) => element.id == id);
                  if (celltype == "INPUT") {
                    // return ;
                    return widthArea(productIndex, index);
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: BaseButton(
                          width: screenWidth * .1,
                          prefixIcon: productcontroller.products[productIndex]
                                      .excel_cell_customer![index].selected ==
                                  true
                              ? const Icon(Icons.check)
                              : null,
                          bgColor: Colors.transparent,
                          border: Border.all(),
                          textColor: Theme.of(context).primaryColor,
                          text: excelCell.description ?? "",
                          onTap: () {
                            for (var i = 0;
                                i <
                                    productcontroller.products[productIndex]
                                        .excel_cell_customer!.length;
                                i++) {
                              productcontroller.products[productIndex]
                                  .excel_cell_customer![i].selected = false;
                            }
                            productcontroller.products[productIndex]
                                .excel_cell_customer![index].selected = true;
                            update();
                          }),
                    );
                  }
                } else {
                  return null;
                }
              })
          : Container());

  BaseInput widthArea(productIndex, excelIndex) => BaseInput(
        // focusNode: widthFocus,
        isInScrollView: true,
        decoration: InputDecoration(
          border:
              OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
          labelText: productcontroller.products[productIndex]
              .excel_cell_customer?[excelIndex].description,
          // labelText: productIndex.toString() + excelIndex.toString(),
          // hintText: 'enter_email'.tr,
          prefixIcon: Icon(Icons.calculate,
              size: iconSize, color: Theme.of(context).primaryColor),
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        textFormatters: const [],
        onEditingComplete: () {
          // widthFocus.unfocus();
          // FocusScope.of(context).requestFocus(width2Focus);
        },
        onChanged: (String value) {
          productcontroller.products[productIndex]
              .excel_cell_customer?[excelIndex].condition = value;
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );

  BaseButton get getPriceButton => BaseButton(
        text: "getprice".tr,
        onTap: validateAndSave,
        width: screenWidth,
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
