import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/models/product_model.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  List<ProductsModel> searchProduct = [];
  HomeAdminController homeAdminController = Get.find();
  String searchText = "";

  searchSubjectMethod() {
    searchProduct.clear();

    searchProduct = homeAdminController.allProduct
        .where((product) => product.title!.startsWith(searchText))
        .toList();

    print(searchProduct.length);

    update();
  }

  getSearchProduct(String title) {
    update();
  }
}
