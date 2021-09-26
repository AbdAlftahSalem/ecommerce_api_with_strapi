import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/product_controller.dart';
import 'package:ecommerce_api/models/product_model.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_button.dart';
import 'package:ecommerce_api/screens/widget/custom_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DetailsProductWindowScreen extends StatelessWidget {
  ProductsModel product;
  int index;

  DetailsProductWindowScreen({required this.product, required this.index});

  ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xFFFAF7FF),
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 1.0.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            txt: "ID product : ${product.id}",
                            fontWeight: FontWeight.w600,
                          ),
                          spaceBetween(high: 1.0.h),
                          CustomText(
                            txt: "Title : ${product.title}",
                            fontWeight: FontWeight.w600,
                          ),
                          spaceBetween(high: 1.0.h),
                          CustomText(
                            txt: "Color : ${product.color}",
                            fontWeight: FontWeight.w400,
                          ),
                          spaceBetween(high: 1.0.h),
                          CustomText(
                            txt: "Size : ${product.size}",
                            fontWeight: FontWeight.w600,
                          ),
                          spaceBetween(high: 1.0.h),
                          CustomText(
                            txt: "${product.category!.title} Category",
                            fontWeight: FontWeight.w600,
                          ),
                          spaceBetween(high: 1.0.h),
                          CustomText(
                            txt: "${product.price}\$",
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                            fontSize: 10.0.sp,
                          ),
                        ],
                      ),
                      Spacer(),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1.0.w),
                          child: Image.network(
                            "$URL${product.image!}",
                            width: 20.0.w,
                            height: 20.0.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  spaceBetween(high: 1.0.h),
                  CustomText(
                    txt: product.desc,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade500,
                    height: 1.5,
                  ),
                  spaceBetween(high: 1.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        txt: "Delete product",
                        colorTxt: Colors.white,
                        colorButton: Colors.red,
                        width: 20.0.w,
                        borderRadius: 1.0.w,
                        onPressed: () =>
                            productController.deleteProduct(product.id!, index),
                      ),
                      CustomOutLineButton(
                        borderColor: primaryColor,
                        txt: "Update product",
                        colorTxt: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
