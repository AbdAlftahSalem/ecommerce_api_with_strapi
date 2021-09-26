import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserWindowsScreen extends StatelessWidget {
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(0xFFFAF7FF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 1.0.h),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: 40.0.w,
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
                child: ListView.builder(
                  itemCount: authController.allUser.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return orderCard(
                      imageUser: authController.allUser[index].profilePic,
                      userName: authController.allUser[index].username,
                      emailUser: authController.allUser[index].email,
                      idUser: authController.allUser[index].id,
                      phoneUser: authController.allUser[index].phone,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderCard(
      {String? imageUser,
      emailUser,
      userName,
      idUser,
      phoneUser,
      profileCompleted}) {
    return Container(
      margin: EdgeInsets.all(1.0.w),
      decoration: BoxDecoration(
        color: Color(0xFFE3E0F3),
        borderRadius: BorderRadius.circular(2.0.w),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 2.0.w, right: 2.0.w, top: 0.5.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0.w),
              child: Image.network(
                "$URL${imageUser!}",
                width: 5.0.w,
                height: 3.0.h,
              ),
            ),
            CustomText(
              txt: idUser.toString(),
              alignment: Alignment.center,
            ),
            CustomText(
              txt: userName.toString(),
            ),
            CustomText(
              txt: emailUser.toString(),
              color: Colors.green,
              alignment: Alignment.center,
            ),
            CustomText(
              txt: phoneUser.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
