import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:flutter/material.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/config/style/text_style.dart';
 import 'package:learning_studio/shared/widgets/app_txt_widget.dart';

class NewAccount extends StatelessWidget {
  final VoidCallback? onTap;
  final String? promptText;  
  final String? actionText; 
  final TextStyle? promptStyle; 
  final TextStyle? actionStyle;

  const NewAccount({
    super.key,
    this.onTap,
    this.promptText,
    this.actionText,
    this.promptStyle,
    this.actionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          promptText ?? 'dont_have_account',
          style: promptStyle ?? AppTextStyle.s14W300,
        ),
        5.sizeW,
        InkWell(
          onTap: onTap,
          child: TextWidget(
            actionText ?? 'create_account',
            style: actionStyle ??
                AppTextStyle.s16W400p.copyWith(
                  color: AppColors.tertiaryColor,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ],
    );
  }
}