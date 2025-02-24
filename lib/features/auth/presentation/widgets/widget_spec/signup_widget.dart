import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:learning_studio/features/auth/presentation/widgets/text_field_auth.dart';

import '../../../../../core/di/locator.dart';
import '../../cubits/signup/signin_cubit.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
    final cubit = sl<SignupCubit>();
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
          isEmail : false,
          isPhone : false,
          textInputAction: TextInputAction.next,
          validator: (val) {
            if (val!.isEmpty) {
              return 'field_required'.tr();
            }
            return null;
          },
         ), 
          BuildAuthTextFormField(
          controller: cubit.email,
          label: "email".tr(),
          hintText  : "email".tr(),     
          isEmail : true,
          isPhone : false,
          textInputAction: TextInputAction.next,
          validator: (val) {
            if (val!.isEmpty) {
              return 'field_required'.tr();
            }
            return null;
          },
         ),
          BuildAuthTextFormField(
          controller: cubit.password,
          label: "password".tr(),
          hintText  : "password".tr(),     
          isEmail : false,
          isPhone : false,
          textInputAction: TextInputAction.next,
          validator: (val) {
            if (val!.isEmpty) {
              return 'field_required'.tr();
            }
            return null;
          },
         )
    ,
      BuildAuthTextFormField(
          controller: cubit.confirmPassword,
          label: "confirm_password".tr(),
          hintText  : "confirm_password".tr(),     
          isEmail : false,
          isPhone : false,
          textInputAction: TextInputAction.done,
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