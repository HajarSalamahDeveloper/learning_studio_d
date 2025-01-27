import 'package:learning_studio/shared/extensions/padding_ex.dart';
import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:learning_studio/features/auth/presentation/widgets/auth_sheet.dart';
import 'package:learning_studio/features/auth/presentation/widgets/new_account.dart';
import 'package:learning_studio/shared/models/user_model.dart';
import 'package:learning_studio/shared/widgets/app_divider_widget.dart';
import 'package:learning_studio/shared/widgets/app_scaffold.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';
import 'package:learning_studio/shared/widgets/buttons/buttons.dart';
import 'package:learning_studio/shared/widgets/modals/modals.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            14.sizeH,
            Row(
              children: [
                if (context.canPop()) ...[const BackBtn(), 10.sizeW],
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      'welcome_message',
                      style: AppTextStyle.s16W400.copyWith(color: AppColors.greyColor),
                    ),
                    TextWidget(
                      'official_story',
                      style: AppTextStyle.s13W300.copyWith(color: AppColors.greyColor),
                    ),
                  ],
                ),
              ],
            ),
            28.sizeH,
            if (!context.canPop())
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
                  child: const AuthSheet(type: AuthSheetType.login),
                  withBackBtn: true,
                );
              },
            ),
            12.sizeH,
            const AppDividerWidget(),
            18.sizeH,
            NewAccount(
              onTap: () {
                AppModals.showBottomSheet(
                  context,
                  child: const AuthSheet(type: AuthSheetType.signup),
                  withBackBtn: true,
                );
              },
            ),
          ],
        ).paddingHorizontal(16.w),
      ),
    );
  }
}
