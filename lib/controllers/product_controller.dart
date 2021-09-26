import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/models/category_model.dart';
import 'package:ecommerce_api/models/product_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../const.dart';

class ProductController extends GetxController {
  String cat = "Technology";
  String size = "S";
  String? productImageString;
  File? productImageFile;
  Color? productColor;
  Color showProductColor = Colors.blue;
  ProductsModel newProduct = ProductsModel(
    color: "",
    price: "",
    id: 0,
    createdAt: "",
    publishedAt: '',
    updatedAt: '',
    title: '',
    image: '',
    desc: '',
    size: '',
    category: CategoryModel(
      updatedAt: "",
      id: 0,
      createdAt: '',
      title: '',
      publishedAt: '',
    ),
  );
  List<ProductsModel> productWithSameCategory = [];

  HomeAdminController homeAdminController = Get.find();

  Future pickedSingleImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      productImageFile = File(result.files.single.path.toString());
      productImageString = productImageFile
          .toString()
          .substring(7, productImageFile.toString().length - 1);
      print(productImageString);
      print(productImageFile);
    }
    update();
  }

  chooseColor(Color chooseColor) {
    newProduct.color = chooseColor.toString();
    showProductColor = chooseColor;
    update();
  }

  chooseCategory(CategoryModel cat) {
    newProduct.category = cat;
    update();
  }

  chooseSize(String size) {
    newProduct.size = size;
    update();
  }

  uploadImage() async {
    var request = http.MultipartRequest('POST', Uri.parse('$URL/upload'));
    request.files
        .add(await http.MultipartFile.fromPath('files', productImageString!));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var jsonDataForUploadFile =
          jsonDecode(await response.stream.bytesToString());
      newProduct.image =
          jsonDataForUploadFile[0]["formats"]["thumbnail"]["url"];
    } else {
      print(response.reasonPhrase);
    }
    update();
  }

  uploadProduct() async {
    await uploadImage();

    newProduct.createdAt = DateTime.now().toString();
    newProduct.publishedAt = DateTime.now().toString();
    newProduct.updatedAt = DateTime.now().toString();

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$URL/products'));
    request.body = json.encode(newProduct.toJson());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
    }
    homeAdminController.allProduct.add(newProduct);
    update();
  }

  deleteProduct(int id, index) async {
    var request = http.Request('DELETE', Uri.parse('$URL/products/$id'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await homeAdminController.getAllProduct();
      Get.back();
    } else {
      print(response.reasonPhrase);
    }
  }

  getProductWithSameCategory(String cat) {
    productWithSameCategory.clear();
    productWithSameCategory = homeAdminController.allProduct
        .where((element) => element.category!.title == cat)
        .toList();
    print(productWithSameCategory.length);
    update();
  }
}
