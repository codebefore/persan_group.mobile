// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persangroup_mobile/app/product/create_offer_request_model.dart';
import 'package:persangroup_mobile/app/product/offer_response_model.dart';
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
    // products.toString();
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
    for (var i = 0;
        i < products[productIndex].excel_cell_customer!.length;
        i++) {
      if (products[productIndex].excel_cell_customer![i].input_or_output ==
              "INPUT" &&
          products[productIndex].excel_cell_customer![i].condition == null) {
        input_body.add({
          products[productIndex].excel_cell_customer![i].cell:
              products[productIndex].excel_cell_customer![i].selected_value_int
        });
      }
      if (products[productIndex].excel_cell_customer![i].input_or_output ==
              "INPUT" &&
          products[productIndex].excel_cell_customer![i].condition != null &&
          products[productIndex].excel_cell_customer![i].selected == true) {
        input_body.add({
          products[productIndex].excel_cell_customer![i].cell:
              products[productIndex]
                  .excel_cell_customer![i]
                  .condition!
                  .selected_value
        });
      }
      if (products[productIndex].excel_cell_customer![i].input_or_output ==
          "OUTPUT") {
        output_body.add({
          products[productIndex]
                  .excel_cell_customer![i]
                  .condition!
                  .selected_value:
              products[productIndex].excel_cell_customer![i].cell
        });
      }
    }
    var data = CreateOfferRequestModel(
            input_body: input_body,
            output_body: output_body,
            product: products[productIndex].id,
            condition: products[productIndex]
                .excel_cell_customer!
                .where((element) => element.selected == true)
                .first
                .condition
                ?.id)
        .toJson();
    print(data);
    BaseResponse response = await _dioClient.post(Urls.createoffer, data: data);

    if (response.success == true) {
      var offerresponse = OfferResponseModel.fromMap(response.data);
      setPrice(offerresponse.price ?? "");
    }
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

      for (var i = 0; i < products.length; i++) {
        products[i]
            .excel_cell_customer
            ?.sort((a, b) => a.input_or_output!.compareTo(b.input_or_output!));
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
