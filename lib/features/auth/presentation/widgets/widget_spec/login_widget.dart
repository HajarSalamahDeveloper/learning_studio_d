import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:learning_studio/features/auth/presentation/widgets/text_field_auth.dart';

import '../../../../../core/di/locator.dart';
import '../../cubits/login/login_cubit.dart';

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
          textInputAction: TextInputAction.done,
          validator: (val) {
            if (val!.isEmpty) {
              return 'field_required'.tr();
            }
            return null;
          },
         )
    ,
     
    
      ]);
  }
}