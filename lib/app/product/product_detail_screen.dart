import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/auth/auth_controller.dart';
import 'package:persangroup_mobile/app/auth/loader_controller.dart';
import 'package:persangroup_mobile/app/product/product_controller.dart';
import 'package:persangroup_mobile/core/component/base_button.dart';
import 'package:persangroup_mobile/core/component/base_input.dart';
import 'package:persangroup_mobile/core/component/base_text.dart';
import 'package:persangroup_mobile/core/component/base_widget.dart';
import 'package:persangroup_mobile/core/component/blank.dart';
import 'package:persangroup_mobile/core/constant/enums.dart';
import 'package:persangroup_mobile/core/constant/size_config.dart';
import 'package:persangroup_mobile/core/constant/theme_options.dart';

import '../../core/component/base_dropdown.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<ProductDetailScreen> {
  // String? selectedValue = null;
  final productcontroller = Get.find<ProductController>();
  final authcontroller = Get.find<AuthController>();
  final loadercontroller = Get.find<LoaderController>();
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
      loadercontroller.setStatus(Status.loading);
      bool success = await productcontroller.fetchCreateOffer(
          productcontroller.products.indexWhere((element) => element.id == id));
      loadercontroller.setStatus(Status.initial);
      if (success != true) {
        Get.snackbar("Error", "fillrequiredfields".tr,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 5),
            icon: const Icon(Icons.error, color: Colors.red),
            overlayColor: Colors.black,
            colorText: Colors.red);
      }
      // form?.reset();
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
                height: screenHeight * .7,
                width: screenWidth,
                decoration: BoxDecoration(
                    borderRadius: ThemeParameters.borderRadius,
                    color: Theme.of(context).colorScheme.background),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<AuthController>(
                            builder: (authController) => Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: BaseText(
                                    loadercontroller.status != Status.loading
                                        ? (productcontroller.price.isNotEmpty
                                            ? "${"price".tr} : ${productcontroller.price} ${authcontroller.user.currency?.code}"
                                            : "")
                                        : "...",
                                    textColor: Colors.green[800],
                                    style: const TextStyle(
                                      fontSize: 26,
                                    ),
                                  ),
                                )),
                        // productcontroller.products
                        //                 .firstWhere(
                        //                     (element) => element.id == id)
                        //                 .excel_cell_customer !=
                        //             null &&
                        //         productcontroller.products
                        //             .firstWhere((element) => element.id == id)
                        //             .excel_cell_customer!
                        //             .isNotEmpty &&
                        //         productcontroller.products
                        //             .firstWhere((element) => element.id == id)
                        //             .excel_cell_customer!
                        //             .any((e) =>
                        //                 e.input_or_output == "INPUT" &&
                        //                 e.condition != null)
                        //     ? dropdownListForExcel(productcontroller)
                        //     : Container(),
                        excelFields(),
                        getPriceButton,
                        blank()
                      ],
                    ),
                  ),
                ))
          ],
        ),
      );

  // Container dropdownListForExcel(ProductController productcontroller) {
  //   var count = productcontroller.products
  //       .firstWhere((element) => element.id == id)
  //       .excel_cell_customer!
  //       .where((element) =>
  //           element.input_or_output == "INPUT" && element.condition != null)
  //       .map((e) => e.cell)
  //       .toSet()
  //       .toList()
  //       .length;
  //   var cells = productcontroller.products
  //       .firstWhere((element) => element.id == id)
  //       .excel_cell_customer!
  //       .where((element) =>
  //           element.input_or_output == "INPUT" && element.condition != null)
  //       .map((e) => e.cell)
  //       .toSet()
  //       .toList();
  //   return Container(
  //       // color: Colors.yellow,
  //       width: screenWidth,
  //       height: count * screenHeight * .082,
  //       child: ListView.builder(
  //           padding: const EdgeInsets.only(top: 10),
  //           itemCount: count,
  //           itemBuilder: (BuildContext context, int index) {
  //             // controller
  //             return Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 8),
  //               child: dropdown(
  //                   productcontroller.products
  //                       .indexWhere((element) => element.id == id),
  //                   cell: cells[index]),
  //             );
  //           }));
  // }

  Container excelFields() {
    // var dropdowncount = productcontroller.products
    //     .firstWhere((element) => element.id == id)
    //     .excel_cell_customer!
    //     .where((element) =>
    //         element.input_or_output == "INPUT" && element.condition != null)
    //     .map((e) => e.cell)
    //     .toList()
    //     .length;
    // var dropdowngroupcount = productcontroller.products
    //     .firstWhere((element) => element.id == id)
    //     .excel_cell_customer!
    //     .where((element) =>
    //         element.input_or_output == "INPUT" && element.condition != null)
    //     .map((e) => e.cell)
    //     .toSet()
    //     .toList()
    //     .length;
    var distinccells = productcontroller.products
        .firstWhere((element) => element.id == id)
        .excel_cell_customer!
        .map((e) => e.cell)
        .toSet()
        .toList();

    // var totalcount = productcontroller.products
    //     .firstWhere((element) => element.id == id)
    //     .excel_cell_customer
    //     ?.length;

    // var currentcount = (totalcount! - dropdowncount) + dropdowngroupcount;
    var currentcount = distinccells.length;
    int? outputcount = productcontroller.products
        .firstWhere((element) => element.id == id)
        .excel_cell_customer!
        .where((element) => element.input_or_output == "OUTPUT")
        .length;
    return Container(
        // width: screenWidth * .9,
        height: screenHeight * .5,
        color: Colors.white,
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
                itemCount: currentcount,
                itemBuilder: (BuildContext context, int index) {
                  // controller
                  var excelCell = productcontroller.products
                      .firstWhere((element) => element.id == id)
                      .excel_cell_customer
                      ?.firstWhere(
                          (element) => element.cell == distinccells[index]);
                  var celltype = excelCell?.input_or_output;
                  if (excelCell != null && celltype != null) {
                    var productIndex = productcontroller.products
                        .indexWhere((element) => element.id == id);
                    if (celltype == "INPUT" && excelCell.condition == null) {
                      return widthArea(productIndex, excelCell.cell!);
                    } else if (celltype == "INPUT" &&
                        excelCell.condition != null) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: dropdown(productIndex, cell: excelCell.cell),
                      );
                      // return Container();
                    } else if (celltype == "OUTPUT" && outputcount > 1) {
                      return Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: BaseButton(
                              prefixIcon: productcontroller
                                          .products[productIndex]
                                          .excel_cell_customer
                                          ?.firstWhere((element) =>
                                              element.cell ==
                                              distinccells[index])
                                          .selected ==
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
                                            .excel_cell_customer!
                                            .where((element) =>
                                                element.input_or_output ==
                                                "OUTPUT")
                                            .length;
                                    i++) {
                                  productcontroller.products[productIndex]
                                      .excel_cell_customer!
                                      .where((element) =>
                                          element.input_or_output == "OUTPUT")
                                      .toList()[i]
                                      .selected = false;
                                }
                                productcontroller
                                    .products[productIndex].excel_cell_customer
                                    ?.firstWhere((element) =>
                                        element.cell == distinccells[index])
                                    .selected = true;
                                update();
                              }),
                        ),
                      );
                    }
                  } else {
                    return Container();
                  }
                  return Container();
                })
            : Container());
  }

  BaseInput widthArea(productIndex, String cell) => BaseInput(
        // focusNode: widthFocus,
        isInScrollView: true,
        decoration: InputDecoration(
          border:
              OutlineInputBorder(borderRadius: ThemeParameters.borderRadius),
          labelText: productcontroller
              .products[productIndex].excel_cell_customer
              ?.firstWhere((element) => element.cell == cell)
              .description,
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
          if (double.parse(value) > 0) {
            productcontroller.products[productIndex].excel_cell_customer
                ?.firstWhere((element) => element.cell == cell)
                .selected_value_int = double.parse(value);
          }
        },
        validator: (value) => (value ?? '').isEmpty ? "empty_error".tr : null,
      );
  BaseDropDown dropdown(int productIndex, {String? cell}) => BaseDropDown(
        key: Key("drpevidence$productIndex"),
        items: productcontroller.products[productIndex].excel_cell_customer!
            .where((element) => element.cell == cell)
            .map((item) => DropdownMenuItem<String>(
                  value: item.condition?.selected_value,
                  child: Text(
                    item.description!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        dropdownWidth: screenWidth * .9,
        buttonWidth: screenWidth,
        buttonHeight: screenHeight * .07,
        hint: Row(
          children: [
            Icon(
              Icons.flaky,
              color: Theme.of(context).colorScheme.primary,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: BaseText(
                "Select".tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            )
          ],
        ),
        buttonDecoration: BoxDecoration(
          borderRadius: ThemeParameters.borderRadius,
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 1, // Border width
          ),
        ),
        value: productcontroller.products[productIndex].excel_cell_customer!
                .any((element) => (element.input_or_output == "INPUT" &&
                    element.condition != null &&
                    element.cell == cell &&
                    element.selected == true))
            ? productcontroller.products[productIndex].excel_cell_customer!
                .where((element) => (element.input_or_output == "INPUT" &&
                    element.condition != null &&
                    element.cell == cell &&
                    element.selected == true))
                .first
                .condition
                ?.selected_value
            : null,
        onChanged: (value) {
          if (value != null && value.isNotEmpty) {
            if (productcontroller.products[productIndex].excel_cell_customer!
                .any((element) => (element.input_or_output == "INPUT" &&
                    element.cell == cell &&
                    element.condition != null))) {
              for (var i = 0;
                  i <
                      productcontroller
                          .products[productIndex].excel_cell_customer!
                          .where((element) =>
                              (element.input_or_output == "INPUT" &&
                                  element.cell == cell &&
                                  element.condition != null))
                          .length;
                  i++) {
                // if (productcontroller
                //           .products[productIndex].excel_cell_customer!
                //           .where((element) =>
                //               (element.input_or_output == "INPUT" &&
                //                   element.cell == cell &&
                //                   element.condition != null))[i].) {
                productcontroller.products[productIndex].excel_cell_customer!
                    .where((element) => (element.input_or_output == "INPUT" &&
                        element.cell == cell &&
                        element.condition != null))
                    .toList()[i]
                    .selected = false;
              }

              productcontroller.products[productIndex].excel_cell_customer!
                  .where((element) => (element.input_or_output == "INPUT" &&
                      element.condition != null &&
                      element.cell == cell &&
                      element.condition?.selected_value == value))
                  .first
                  .selected = true;

              // productcontroller.products[productIndex].excel_cell_customer!
              //     .where((element) => (element.input_or_output == "INPUT" &&
              //         element.condition != null &&
              //         element.cell == cell &&
              //         element.condition?.selected_value == value))
              //     .first
              //     .selected_value = value;
            }
          }
          update();
        },
      );

  BaseButton get getPriceButton => BaseButton(
        text: "getprice".tr,
        onTap: validateAndSave,
        width: screenWidth,
      );

  Container get logo => Container(
        width: screenWidth,
        height: screenHeight * .1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/logo_dark.png'),
          ),
        ),
      );
}
