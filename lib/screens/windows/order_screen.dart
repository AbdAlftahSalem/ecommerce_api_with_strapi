import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../const.dart';
import 'details_order_screen.dart';

class OrderScreen extends StatelessWidget {
  AuthController authController = Get.find();
  HomeAdminController homeAdminController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF7FF),
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 1.0.h),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Color(0xFFFAF7FF),
                margin: EdgeInsets.all(2.0.w),
                child: Column(
                  children: [
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
                      flex: 7,
                      child: Container(
                        color: Color(0xFFFAF7FF),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                          child: ListView.separated(
                            itemCount: homeAdminController.allChekOut.length,
                            itemBuilder: (context, index) {
                              dynamic dateOrder = DateFormat.yMd().format(
                                  DateTime.parse(homeAdminController
                                      .allChekOut[index].dateOfOrder!));
                              return InkWell(
                                onTap: () => Get.to(
                                  () => DetailsOrderScreen(
                                      checkout: homeAdminController
                                          .allChekOut[index]),
                                ),
                                child: cardProduct(
                                  imageCustomer: homeAdminController
                                      .allChekOut[index].customerPic,
                                  userNameCustomer: homeAdminController
                                      .allChekOut[index].customerName,
                                  dateOrder: dateOrder,
                                  priceOrder: homeAdminController
                                      .allChekOut[index].price,
                                  idOrder: "1",
                                  quntity: "2",
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    spaceBetween(high: 1.0.h),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardProduct({
    String? imageCustomer,
    dateOrder,
    userNameCustomer,
    priceOrder,
    idOrder,
    quntity,
  }) {
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
              txt: idOrder,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0.w),
              child: Image.network(
                "$URL$imageCustomer",
                width: 5.0.w,
                height: 5.0.h,
              ),
            ),
            CustomText(
              txt: userNameCustomer,
            ),
            CustomText(
              txt: dateOrder,
            ),
            CustomText(
              txt: quntity,
            ),
            CustomText(
              txt: "$priceOrder\$",
            ),
          ],
        ),
      ),
    );
  }
}
