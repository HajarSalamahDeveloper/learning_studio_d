import 'package:flutter/material.dart';
import 'package:learning_studio/features/auth/presentation/widgets/widget_spec/login_widget.dart';
import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:learning_studio/shared/extensions/widget_ex.dart';

import '../../../../../config/style/app_colors.dart';
import '../../../../../config/style/text_style.dart';
import '../../../../../shared/widgets/app_text_field.dart';
import '../../../../../shared/widgets/app_txt_widget.dart';
enum AuthWidgetType { login, signup }
class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key, required this.type});
final AuthWidgetType type;
  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
   late AuthWidgetType type;

  @override
  void initState() {
    super.initState();
    type = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
   TextWidget(
                   type == AuthWidgetType.login ? 'signIn':   'create_account',
                      style: AppTextStyle.s20W600p.copyWith(color: AppColors.headLineColor),
                    ).center(),
                    32.sizeH,
               Container(
          // duration: const Duration(seconds: 2),
          // curve: Curves.fastLinearToSlowEaseIn,
            child: type == AuthWidgetType.login ? const LoginWidget() : const LoginWidget(),
        ),
                    
    ],);
  }
}