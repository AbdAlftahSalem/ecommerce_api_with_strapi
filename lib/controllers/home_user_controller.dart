import 'dart:convert';

import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/models/order_model.dart';
import 'package:ecommerce_api/models/product_model.dart';
import 'package:ecommerce_api/screens/mobile_screeens/cart_screen.dart';
import 'package:ecommerce_api/screens/mobile_screeens/home_screen.dart';
import 'package:ecommerce_api/screens/mobile_screeens/profile_screen.dart';
import 'package:ecommerce_api/screens/mobile_screeens/search_screen.dart';
import 'package:ecommerce_api/screens/mobile_screeens/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../const.dart';
import 'cart_controller.dart';

class HomeUserController extends GetxController {
  int currentIndex = 0;
  AuthController authController = Get.find();
  HomeAdminController homeAdminController = Get.find();
  CartController cartController = Get.put(CartController());
  List<ProductsModel> productWithCat = [];
  String productCategory = "All product";
  int quntity = 1;

  List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    ShopScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  List<String> allCat = [
    "All product",
    "Technology",
    "Clothing",
    "Watch",
    "Shoes"
  ];

  changeCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  isDataExist(OrderModel order) {
    if (authController.currentUser.orders!
        .where((oldValue) => order.idProduct == (oldValue.idProduct.toString()))
        .isEmpty) {
      addToCart(order);
    }else{
      Get.snackbar('Message', 'This item existing');
    }
  }

  addToCart(OrderModel order) async {
    homeAdminController.allOrder.add(order);
    authController.currentUser.orders!.add(order);
    update();
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$URL/orders'));
    request.body = json.encode(order.toJson());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      await updateUserData(order);
      cartController.getPriceAllProduct();
    } else {
      print(response.reasonPhrase);
    }
    update();
  }

  updateUserData(OrderModel order) async {
    var headers = {'Content-Type': 'application/json'};

    var request = http.Request(
        'PUT', Uri.parse('$URL/users/${authController.currentUser.id}'));
    request.body = json.encode(authController.currentUser.toJson());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  getProductWithCat(String category) {
    print(category);

    productWithCat = category == "All product"
        ? homeAdminController.allProduct
        : homeAdminController.allProduct
            .where((product) => product.category!.title == category)
            .toList();

    print(productWithCat.length);

    update();
  }

  chooseCat(String cat) {
    productCategory = cat;
    getProductWithCat(cat);
    update();
  }

  addQuntity() {
    ++quntity;
    update();
  }

  minQuntity() {
    quntity == 1 ? quntity = 1 : --quntity;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    chooseCat(productCategory);
    Get.put(CartController());
  }
}
