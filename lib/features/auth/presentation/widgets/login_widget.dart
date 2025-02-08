import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:learning_studio/features/auth/presentation/widgets/text_field_auth.dart';
import 'package:learning_studio/shared/widgets/app_text_field.dart';

import '../../../../config/style/app_colors.dart';
import '../../../../core/di/locator.dart';
import '../cubits/login/login_cubit.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
    final cubit = sl<LoginCubit>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         BuildAuthTextFormField(
          controller: cubit.fullName,
          label: "full_name".tr(),

          hintText  : "full_name".tr(),     
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          
      decoration  : InputDecoration( labelText: "full_name".tr(),
          labelStyle: Theme.of(context).textTheme.labelLarge,
          filled: false,
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grayBorderColor)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grayBorderColor)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grayBorderColor)),
      ),
        
          
       
          validator: (val) {
            if (val!.isEmpty) {
              return 'field_required'.tr();
            }
            return null;
          },
         )
    
    
      ]);
  }
}