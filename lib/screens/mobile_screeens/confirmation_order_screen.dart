import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:ecommerce_api/controllers/cart_controller.dart';
import 'package:ecommerce_api/controllers/checkout_controller.dart';
import 'package:ecommerce_api/models/checkout_model.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_button.dart';
import 'package:ecommerce_api/screens/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ConfirmationOrderScreen extends StatelessWidget {
  CheckoutController checkoutController = Get.find();
  AuthController authController = Get.find();
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    print(checkoutController.checkoutModel.customerStreet);
    print(checkoutController.checkoutModel.customerCity);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 2.0.h),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage("$URL${authController.currentUser.profilePic!}"),
                radius: 12.0.w,
              ),
              spaceBetween(high: 2.0.h),
              nameFiled(),
              phoneFiled(),
              emailFiled(),
              countryFiled(),
              streetFiled(),
              SizedBox(
                width: 100.0.w,
                height: 20.0.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2.0.w),
                          child: Image.network(
                            "$URL${authController.currentUser.orders![index].imageProduct}",
                            height: 10.0.h,
                          ),
                        ),
                        spaceBetween(high: 1.0.h),
                        CustomText(
                          txt: authController
                              .currentUser.orders![index].titleProduct,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                        CustomText(
                          txt:
                              "${authController.currentUser.orders![index].priceProduct} \$ x ${authController.currentUser.orders![index].countityProduct}",
                          color: primaryColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      spaceBetween(width: 3.0.w),
                  itemCount: authController.currentUser.orders!.length,
                ),
              ),

              CustomButton(
                txt: "Confirm order",
                colorTxt: Colors.white,
                colorButton: primaryColor,
                borderRadius: 2.0.w,
                width: 85.0.w,
                onPressed: () => checkoutController.addToCheckOut(CheckoutModel(
                  dateOfOrder: DateTime.now().toString(),
                  customerStreet: checkoutController.checkoutModel.customerStreet,
                  customerPic: authController.currentUser.profilePic,
                  customerPhone: authController.currentUser.phone,
                  customerId: authController.currentUser.id.toString(),
                  customerEmail: authController.currentUser.email,
                  customerCity: checkoutController.checkoutModel.customerCity,
                  countity: "0",
                  customerName: authController.currentUser.username,
                  price: (cartController.priceAllProduct + 15).toString(),
                  updatedAt: DateTime.now().toString(),
                  publishedAt: DateTime.now().toString(),
                  createdAt: DateTime.now().toString(),
                  orders: authController.currentUser.orders,
                )),
              ),
              spaceBetween(high: 1.0.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameFiled() {
    return CustomTextFormField(
      color: Colors.black,
      hintTxt: "Enter your name",
      keyboardType: TextInputType.text,
      onSaved: (val) {
        checkoutController.checkoutModel.customerName = val;
      },
      onChange: (val) {
        checkoutController.checkoutModel.customerName = val;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "Required";
        } else
          return null;
      },
      controller:
          TextEditingController(text: authController.currentUser.username),
    );
  }

  Widget phoneFiled() {
    return CustomTextFormField(
      color: Colors.black,
      hintTxt: "Enter your name",
      keyboardType: TextInputType.text,
      onSaved: (val) {
        checkoutController.checkoutModel.customerPhone = val;
      },
      onChange: (val) {
        checkoutController.checkoutModel.customerPhone = val;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "Required";
        } else
          return null;
      },
      controller: TextEditingController(text: authController.currentUser.phone),
    );
  }

  Widget emailFiled() {
    return CustomTextFormField(
      color: Colors.black,
      hintTxt: "Enter your email",
      keyboardType: TextInputType.text,
      onSaved: (val) {
        checkoutController.checkoutModel.customerEmail = val;
      },
      onChange: (val) {
        checkoutController.checkoutModel.customerEmail = val;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "Required";
        } else
          return null;
      },
      controller: TextEditingController(text: authController.currentUser.email),
    );
  }

  Widget countryFiled() {
    return CustomTextFormField(
      color: Colors.black,
      hintTxt: "Enter your country",
      keyboardType: TextInputType.text,
      onSaved: (val) {
        checkoutController.checkoutModel.customerCity = val;
      },
      onChange: (val) {
        checkoutController.checkoutModel.customerCity = val;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "Required";
        } else
          return null;
      },
      controller: TextEditingController(
          text: checkoutController.checkoutModel.customerCity),
    );
  }

  Widget streetFiled() {
    return CustomTextFormField(
      color: Colors.black,
      hintTxt: "Enter your country",
      keyboardType: TextInputType.text,
      onSaved: (val) {
        checkoutController.checkoutModel.customerStreet = val;
      },
      onChange: (val) {
        checkoutController.checkoutModel.customerStreet = val;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "Required";
        } else
          return null;
      },
      controller: TextEditingController(
          text: checkoutController.checkoutModel.customerStreet),
    );
  }
}
