// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/product/category_model.dart';
import 'package:persangroup_mobile/app/product/create_offer_request_model.dart';
import 'package:persangroup_mobile/app/product/offer_response_model.dart';
import 'package:persangroup_mobile/app/product/product_excel_model.dart';
import 'package:persangroup_mobile/app/product/product_model.dart';
import 'package:persangroup_mobile/core/network/base_response.dart';
import 'package:persangroup_mobile/core/network/dio_client.dart';
import 'package:persangroup_mobile/core/network/network.dart';

import '../auth/auth_controller.dart';
import '../getit_binding.dart';

class ProductController extends GetxController {
  //
  final DioClient _dioClient = getIt.get<DioClient>();
  final authcontroller = Get.find<AuthController>();

  //products get set
  final _products = <ProductModel>[].obs;
  List<ProductModel> get products => _products;
  void setProducts(List<ProductModel> products) {
    _products.value = products;
  }

  //categories get set
  final _categories = <CategoryModel>[].obs;
  List<CategoryModel> get categories => _categories;
  void setCategories(List<CategoryModel> categories) {
    _categories.value = categories;
  }

  void setProductsV2(List<ProductModel> updatedproducts) {
    _products.value = updatedproducts;
  }

  final _price = "".obs;
  String get price => _price.value;
  void setPrice(String b) {
    _price.value = b;
  }

  Future<bool> fetchCreateOffer(int productIndex) async {
    List<dynamic> input_body = List.empty(growable: true);
    List<dynamic> output_body = List.empty(growable: true);
    var excels = products[productIndex].excel_cell_customer;

    var distinccells = excels!
        .where((element) =>
            element.input_or_output == "INPUT" && element.condition != null)
        .map((e) => e.cell)
        .toSet()
        .toList();

    if (excels
            .where((element) =>
                element.input_or_output == "INPUT" &&
                element.condition != null &&
                element.selected == true)
            .length !=
        distinccells.length) {
      return false;
    }
    for (var i = 0; i < excels.length; i++) {
      if (excels[i].input_or_output == "INPUT" && excels[i].condition == null) {
        input_body.add({excels[i].cell: excels[i].selected_value_int});
      }

      if (excels[i].input_or_output == "INPUT" &&
          excels[i].condition != null &&
          excels[i].selected == true) {
        input_body.add({
          excels[i].cell: products[productIndex]
              .excel_cell_customer![i]
              .condition!
              .selected_value
        });
      }
      if (excels[i].input_or_output == "OUTPUT") {
        output_body.add({
          products[productIndex]
              .excel_cell_customer![i]
              .condition!
              .selected_value: excels[i].cell
        });
      }
    }
    int? conditionId = 0;
    if (products[productIndex]
                .excel_cell_customer!
                .where((element) => element.input_or_output == "OUTPUT")
                .length >
            1 &&
        products[productIndex].excel_cell_customer!.any((element) =>
            element.input_or_output == "OUTPUT" && element.selected == true)) {
      conditionId = products[productIndex]
          .excel_cell_customer!
          .where((element) =>
              element.input_or_output == "OUTPUT" && element.selected == true)
          .first
          .condition
          ?.id;
    } else if (products[productIndex]
                .excel_cell_customer!
                .where((element) => element.input_or_output == "OUTPUT")
                .length >
            1 &&
        !products[productIndex].excel_cell_customer!.any((element) =>
            element.input_or_output == "OUTPUT" && element.selected == true)) {
      return false;
    } else if (products[productIndex]
            .excel_cell_customer!
            .where((element) => element.input_or_output == "OUTPUT")
            .length ==
        1) {
      conditionId = products[productIndex]
          .excel_cell_customer!
          .where((element) => element.input_or_output == "OUTPUT")
          .first
          .condition
          ?.id;
    }
    var data = CreateOfferRequestModel(
            input_body: input_body,
            output_body: output_body,
            product: products[productIndex].id,
            condition: conditionId)
        .toJson();
    BaseResponse response = await _dioClient.post(Urls.createoffer, data: data);

    if (response.success == true) {
      var offerresponse = OfferResponseModel.fromMap(response.data);
      double offerprice = double.parse(offerresponse.price!);
      double rate = double.parse(authcontroller.user.currency!.exchange_rate!);
      double currencyrate = offerprice / rate;

      String currencyRateString = currencyrate.toString();
      int indexOfDot = currencyRateString.indexOf('.');

      if (indexOfDot != -1) {
        int endIndex = indexOfDot + 3;
        if (endIndex <= currencyRateString.length) {
          setPrice(currencyRateString.substring(0, endIndex));
          return true;
        } else {
          setPrice(currencyRateString);
          return true;
        }
      } else {
        return false;
      }
    }
    return false;
  }

