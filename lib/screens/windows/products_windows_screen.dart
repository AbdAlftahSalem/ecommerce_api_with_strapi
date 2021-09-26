import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'details_product_window_screen.dart';

class ProductsWindowsScreen extends StatelessWidget {
  HomeAdminController homeAdminController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeAdminController>(
        init: HomeAdminController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Color(0xFFFAF7FF),
            appBar: AppBar(),
            body: Column(
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
                      controller: TextEditingController(text: "Search product"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    color: Color(0xFFFAF7FF),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () =>
                                Get.to(() => DetailsProductWindowScreen(
                                      product:
                                          homeAdminController.allProduct[index],
                                      index: index,
                                    )),
                            child: cardProduct(
                              imageProduct:
                                  homeAdminController.allProduct[index].image,
                              categoryProduct: homeAdminController
                                  .allProduct[index].category!.title,
                              colorProduct:
                                  homeAdminController.allProduct[index].color,
                              idProduct: homeAdminController
                                  .allProduct[index].id
                                  .toString(),
                              priceProduct:
                                  homeAdminController.allProduct[index].price,
                              titleProduct:
                                  homeAdminController.allProduct[index].title,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            spaceBetween(high: 1.0.h),
                        itemCount: homeAdminController.allProduct.length,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
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
