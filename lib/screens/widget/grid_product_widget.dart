import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/controllers/home_user_controller.dart';
import 'package:ecommerce_api/models/order_model.dart';
import 'package:ecommerce_api/models/product_model.dart';
import 'package:ecommerce_api/screens/mobile_screeens/details_product_screen.dart';
import 'package:ecommerce_api/screens/widget/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';
import 'custem_text.dart';
import 'custom_outline_button.dart';

class GridProductWidget extends StatelessWidget {
  List<ProductsModel> product;

  GridProductWidget({required this.product});

  HomeUserController homeUserController = Get.find();
  HomeAdminController homeAdminController =Get.find();

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      mainAxisSpacing: 2.0.w,
      crossAxisSpacing: 2.0.w,
      crossAxisCount: 2,
      itemCount: product.length,
      physics: BouncingScrollPhysics(),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      itemBuilder: (context, index) => InkWell(
        onTap: ()=>Get.to(()=>DetailsProductScreen(product: product[index],)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0.w),
          child: Container(
            color: Theme.of(context).accentColor,
            child: Column(
              children: [
                CustomCachedNetworkImage(image: "$URL${product[index].image!}"),
                spaceBetween(high: 0.9.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 1.0.w, vertical: 1.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        txt: product[index].title,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                      spaceBetween(high: 0.5.h),
                      CustomText(
                        txt: product[index].price,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomOutLineButton(
                        txt: "Add to cart",
                        onPresses: ()=>homeUserController.isDataExist(OrderModel(
                          priceProduct: product[index].price,
                          updatedAt: product[index].updatedAt,
                          idProduct: product[index].id.toString(),
                          colorProduct: product[index].color,
                          imageProduct: product[index].image,
                          titleProduct: product[index].title,
                          publishedAt: product[index].publishedAt,
                          createdAt: product[index].createdAt,
                          id: homeAdminController.allOrder[homeAdminController.allOrder.length -1].id! +1,
                          countityProduct: 1.toString(),
                          dateProduct: product[index].createdAt,
                          descProduct: product[index].desc,
                          sizeProduct: product[index].size,
                        )),
                        colorTxt: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
