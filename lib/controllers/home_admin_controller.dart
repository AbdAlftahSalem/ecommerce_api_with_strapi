import 'dart:convert';

import 'package:ecommerce_api/models/category_model.dart';
import 'package:ecommerce_api/models/checkout_model.dart';
import 'package:ecommerce_api/models/order_model.dart';
import 'package:ecommerce_api/models/product_model.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import '../const.dart';

class HomeAdminController extends GetxController {
  List<ProductsModel> allProduct = [];
  List<CheckoutModel> allChekOut = [];
  List<CategoryModel> allCategories = [];
  List<OrderModel> allOrder = [];

  getAllProduct() async {
    final response = await http.get(Uri.parse('$URL/products'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      allProduct.clear();
      for (var item in jsonData) {
        allProduct.add(ProductsModel.fromJson(item));
      }
    } else {
      print('data');
    }
    print("allProduct.length ${allProduct.length}");
    update();
  }

  getAllCategory() async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('$URL/categories'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(await response.stream.bytesToString());
      allCategories.clear();
      for(var item in jsonData){
        allCategories.add(CategoryModel.fromJson(item));
      }
    }
    else {
      print(response.reasonPhrase);
    }
    print(allCategories.length);
    update();
  }

  getAllCheckouts() async {
    final response = await http.get(Uri.parse('$URL/checkouts'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      allChekOut.clear();
      for (var item in jsonData) {
        allChekOut.add(CheckoutModel.fromJson(item));
      }
    } else {
      print('data');
    }
    print("allChekOut.length ${allChekOut.length}");
    update();
  }

  getAllOrder() async {

    final response = await http.get(Uri.parse('$URL/orders'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      allOrder.clear();
      for (var item in jsonData) {
        allOrder.add(OrderModel.fromJson(item));
      }
    } else {
      print('data');
    }
    print("allOrder.lengthallOrder.lengthallOrder.lengthallOrder.length ${allOrder.length}");
    update();
  }


  @override
  void onInit() {
    super.onInit();
    getAllProduct();
    getAllCheckouts();
    getAllCategory();
    getAllOrder();
  }
}
