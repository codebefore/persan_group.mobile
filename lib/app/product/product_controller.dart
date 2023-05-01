import 'package:get/get.dart';
import 'package:persangroup_mobile/app/product/price_model.dart';
import 'package:persangroup_mobile/app/product/product_category_model.dart';
import 'package:persangroup_mobile/core/constant/enums.dart';

class ProductController extends GetxController {
  //
  // final DioClient _dioClient = getIt.get<DioClient>();

  //loading get set
  final _status = Status.initial.obs;
  Status get status => _status.value;
  void setStatus(Status b) {
    _status.value = b;
    update();
  }

  //signup get set
  final Rx<PriceModel> _priceModel = PriceModel().obs;
  PriceModel get priceModel => _priceModel.value;

  void setPriceModel(PriceModel priceModel) {
    setStatus(Status.initial);
    _priceModel(priceModel);
  }

  List<ProductCategoryModel> getCategories() {
    Iterable categories = [
      {
        "id": "0",
        "name": "CALYPSO",
        "apiname": "WINTENT",
        "url": "lib/assets/images/categories/wintent.png",
        "types": ["withmotor", "manuel"]
      },
      {
        "id": "1",
        "name": "LYNX",
        "apiname": "LYNX",
        "url": "lib/assets/images/categories/lynxs.png",
      },
      {
        "id": "2",
        "name": "PANDORA",
        "apiname": "Pandora",
        "url": "lib/assets/images/categories/pandora.png",
      },
      {
        "id": "60",
        "name": "PHOENIX",
        "apiname": "PHOENIX",
        "url": "lib/assets/images/categories/phoenix.png",
        "childs": [
          {
            "id": "61",
            "name": "PHOENIX",
            "apiname": "PHOENIX",
            "url": "lib/assets/images/categories/phoenix.png",
          },
          {
            "id": "60",
            "name": "PHOENIXTEX",
            "apiname": "PHOENIXTEX",
            "url": "lib/assets/images/categories/phoenix.png",
          }
        ]
      },
      {
        "id": "20",
        "name": "SIRIUS",
        "apiname": "PARAGOLEKAL",
        "url": "lib/assets/images/categories/pergola.png",
        "childs": [
          {
            "id": "555",
            "name": "HELEN",
            "apiname": "PARAGOLEHELEN",
            "url": "lib/assets/images/categories/helen.png",
            "message": "",
            "childs": [
              {
                "id": "550",
                "name": "2RAIL",
                "apiname": "PARAGOLEHELEN2RAYLI",
                "url": "lib/assets/images/column/2rail.png",
              },
              {
                "id": "551",
                "name": "3RAIL",
                "apiname": "PARAGOLEHELE3RAYLI",
                "url": "lib/assets/images/column/3rail.png",
              },
              {
                "id": "552",
                "name": "4RAIL",
                "apiname": "PARAGOLEHELEN4RAYLI",
                "url": "lib/assets/images/column/4rail.png",
              },
            ]
          },
          {
            "id": "20",
            "name": "SIRIUS",
            "apiname": "PARAGOLEKAL",
            "url": "lib/assets/images/categories/helen.png",
            "message": "",
            "childs": [
              {
                "id": "20",
                "name": "2RAIL",
                "apiname": "PARAGOLEKAL",
                "url": "lib/assets/images/column/2rail.png",
              },
              {
                "id": "21",
                "name": "3RAIL",
                "apiname": "PARAGOLEKAL3RAYLI",
                "url": "lib/assets/images/column/3rail.png",
              },
              {
                "id": "22",
                "name": "4RAIL",
                "apiname": "PARAGOLEKAL4RAYLI",
                "url": "lib/assets/images/column/4rail.png",
              },
            ]
          },
          {
            "id": "10",
            "name": "HERCULES",
            "apiname": "PARAGOLESTAN",
            "url": "lib/assets/images/categories/helen.png",
            "message": "",
            "childs": [
              {
                "id": "10",
                "name": "2RAIL",
                "apiname": "PARAGOLESTAN",
                "url": "lib/assets/images/column/2rail.png",
              },
              {
                "id": "11",
                "name": "3RAIL",
                "apiname": "PARAGOLESTAN3RAYLI",
                "url": "lib/assets/images/column/3rail.png",
              },
              {
                "id": "12",
                "name": "4RAIL",
                "apiname": "PARAGOLESTAN4RAYLI",
                "url": "lib/assets/images/column/4rail.png",
              },
            ]
          }
        ]
      },
      {
        "id": "5",
        "name": "TETHYS",
        "apiname": "VETICALSET",
        "url": "lib/assets/images/categories/tethys.png",
      },
      {
        "id": "30",
        "apiname": "TITANSTAN2RAYLI",
        "name": "TITAN",
        "url": "lib/assets/images/categories/titan.png",
        "childs": [
          {
            "id": "30",
            "name": "2RAIL",
            "apiname": "TITANSTAN2RAYLI",
            "url": "lib/assets/images/column/2rail.png",
          },
          {
            "id": "31",
            "name": "3RAIL",
            "apiname": "TITANSTAN3RAYLI",
            "url": "lib/assets/images/column/3rail.png",
          },
          {
            "id": "32",
            "name": "4RAIL",
            "apiname": "TITANSTAN4RAYLI",
            "url": "lib/assets/images/column/4rail.png",
          },
        ]
      },
      {
        "id": "7",
        "apiname": "Zip",
        "name": "RHEA",
        "url": "lib/assets/images/categories/zip.png",
      }
    ];
    return categories.map((e) => ProductCategoryModel.fromMap(e)).toList();
  }
}
