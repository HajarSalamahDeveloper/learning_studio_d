import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/shared/extensions/padding_ex.dart';
import 'package:learning_studio/shared/widgets/app_text_field.dart';

import '../../../../config/style/app_colors.dart';

class BuildAuthTextFormField extends StatelessWidget {
  const BuildAuthTextFormField({
    super.key, required this.label, required this.controller,  
    this.isEmail=false,  this.isPhone=false, this.textInputAction, this.onChanged, this.validator, this.hintText,

  });

  final String label;
  final String? hintText;
    final TextEditingController controller;
   final bool isEmail ;
   final bool isPhone;
      final TextInputAction? textInputAction;
       final ValueChanged<String>? onChanged;
      final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      textInputAction: textInputAction,
      onChanged: onChanged,
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : isPhone
              ? TextInputType.phone
              : TextInputType.text, 
     
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.grayBorderColor,
        ),
        labelStyle:  Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.grayBorderColor,
        ),
        filled: false,
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayBorderColor)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayBorderColor)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayBorderColor)),
            
      ),
      validator:validator ,
    ).paddingOnly(top: 22.0.h);
  }
}
