import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 11.0.h),
      child: AppTextField(
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
          hintStyle: ,
          labelStyle: Theme.of(context).textTheme.labelLarge,
          filled: false,
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grayBorderColor)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grayBorderColor)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grayBorderColor)),
              
        ),
        validator:validator ,
      ),
    );
  }
}
