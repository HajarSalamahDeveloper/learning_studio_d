import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:learning_studio/shared/extensions/string_ex.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_studio/config/const/app_images.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:learning_studio/core/di/locator.dart';
import 'package:learning_studio/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:learning_studio/features/auth/presentation/widgets/auth_sheet.dart';
import 'package:learning_studio/features/auth/presentation/widgets/otp_sheet.dart';
 import 'package:learning_studio/shared/widgets/app_divider_widget.dart';
import 'package:learning_studio/shared/widgets/app_text_field.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';
import 'package:learning_studio/shared/widgets/buttons/buttons.dart';
import 'package:learning_studio/shared/widgets/countrycode_textfield_prefix.dart';
import 'package:learning_studio/shared/widgets/modals/app_toast.dart';
import 'package:learning_studio/shared/widgets/modals/modals.dart';

class LoginSheet extends StatefulWidget {
  const LoginSheet({super.key});

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  final cubit = sl<LoginCubit>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ImageBtn(
                width: 39.h,
                height: 34.h,
                // image: AppImages.profile,
                color: AppColors.primaryColor,
                size: 25.sp,
                onTap: () {
                  context.pop();
                },
              ),
              8.sizeW,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget('login', style: AppTextStyle.s16W400p),
                    TextWidget('welcome_back_message', style: AppTextStyle.s14W300h),
                  ],
                ),
              ),
            ],
          ),
          AppDividerWidget(paddingH: 14.h),
          AppTextField(
            prefixIcon: const CountryCodeTextFieldPrefix(),
            keyboardType: TextInputType.number,
            hintText: 'phone_number',
            controller: cubit.phoneCTR,
            onChanged: (p0) {
              setState(() {});
            },
            validator: (val) {
              if (val!.isEmpty) {
                return 'phone_required'.tr();
              }
              if (val.length != 9) {
                return 'phone_length'.tr();
              }
              if (!val.startsWithValidCallablePhonePrefix()) {
                return 'phone_invalid'.tr();
              }
              return null;
            },
          ),
          14.sizeH,
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginError) {
                AppToast.showErrorSnackBar(message: state.exception.message, context: context);
              }
              if (state is LoginSuccess) {
                context.pop();
                AppModals.showBottomSheet(
                  context,
                  child: OTPSheet(
                    phoneNumber: cubit.phoneCTR.text,
                    authSheetType: AuthSheetType.login,
                  ),
                );
              }
            },
            builder: (context, state) {
              return PrimaryBtn(
                disabled: cubit.phoneCTR.text.isEmpty || state is LoginLoading,
                text: 'login',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    LoginCubit.get(context).login(cubit.phoneCTR.text);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}