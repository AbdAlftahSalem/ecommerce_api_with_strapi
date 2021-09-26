import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintTxt;
  final String? label;
  final String? helperText;
  final IconData? icon;
  final Function? onSaved;
  final Function? validator;
  final Function? onChange;
  final Function? onPressedIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final bool? obscureText;
  final int? minLines;
  final int? maxLines;

  CustomTextFormField({
    this.hintTxt,
    this.onSaved,
    this.validator,
    this.icon,
    this.onPressedIcon,
    this.keyboardType,
    this.label,
    this.controller,
    this.onChange,
    this.fontSize = 16,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w600,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.helperText = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (val) => onSaved!(val),
      validator: (val) => validator!(val),
      controller: controller,
      onChanged: (val) => onChange!(val),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintTxt,
        helperText: helperText,
        helperStyle: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
          color: Color(0xFF929292),
        ),
        labelStyle: TextStyle(
            fontSize: fontSize, color: color, fontWeight: fontWeight),
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
            icon: Icon(icon), onPressed: () => onPressedIcon!()),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText!,
    );
  }
}
