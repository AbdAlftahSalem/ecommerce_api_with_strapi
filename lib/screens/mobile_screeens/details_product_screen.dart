import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/controllers/home_user_controller.dart';
import 'package:ecommerce_api/models/order_model.dart';
import 'package:ecommerce_api/models/product_model.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DetailsProductScreen extends StatelessWidget {
  ProductsModel product;

  DetailsProductScreen({required this.product});

  HomeAdminController homeAdminController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeUserController>(
      init: HomeUserController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: 50.0.h,
                width: 100.0.w,
                child: Image.network(
                  "$URL${product.image}",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0.h),
                child: Container(
                  height: 60.0.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10.0.w),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.0.w, vertical: 4.0.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomText(
                              txt: product.title,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 14.0.sp,
                            ),
                            Spacer(),
                            CustomButton(
                              txt: "${product.price} \$",
                              colorButton: primaryColor,
                              colorTxt: Colors.white,
                              borderRadius: 2.0.w,
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        spaceBetween(high: 1.0.h),
                        Expanded(
                          flex: 15,
                          child: ListView(
                            children: [
                              CustomText(
                                txt: product.desc,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2.0.w),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.remove),
                                    iconSize: 22.0.sp,
                                  ),
                                  CustomText(
                                    txt: controller.quntity.toString(),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add),
                                    iconSize: 18.0.sp,
                                  ),
                                ],
                              ),
                            ),
                            spaceBetween(width: 3.0.w),
                            Expanded(
                              child: CustomButton(
                                txt: "Add to cart",
                                colorButton: primaryColor,
                                colorTxt: Colors.white,
                                borderRadius: 2.0.w,
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w600,
                                high: 6.1.h,
                                onPressed: ()=>controller.isDataExist(OrderModel(
                                  priceProduct: product.price,
                                  updatedAt: product.updatedAt,
                                  idProduct: product.id.toString(),
                                  colorProduct: product.color,
                                  imageProduct: product.image,
                                  titleProduct: product.title,
                                  publishedAt: product.publishedAt,
                                  createdAt: product.createdAt,
                                  id: homeAdminController.allOrder[homeAdminController.allOrder.length -1].id! +1,
                                  countityProduct: controller.quntity.toString(),
                                  dateProduct: product.createdAt,
                                  descProduct: product.desc,
                                  sizeProduct: product.size,
                                )),
                              ),
                            ),
                          ],
                        ),
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
}

