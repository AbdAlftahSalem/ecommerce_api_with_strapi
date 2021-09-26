import 'dart:convert';

import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:ecommerce_api/models/checkout_model.dart';
import 'package:ecommerce_api/screens/mobile_screeens/submit_order_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../const.dart';

class CheckoutController extends GetxController {
  List<CheckoutModel> checkoutsProduct = [];
  AuthController authController = Get.find();

  CheckoutModel checkoutModel = CheckoutModel(
    id: 0,
    createdAt: "",
    publishedAt: "",
    updatedAt: "",
    price: "",
    customerName: "",
    countity: "",
    customerCity: "",
    customerEmail: "",
    customerId: "",
    customerPhone: "",
    customerPic: "",
    customerStreet: "",
    dateOfOrder: "",
  );

  addToCheckOut(CheckoutModel checkoutModel) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$URL/checkouts'));
    request.body = json.encode(checkoutModel.toJson());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await updateUserData();
      Get.offAll(() => SubmitOrderScreen());
    } else {
      print(response.reasonPhrase);
    }
  }

  updateUserData() async {
    authController.currentUser.orders!.clear();

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT', Uri.parse('$URL/users/${authController.currentUser.id}'));
    request.body = json.encode({
      "id": 3,
      "username": authController.currentUser.username,
      "email": authController.currentUser.email,
      "provider": authController.currentUser.provider,
      "confirmed": authController.currentUser.confirmed,
      "blocked": authController.currentUser.blocked,
      "role": authController.currentUser.role,
      "phone": authController.currentUser.phone,
      "profilePic": authController.currentUser.profilePic,
      "dateSignUp": authController.currentUser.dateSignUp,
      "created_at": authController.currentUser.createdAt,
      "updated_at": authController.currentUser.updatedAt,
      "orders": [],
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  update();
  }
}
