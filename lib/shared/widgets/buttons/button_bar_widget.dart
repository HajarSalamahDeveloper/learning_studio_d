import 'package:animate_do/animate_do.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_skeleton/config/const/app_radius.dart';
import 'package:app_skeleton/config/localizaion/localization_service.dart';
import 'package:app_skeleton/config/style/app_colors.dart';
import 'package:app_skeleton/core/di/locator.dart';

import '../../../config/style/text_style.dart';
import '../app_txt_widget.dart';

class ButtonBarWidget extends StatefulWidget {
  const ButtonBarWidget({super.key, required this.onChanged, required this.items, required this.value, this.selectedTextStyle, this.bgColor, this.unselectedTextStyle,this.enabled = true});

  final ValueChanged<ButtonBarModel>? onChanged;
  final List<ButtonBarModel> items;
  final ButtonBarModel? value;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final Color? bgColor;
  final bool enabled ;
  @override
  State<ButtonBarWidget> createState() => _ButtonBarWidgetState();
}

class _ButtonBarWidgetState extends State<ButtonBarWidget> {
  ButtonBarModel? _model;
  int? _previousIndex = 0;

  @override
  void initState() {
    // Initialize `_model` with `widget.value` if it's not null
    _model = widget.value;

    // Only set `_previousIndex` if `_model` is not null
    if (_model != null) {
      _previousIndex = widget.items.indexOf(_model!);
    } else {
      _previousIndex = null; // or set a safe default like `0`
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: widget.bgColor ?? AppColors.buttonBarBackgroundColor,
        borderRadius: AppBorderRadius.radius12,
      ),
      child: Row(
        children: [
          for (var index = 0; index < widget.items.length; ++index) ...[
            _buildButton(index),
          ],
        ],
      ),
    );
  }

  Expanded _buildButton(int index) {
    final model = widget.items[index];
    final isSelected = _model?.id == model.id;
    final previousIndex = _previousIndex;

    return Expanded(
      child: Builder(
        builder: (context) {
          final buttonContent = InkWell(
            onTap: widget.enabled? () {
              setState(() {
                // _previousIndex = widget.items.indexOf(_model!);
                _model = model;
              });
              widget.onChanged?.call(model);
            }:(){
               widget.onChanged?.call(model);
            },
            child: Container(
              height: 40.h,
              alignment: Alignment.center,
              margin: EdgeInsetsDirectional.symmetric(vertical: 5.h),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : widget.bgColor ?? AppColors.buttonBarBackgroundColor,
                borderRadius: AppBorderRadius.radius10,
              ),
              child: TextWidget(
                model.name,
                style: isSelected
                    ? widget.selectedTextStyle ?? AppTextStyle.s16W300.copyWith(color: AppColors.whiteColor)
                    : widget.unselectedTextStyle ?? AppTextStyle.s16W300.copyWith(color: AppColors.primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
          );

          // Determine the animation direction based on the index comparison
          if (isSelected && previousIndex != null) {
            if (sl<LocalizationService>().isRTL) {
              return (index > previousIndex)
                  ? SlideInRight(
                      duration: const Duration(milliseconds: 300),
                      key: ValueKey(_model),
                      child: buttonContent,
                    )
                  : SlideInLeft(
                      duration: const Duration(milliseconds: 300),
                      key: ValueKey(_model),
                      child: buttonContent,
                    );
            } else {
              return (index > previousIndex)
                  ? SlideInLeft(
                      duration: const Duration(milliseconds: 300),
                      key: ValueKey(_model),
                      child: buttonContent,
                    )
                  : SlideInRight(
                      duration: const Duration(milliseconds: 300),
                      key: ValueKey(_model),
                      child: buttonContent,
                    );
            }
          }

          return buttonContent;
        },
      ),
    );
  }
}

class ButtonBarModel<T> extends Equatable {
  final T id;
  final String name;

  const ButtonBarModel({
    required this.id,
    required this.name,
  });

  factory ButtonBarModel.fromJson(Map<String, dynamic> json) {
    return ButtonBarModel(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
