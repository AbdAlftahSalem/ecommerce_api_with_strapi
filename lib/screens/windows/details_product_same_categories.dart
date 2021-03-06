import 'package:ecommerce_api/controllers/product_controller.dart';
import 'package:ecommerce_api/models/category_model.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_text_form_field.dart';
import 'package:ecommerce_api/screens/widget/product_Table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';
import 'details_product_window_screen.dart';

class DetailsProductSameCategories extends StatelessWidget {
  CategoryModel category;

  DetailsProductSameCategories({required this.category});

  ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    productController.getProductWithSameCategory(category.title!);

    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xFFFAF7FF),
          appBar: AppBar(),
          body: productController.productWithSameCategory.length == 0
              ? Center(child: Image.asset('assets/image/Empty-pana.png'))
              : Column(
                  children: [
                    spaceBetween(high: 1.0.h),
                    Expanded(
                      child: SizedBox(
                        width: 50.0.w,
                        child: CustomTextFormField(
                          color: Colors.black,
                          hintTxt: "search",
                          icon: Icons.search,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (val) {
                            // authController.newUser.email = val;
                          },
                          onChange: (val) {
                            // authController.newUser.email = val;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Required";
                            } else
                              return null;
                          },
                          controller:
                              TextEditingController(text: "Search product"),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        color: Color(0xFFFAF7FF),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                          child: ListView(
                            children: [
                              ProductTable(
                                  product: productController
                                      .productWithSameCategory),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget cardProduct(
      {String? idProduct,
      imageProduct,
      titleProduct,
      categoryProduct,
      colorProduct,
      priceProduct}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE3E0F3),
        borderRadius: BorderRadius.circular(1.0.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              txt: idProduct,
              alignment: Alignment.center,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0.w),
              child: Image.network(
                "$URL$imageProduct",
                width: 5.0.w,
                height: 5.0.h,
              ),
            ),
            CustomText(
              txt: titleProduct,
            ),
            CustomText(
              txt: categoryProduct,
            ),
            CustomText(
              txt: colorProduct,
              color: Colors.green,
            ),
            CustomText(
              txt: "$priceProduct\$",
            ),
          ],
        ),
      ),
    );
  }
}