  List<ProductModel> sortProduct(List<ProductModel> productlist) {
    List<ProductModel> sortedproducts = List.empty(growable: true);
    for (var i = 0; i < productlist.length; i++) {
      ProductModel product = ProductModel(
          id: productlist[i].id,
          name: productlist[i].name,
          brand: productlist[i].brand,
          excel_cell_customer: List.empty(growable: true),
          images: productlist[i].images);
      sortedproducts.add(product);
    }

    for (var i = 0; i < productlist.length; i++) {
      if (productlist[i].excel_cell_customer != null &&
          productlist[i].excel_cell_customer!.isNotEmpty &&
          productlist[i]
              .excel_cell_customer!
              .where((element) =>
                  element.input_or_output == "INPUT" &&
                  element.condition == null)
              .isNotEmpty) {
        List<ProductExcelModel> excels = List.empty(growable: true);
        for (var e = 0;
            e <
                productlist[i]
                    .excel_cell_customer!
                    .where((element) =>
                        element.input_or_output == "INPUT" &&
                        element.condition == null)
                    .length;
            e++) {
          excels.add(productlist[i]
              .excel_cell_customer!
              .where((element) =>
                  element.input_or_output == "INPUT" &&
                  element.condition == null)
              .toList()[e]);
        }
        if (sortedproducts[i].excel_cell_customer!.isNotEmpty) {
          sortedproducts[i].excel_cell_customer?.addAll(excels);
        } else {
          sortedproducts[i].excel_cell_customer = excels;
        }
      }
    }
    for (var i = 0; i < productlist.length; i++) {
      if (productlist[i].excel_cell_customer != null &&
          productlist[i].excel_cell_customer!.isNotEmpty &&
          productlist[i]
              .excel_cell_customer!
              .where((element) => element.input_or_output == "OUTPUT")
              .isNotEmpty) {
        List<ProductExcelModel> excels = List.empty(growable: true);
        for (var e = 0;
            e <
                productlist[i]
                    .excel_cell_customer!
                    .where((element) => element.input_or_output == "OUTPUT")
                    .length;
            e++) {
          excels.add(productlist[i]
              .excel_cell_customer!
              .where((element) => element.input_or_output == "OUTPUT")
              .toList()[e]);
        }
        if (sortedproducts[i].excel_cell_customer!.isNotEmpty) {
          sortedproducts[i].excel_cell_customer?.addAll(excels);
        } else {
          sortedproducts[i].excel_cell_customer = excels;
        }
      }
    }
    for (var i = 0; i < productlist.length; i++) {
      var currentexcels = productlist[i].excel_cell_customer;
      if (currentexcels!.isNotEmpty &&
          currentexcels
              .where((element) =>
                  element.input_or_output == "INPUT" &&
                  element.condition != null)
              .isNotEmpty) {
        List<ProductExcelModel> excels = List.empty(growable: true);
        for (var e = 0;
            e <
                productlist[i]
                    .excel_cell_customer!
                    .where((element) =>
                        element.input_or_output == "INPUT" &&
                        element.condition != null)
                    .length;
            e++) {
          excels.add(productlist[i]
              .excel_cell_customer!
              .where((element) =>
                  element.input_or_output == "INPUT" &&
                  element.condition != null)
              .toList()[e]);
        }
        if (sortedproducts[i].excel_cell_customer!.isNotEmpty) {
          sortedproducts[i].excel_cell_customer?.addAll(excels);
        } else {
          sortedproducts[i].excel_cell_customer = excels;
        }
      }
    }
    return sortedproducts;
  }

  Future<bool> fetchProducts() async {
    BaseResponse response = await _dioClient.get(Urls.products);
    if (response.success == true) {
      List<dynamic> productlist = response.data;

      List<ProductModel> products = List.empty(growable: true);

      for (var i = 0; i < productlist.length; i++) {
        products.add(ProductModel.fromMap(productlist[i]));
      }

      List<ProductModel> sortedproducts = List.empty(growable: true);
      sortedproducts = sortProduct(products);

      setProducts(sortedproducts);
    } else {
      Get.snackbar("Error", response.message!.tr,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 10),
          icon: const Icon(Icons.error, color: Colors.red),
          overlayColor: Colors.black,
          colorText: Colors.red);
    }
    // setStatus(Status.initial);
    return false;
  }

  Future<bool> fetchCategories(String brand) async {
    BaseResponse response = await _dioClient.get(Urls.categories);
    if (response.success == true) {
      List<dynamic> categorylist = response.data;

      List<CategoryModel> categorys = List.empty(growable: true);

      for (var i = 0; i < categorylist.length; i++) {
        categorys.add(CategoryModel.fromMap(categorylist[i]));
      }
      setCategories(
          categorys.where((element) => element.brand == brand).toList());
      return true;
    } else {
      Get.snackbar("Error", response.message!.tr,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 10),
          icon: const Icon(Icons.error, color: Colors.red),
          overlayColor: Colors.black,
          colorText: Colors.red);
    }
    return false;
  }
}
