

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:learning_studio/features/auth/presentation/cubits/nav_auth_cubit/cubit/nav_auth_cubit.dart';
import 'package:learning_studio/features/auth/presentation/widgets/widget_spec/auth_widget.dart';
import 'package:learning_studio/shared/extensions/padding_ex.dart';
import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:learning_studio/shared/extensions/widget_ex.dart';
import 'package:learning_studio/shared/widgets/app_scaffold.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';
import 'package:learning_studio/shared/widgets/buttons/buttons.dart';

import '../../../../config/const/app_images.dart';
import '../../../../shared/extensions/theme_contex.dart';
import '../../../../shared/widgets/images/asset_image.dart';
import '../widgets/new_account.dart';
import '../widgets/widget_spec/socail_login_button.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = 'auth';
  static const path = '/auth';
  const AuthScreen({super.key});

// Tracks whether the login or sign-up UI is shown
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        body:BlocBuilder<NavAuthCubit, bool>(
            builder: (context, isLogin) {
       
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      AssetImageWidget(
                        AppImages.imgAuth,
                        fit: BoxFit.fill,
                      ).paddingOnly(top: 4.w),
                      PositionedDirectional(
                        start: 19.w,
                        end: 38.w,
                        top: 10.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextWidget(
                              'welcome_message',
                              style: AppTextStyle.s30W500p,
                            ),
                            6.sizeH,
                            TextWidget(
                              'explain_message',
                              style: AppTextStyle.s17w300h.copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  22.sizeH,
                  // Show login or sign-up widget based on _isLogin
                  isLogin
                      ? AuthWidget(type: AuthWidgetType.login)
                      : AuthWidget(type: AuthWidgetType.signup),
                  30.sizeH,
                  TextWidget(
                    "OR",
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: AppColors.fontColor400),
                  ).center(),
                  36.sizeH,
                  SocialLoginButtons(),
                  72.sizeH,
                  PrimaryBtn(
                    text: "Enter".tr(),
                    styleText: theme.textTheme.titleMedium?.copyWith(
                      color: AppColors.whiteColor,
                    ),
                    onTap: () async {
                      if (isLogin) {
                        // Handle login logic
                      } else {
                        // Handle sign-up logic
                      }
                    },
                  ),
                  10.sizeH,
                  // Toggle between login and sign-up
                  NewAccount(
                    isLogin: isLogin,
                    onTap:  () => context.read<NavAuthCubit>().toggleAuthType(),
                  ),
                  30.sizeH
                ],
              ).paddingHorizontal(20.w)
        );
        })));
        
    
  
  }
}
