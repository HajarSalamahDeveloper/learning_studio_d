import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:flutter/material.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:learning_studio/shared/extensions/theme_contex.dart';
 import 'package:learning_studio/shared/widgets/app_txt_widget.dart';

class NewAccount extends StatelessWidget {
  final VoidCallback? onTap;
  final String? promptText;  
  final String? actionText; 
  final TextStyle? promptStyle; 
  final TextStyle? actionStyle;
   final bool isLogin;

  const NewAccount({
    super.key,
    this.onTap,
    this.promptText,
    this.actionText,
    this.promptStyle,
    this.actionStyle, required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          isLogin ?  promptText ?? "dont_have_account" :  promptText ??  "already_have_account",
          style:  theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.fontColor400,)
        ),
        5.sizeW,
        InkWell(
          onTap: onTap,
          child: TextWidget(
            isLogin ?   actionText ?? "create_account" :   actionText ?? "sign_in",
            style: actionStyle ??
            theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.scondaryColor,
           
            )
                // AppTextStyle.s16W400p.copyWith(
                //   color: AppColors.scondaryColor,
                //   decoration: TextDecoration.underline,
                // ),
          ),
        ),
      ],
    );
  }
}