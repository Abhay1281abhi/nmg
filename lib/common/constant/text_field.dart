import 'package:nmg/common/constant/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_constants.dart';

class CustomTextField extends StatelessWidget {
  TextInputType keyboardType;
  String? labelText;
  String? errorText;
  String? headingText;
  bool? isMandetry;
  Color? fillColor;
  Color? cursorColor;
  String? Function(String?)? validator;
  Color? colors;
  Color? borderColor;
  Color? color;
  bool? enable;
  Widget? prefix;
  Widget? suffix;
  Widget? prefixIcon;
  int? maxLines;
  int? maxLength;
  bool? obscureText;
  void Function()? onTap;
  bool?notHeading;
  TextCapitalization? textCapitalization;
  List<TextInputFormatter>? inputFormatters;

  //String Function(String) validator;
  TextEditingController controller = TextEditingController();
  void Function(String)? onSaved;
  void Function(String)? onChanged;

  CustomTextField({
    this.obscureText,
    this.validator,
    this.textCapitalization,
    // required this.validator,
    this.prefix,
    this.notHeading,
    this.borderColor,
    this.suffix,
    this.cursorColor,
    this.errorText,
    this.enable = true,
    this.onTap,
    this.inputFormatters,
    this.fillColor,
    required this.controller,
    this.labelText,
    this.maxLines,
    this.prefixIcon,
    this.colors,
    this.color,
    this.onSaved,
    this.headingText,
    this.onChanged,
    this.keyboardType = TextInputType.multiline,
    this.maxLength});
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      notHeading == true?Container():  Text(headingText??"",style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
          color: ColorConstants.whiteColor,
        )).addPadding(EdgeInsets.symmetric(horizontal: 10.w)),
        TextFormField(
          textInputAction: TextInputAction.newline,
          inputFormatters: inputFormatters,
          maxLength: maxLength ?? 100,
          cursorColor: cursorColor ?? ColorConstants.whiteColor,
          cursorWidth: 1,
          onChanged: onChanged,
          obscureText: obscureText ?? false,
          maxLines: maxLines,
          enabled: enable,
          keyboardType: keyboardType,
          controller: controller,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          //  onSaved: onSaved,
          style:TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
            color: ColorConstants.whiteColor,
          ),
          validator: validator,
          decoration: InputDecoration(
            counterText: "",
            // alignLabelWithHint: true,
            prefix: prefix,
            suffixIcon: suffix,
            prefixIcon: prefixIcon,
            fillColor: fillColor,
            filled: true,
            errorText: errorText,
            hintText: labelText,
            labelStyle:TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
              color: ColorConstants.whiteColor,
            ),
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
              color: ColorConstants.whiteColor,
            ),
            errorStyle:  TextStyle(
              fontSize: 9.sp,
              color: Colors.redAccent,
            ),
            enabledBorder:   UnderlineInputBorder(
              borderSide: BorderSide(color:borderColor??  ColorConstants.greyColor),
            ),
            focusedBorder:   UnderlineInputBorder(
              borderSide: BorderSide(color:borderColor??  ColorConstants.lightBlue),
            ),
            errorBorder:   UnderlineInputBorder(
              borderSide: BorderSide(color:borderColor??  Colors.redAccent),
            ),
            disabledBorder:   UnderlineInputBorder(
              borderSide: BorderSide(color:borderColor??  ColorConstants.greyColor),
            ),
            focusedErrorBorder:   UnderlineInputBorder(
              borderSide: BorderSide(color:borderColor?? ColorConstants.greyColor)
            ),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
