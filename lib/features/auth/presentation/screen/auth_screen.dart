import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:learning_studio/features/auth/presentation/widgets/widget_spec/auth_widget.dart';
import 'package:learning_studio/shared/extensions/padding_ex.dart';
import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:learning_studio/shared/extensions/widget_ex.dart';
import 'package:learning_studio/shared/models/user_model.dart';
import 'package:learning_studio/shared/widgets/app_divider_widget.dart';
import 'package:learning_studio/shared/widgets/app_scaffold.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';
import 'package:learning_studio/shared/widgets/buttons/buttons.dart';
import 'package:learning_studio/shared/widgets/modals/modals.dart';

import '../../../../config/const/app_images.dart';
import '../../../../shared/enums/enums.dart';
import '../../../../shared/widgets/images/asset_image.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = 'auth';
  static const path = '/auth';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
             AssetImageWidget(
                AppImages.imgAuth,
              fit: BoxFit.fill,
              )
               .paddingOnly(top: 4.w,),
               PositionedDirectional(
                start: 19.w,
                end: 38.w,
                top: 10.h,
                child: 
               Column(
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
                    style: AppTextStyle.s17w300h.copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.w400),
                  )
                ],
               )
               )
              ],),
           
              22.sizeH,
            AuthWidget(type: AuthWidgetType.login),
            
              30.sizeH,
          
          TextWidget(
            "OR",
            
            style: AppTextStyle.s14W500.copyWith(color: AppColors.fontColor400),
          
          ).center(),
          36.sizeH,
        
                PrimaryBtn(
                    text: 'guest_entry',
                    onTap: () async {
                      const UserModel.guest().saveToSharedPreferences();
                      // context.pushReplacementNamed(HomeScreen.routeName);
                      // context.goNamed(HomeScreen.routeName);},
                    }),
              10.sizeH,
              SecondaryBtn(
                text: 'login',
                onTap: () {
                  AppModals.showBottomSheet(
                    context,
                    child: const AuthWidget(type: AuthWidgetType.login),
                    withBackBtn: true,
                  );
                },
              ),
              12.sizeH,
              const AppDividerWidget(),
              18.sizeH,
              // NewAccount(
              //   onTap: () {
              //     AppModals.showBottomSheet(
              //       context,
              //       child: const AuthSheet(type: AuthSheetType.signup),
              //       withBackBtn: true,
              //     );
              //   },
              // ),
            ],
          ).paddingHorizontal(20.w),
        ),
      ),
    );
  }
}
