import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/product_controller.dart';
import 'package:ecommerce_api/controllers/home_admin_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_button.dart';
import 'package:ecommerce_api/screens/widget/custom_drop_down_button.dart';
import 'package:ecommerce_api/screens/widget/custom_outline_button.dart';
import 'package:ecommerce_api/screens/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddNewProductScreen extends StatelessWidget {
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  ProductController addProductController = Get.put(ProductController());
  HomeAdminController homeAdminController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xFFFAF7FF),
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 1.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleField(),
                        Row(
                          children: homeAdminController.allCategories.map((e) {
                            return InkWell(
                              onTap: () =>
                                  addProductController.chooseCategory(e),
                              child: Container(
                                width: 15.0.w,
                                height: 12.0.w,
                                margin: EdgeInsets.symmetric(horizontal: 2.0.w),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.5,
                                    color: e.title ==
                                            addProductController
                                                .newProduct.category!.title
                                        ? primaryColor
                                        : Color(0xFFFAF7FF),
                                  ),
                                  borderRadius: BorderRadius.circular(2.0.w),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(1.0.w),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        "$URL${e.image!.url}",
                                        fit: BoxFit.cover,
                                        height: 2.6.h,
                                      ),
                                      // spaceBetween(high: 1.0.h),
                                      Padding(
                                        padding: EdgeInsets.only(left: 1.2.w),
                                        child: CustomText(
                                          txt: e.title,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        spaceBetween(high: 3.0.h),
                        Row(
                          children: size.map((e) {
                            return InkWell(
                              onTap: ()=>addProductController.chooseSize(e),
                              child: Container(
                                width: 15.0.w,
                                height: 12.0.w,
                                margin: EdgeInsets.symmetric(horizontal: 2.0.w),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: e ==
                                        addProductController.newProduct.size ? 2.5 : 1,
                                    color: e ==
                                            addProductController.newProduct.size
                                        ? primaryColor
                                        : Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(2.0.w),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(1.0.w),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 1.2.w),
                                    child: CustomText(
                                      txt: e,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        spaceBetween(high: 3.0.h),
                        priceField(),
                      ],
                    ),
                    uploadImage(),
                  ],
                ),
                spaceBetween(high: 3.0.h),
                descriptionField(),
                chooseColor(context),
              ],
            ),
          ),
        );
      },
    );
  }

  SizedBox titleField() {
    return SizedBox(
      width: 80.0.w,
      child: CustomTextFormField(
        maxLines: 20,
        color: Colors.black,
        hintTxt: "Title",
        icon: Icons.edit,
        keyboardType: TextInputType.emailAddress,
        onSaved: (val) {
          addProductController.newProduct.title = val;
        },
        onChange: (val) {
          addProductController.newProduct.title = val;
        },
        validator: (value) {
          if (value.isEmpty) {
            return "Required";
          } else
            return null;
        },
      ),
    );
  }

  SizedBox priceField() {
    return SizedBox(
      width: 80.0.w,
      child: CustomTextFormField(
        maxLines: 20,
        color: Colors.black,
        hintTxt: "Price",
        icon: Icons.attach_money,
        keyboardType: TextInputType.number,
        onSaved: (val) {
          addProductController.newProduct.price = val;
        },
        onChange: (val) {
          addProductController.newProduct.price = val;
        },
        validator: (value) {
          if (value.isEmpty) {
            return "Required";
          } else
            return null;
        },
      helperText: "please enter number",
      ),
    );
  }

  chooseColor(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          txt: "Choose color",
          width: 20.0.w,
          high: 2.0.h,
          borderRadius: 1.0.w,
          colorButton: primaryColor,
          colorTxt: Colors.white,
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Pick a color!'),
                content: SingleChildScrollView(
                  child: MaterialPicker(
                    pickerColor: currentColor,
                    onColorChanged: (val) {
                      addProductController.chooseColor(val);
                    },
                    enableLabel: true,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: const Text('Got it'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          ),
        ),
        spaceBetween(width: 10.0.w),
        CircleAvatar(
          backgroundColor: addProductController.productColor,
        ),
        Spacer(),
        CustomOutLineButton(
          colorTxt: Colors.black,
          borderColor: primaryColor,
          txt: "Add product",
          onPresses: () => addProductController.uploadProduct(),
        ),
      ],
    );
  }

  Expanded descriptionField() {
    return Expanded(
      child: CustomTextFormField(
        maxLines: 20,
        color: Colors.black,
        hintTxt: "Description",
        icon: Icons.edit,
        keyboardType: TextInputType.emailAddress,
        onSaved: (val) {
          addProductController.newProduct.desc = val;
        },
        onChange: (val) {
          addProductController.newProduct.desc = val;
        },
        validator: (value) {
          if (value.isEmpty) {
            return "Required";
          } else
            return null;
        },
      ),
    );
  }

  InkWell uploadImage() {
    return InkWell(
      onTap: () => addProductController.pickedSingleImage(),
      child: Container(
        width: 40.0.w,
        height: 20.0.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(2.0.w),
        ),
        child: addProductController.productImageFile == null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/image/Icon awesome-cloud-upload-alt.png'),
                  spaceBetween(high: 1.0.h),
                  CustomText(
                    txt: "Upload image ",
                    alignment: Alignment.center,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              )
            : Image.file(
                addProductController.productImageFile!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

