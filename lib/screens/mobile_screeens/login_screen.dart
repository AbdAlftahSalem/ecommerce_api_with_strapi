import 'package:ecommerce_api/const.dart';
import 'package:ecommerce_api/controllers/auth_controller.dart';
import 'package:ecommerce_api/screens/widget/custem_text.dart';
import 'package:ecommerce_api/screens/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  AuthController authController = Get.find();
  GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKeyLogin,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spaceBetween(high: 10.0.h),
                  Text(
                    'Woo commerce',
                    style: GoogleFonts.coveredByYourGrace(
                      textStyle: TextStyle(color: primaryColor, fontSize: 22.0.sp),
                    ),
                  ),
                  spaceBetween(high: 1.0.h),
                  CustomText(
                    txt: "Sign in to access commerce",
                    color: Colors.grey,
                  ),
                  spaceBetween(high: 13.0.h),
                  CustomText(
                    txt: "Phone Number",
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                  spaceBetween(high: 1.5.h),
                  emailFormField(),
                  CustomText(
                    txt: "Password",
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                  spaceBetween(high: 1.5.h),
                  passwordFormField(),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {},
                        value: true,
                        checkColor:
                            Theme.of(context).textTheme.bodyText1!.color,
                        activeColor: primaryColor,
                      ),
                      CustomText(
                        txt: 'Remember me',
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ],
                  ),
                  spaceBetween(high: 1.0.h),
                  Center(
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            txt: "Sign in",
                            alignment: Alignment.center,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          authController.loading ? Spacer() : CustomText(),
                          authController.loading
                              ? CupertinoActivityIndicator()
                              : CustomText(),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        fixedSize: Size(80.0.w, 6.0.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0.w),
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
                  spaceBetween(high: 15.0.h),
                  CustomText(
                    txt: "Don’t have account ? sign up",
                    alignment: Alignment.center,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget emailFormField() {
    return CustomTextFormField(
      color: Colors.black,
      hintTxt: "Email",
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
      controller: TextEditingController(text: "abd321alfta@gmail.com"),
    );
  }

  Widget passwordFormField() {
    return CustomTextFormField(
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
    );
  }
}
