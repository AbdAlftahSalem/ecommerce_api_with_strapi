import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  double priceAllProduct = 0;
  AuthController authController = Get.find();
  int quntity = 1;

  getPriceAllProduct() {
    for (int i = 0; i < authController.currentUser.orders!.length; ++i) {
      priceAllProduct = priceAllProduct +
          (double.parse(authController.currentUser.orders![i].priceProduct!)) *
              double.parse(
                  authController.currentUser.orders![i].countityProduct!);
    }
    print(priceAllProduct);
    update();
  }

  addQuntity() {
    ++quntity;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getPriceAllProduct();
  }
}
