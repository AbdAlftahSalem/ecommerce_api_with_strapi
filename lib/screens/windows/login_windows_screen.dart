
import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginWindowsScreen extends StatelessWidget {
  AuthController authController = Get.find();
  GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Scaffold(
            body: Form(
              key: _formKeyLogin,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Image.asset(
                        'assets/image/Secure login-bro.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: primaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 23.0.w),
                            child: CustomText(
                              txt: "Login with your admin email ..",
                              color: Colors.white,
                            ),
                          ),
                          spaceBetween(high: 2.0.h),
                          emailFormField(),
                          passwordFormField(),
                          SizedBox(
                            width: 20.0.w,
                            height: 2.0.h,
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    txt: "Login",
                                    alignment: Alignment.center,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  authController.loading ? Spacer() : CustomText(),
                                  authController.loading
                                      ? CupertinoActivityIndicator()
                                      : CustomText(),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                fixedSize: Size(80.0.w, 6.0.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.0.w),
                                ),
                              ),
                              onPressed: () async {
                                _formKeyLogin.currentState!.save();
                                if (_formKeyLogin.currentState!.validate()) {
                                  await authController.signInUser();
                                }
                              },
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
        });
  }

  Widget emailFormField() {
    return SizedBox(
      width: 50.0.w,
      child: CustomTextFormField(
        color: Colors.black,
        hintTxt: "E_mail",
        icon: Icons.email,
        keyboardType: TextInputType.emailAddress,
        onSaved: (val) {
          authController.newUser.email = val;
        },
        onChange: (val) {
          authController.newUser.email = val;
        },
        validator: (value) {
          if (value.isEmpty) {
            return "Required";
          } else
            return null;
        },
        controller: TextEditingController(text: "abd321alftah@gmail.com"),
      ),
    );
  }

  Widget passwordFormField() {
    return SizedBox(
      width: 50.0.w,
      child: CustomTextFormField(
        color: Colors.black,
        hintTxt: "password",
        icon: Icons.visibility_off,
        keyboardType: TextInputType.visiblePassword,
        onSaved: (val) {
          authController.password = val;
        },
        onChange: (val) {
          authController.password = val;
        },
        validator: (value) {
          if (value.isEmpty) {
            return "Required";
          } else
            return null;
        },
        helperText: '',
        controller: TextEditingController(text: "123456789"),
      ),
    );
  }
}
