import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:learning_studio/features/auth/presentation/widgets/login_sheet.dart';
import 'package:learning_studio/features/auth/presentation/widgets/signup_sheet.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';

enum AuthSheetType { login, signup }

class AuthSheet extends StatefulWidget {
  final AuthSheetType type;
  const AuthSheet({super.key, required this.type});

  @override
  State<AuthSheet> createState() => _AuthSheetState();
}

class _AuthSheetState extends State<AuthSheet> with TickerProviderStateMixin {
  late AuthSheetType type;

  @override
  void initState() {
    super.initState();
    type = widget.type;
  }

  @override
  void didUpdateWidget(covariant AuthSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (type != widget.type) {
      setState(() {
        type = widget.type;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.fastLinearToSlowEaseIn,
          height: type == AuthSheetType.login ? 220.h : null,
          child: type == AuthSheetType.login ? const LoginSheet() : const SignupSheet(),
        ),
        const Divider(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              type == AuthSheetType.login ? 'no_account' : 'has_account',
              style: AppTextStyle.s14W300,
            ),
            5.sizeW,
            GestureDetector(
              onTap: () {
                setState(() {
                  type == AuthSheetType.login ? type = AuthSheetType.signup : type = AuthSheetType.login;
                });
              },
              child: TextWidget(
                type == AuthSheetType.login ? 'create_account' : 'login',
                style: AppTextStyle.s16W400p.copyWith(
                  color: AppColors.tertiaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
