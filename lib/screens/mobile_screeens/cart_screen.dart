import 'dart:ui';

import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:ecommerce_api/controllers/cart_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'delevery_data.dart';

class CartScreen extends StatelessWidget {
  AuthController authController = Get.find();
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            child: Column(
              children: [
                Column(
                  children: authController.currentUser.orders!.map((e) {
                    double priceProduct = double.parse(e.priceProduct!) *
                        double.parse(e.countityProduct!);
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.0.w, vertical: 1.0.h),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(2.0.w),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(3.0.w),
                                ),
                                child: Image.network(
                                  "$URL${e.imageProduct}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            spaceBetween(width: 3.0.w),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  spaceBetween(high: 1.0.h),
                                  CustomText(
                                    txt: e.titleProduct,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                  spaceBetween(high: 1.0.h),
                                  spaceBetween(high: 1.0.h),
                                  CustomText(
                                    txt: e.countityProduct,
                                    color: Colors.grey,
                                  ),
                                  spaceBetween(high: 1.0.h),
                                  CustomText(
                                    txt: "${priceProduct.toString()} \$",
                                    color: primaryColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  spaceBetween(high: 2.0.h),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        txt: "Sub total : ",
                        color: Colors.grey,
                      ),
                      CustomText(
                        txt: "${cartController.priceAllProduct} \$",
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                spaceBetween(high: 1.0.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        txt: "Tax(15%) :",
                        color: Colors.grey,
                      ),
                      CustomText(
                        txt: "15\$",
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                spaceBetween(high: 1.0.h),
                Divider(
                  thickness: 0.1.h,
                  color: Colors.white,
                  endIndent: 7.0.w,
                  indent: 7.0.w,
                ),
                spaceBetween(high: 1.0.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        txt: "Total :",
                        color: Colors.grey,
                      ),
                      CustomText(
                        txt: "${cartController.priceAllProduct + 15} \$",
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                spaceBetween(high: 1.0.h),
                CustomButton(
                  txt: "Checkout",
                  colorTxt: Colors.white,
                  colorButton: primaryColor,
                  borderRadius: 2.0.w,
                  width: 85.0.w,
                  onPressed: () => Get.to(()=>DeliveryDataScreen()),
                ),
                spaceBetween(high: 1.0.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
