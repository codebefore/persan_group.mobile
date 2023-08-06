// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/product/create_offer_request_model.dart';
import 'package:persangroup_mobile/app/product/product_model.dart';
import 'package:persangroup_mobile/core/network/base_response.dart';
import 'package:persangroup_mobile/core/network/dio_client.dart';
import 'package:persangroup_mobile/core/network/network.dart';

import '../getit_binding.dart';

class ProductController extends GetxController {
  //
  final DioClient _dioClient = getIt.get<DioClient>();

  //products get set
  final _products = <ProductModel>[].obs;
  List<ProductModel> get products => _products;
  void setProducts(List<ProductModel> products) {
    _products.value = products;
    update();
    // products.toString();
  }

  void setProductsV2(List<ProductModel> updatedproducts) {
    _products.value = updatedproducts;
    // products.toString();
  }

  Future<bool> fetchCreateOffer(int productIndex) async {
    List<dynamic> input_body = List.empty(growable: true);
    List<dynamic> output_body = List.empty(growable: true);
    for (var i = 0;
        i < products[productIndex].excel_cell_customer!.length;
        i++) {
      if (products[productIndex].excel_cell_customer![i].input_or_output ==
          "INPUT") {
        input_body.add({
          products[productIndex].excel_cell_customer![i].cell:
              products[productIndex].excel_cell_customer![i].condition
        });
      }
      if (products[productIndex].excel_cell_customer![i].input_or_output ==
          "OUTPUT") {
        output_body.add({
          products[productIndex].excel_cell_customer![i].condition:
              products[productIndex].excel_cell_customer![i].cell
        });
      }
    }

    BaseResponse response = await _dioClient.post(Urls.createoffer,
        data: CreateOfferRequestModel(
                input_body: input_body,
                output_body: output_body,
                product: products[productIndex].id,
                condition: "MT_NOK")
            .toJson());

    if (response.success == true) {
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

  Future<bool> fetchProducts() async {
    BaseResponse response = await _dioClient.get(Urls.products);
    if (response.success == true) {
      List<dynamic> productlist = response.data;
      List<ProductModel> products = List.empty(growable: true);
      for (var i = 0; i < productlist.length; i++) {
        products.add(ProductModel.fromMap(productlist[i]));
      }
      setProducts(products);
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
}
