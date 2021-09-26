import 'package:flutter/material.dart';

import 'custem_text.dart';

class CustomButton extends StatelessWidget {

  final String? txt;
  final Color? colorButton;
  final Color? colorTxt;
  final Function? onPressed;
  final Alignment? alignment;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final double? high;
  final double? borderRadius;


  CustomButton({
    this.txt="",
    this.colorButton=Colors.white,
    this.colorTxt=Colors.white,
    this.onPressed,
    this.alignment=Alignment.center,
    this.fontWeight=FontWeight.w400,
    this.fontSize=16,
    this.width,
    this.high,
    this.borderRadius=20,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: high,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        onPressed:(){
          onPressed!();
        },
        child: CustomText(
          color: colorTxt,
          txt: txt,
          alignment: alignment,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        color: colorButton,
      ),
    );
  }
}
