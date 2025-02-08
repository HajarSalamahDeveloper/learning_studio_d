import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:learning_studio/shared/extensions/widget_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:learning_studio/config/const/app_images.dart';
import 'package:learning_studio/config/const/app_radius.dart';
import 'package:learning_studio/config/style/app_colors.dart';
import 'package:learning_studio/config/style/text_style.dart';
import 'package:learning_studio/features/auth/presentation/cubits/cubit/otp_cubit.dart';
import 'package:learning_studio/features/auth/presentation/widgets/auth_sheet.dart';
import 'package:learning_studio/shared/widgets/app_divider_widget.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';
import 'package:learning_studio/shared/widgets/buttons/buttons.dart';
import 'package:learning_studio/shared/widgets/count_down_widget.dart';
import 'package:learning_studio/shared/widgets/images/svg_image.dart';
import 'package:learning_studio/shared/widgets/modals/app_toast.dart';
import 'package:learning_studio/shared/widgets/modals/modals.dart';
import 'package:easy_localization/easy_localization.dart' as localization;

class OTPSheet extends StatefulWidget {
  final String phoneNumber;
  final AuthSheetType authSheetType;

  const OTPSheet({
    super.key,
    required this.phoneNumber,
    required this.authSheetType,
  });

  @override
  State<OTPSheet> createState() => _OTPSheetState();
}

class _OTPSheetState extends State<OTPSheet> {
  final controller = TextEditingController();
  final countdownKey = GlobalKey<CountdownTimerState>();
  bool _isOtpInvalid = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      countdownKey.currentState?.startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(context),
          AppDividerWidget(paddingH: 14.h),
          _otpFieldWithCubit(context),
          14.sizeH,
          _countdownWidget(),
          14.sizeH,
          _phoneNumberEdit(context),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      children: [
        // SvgAsset(
        //   AppImages.addProfile,
        //   width: 40.h,
        //   height: 40.h,
        // ),
        // 8.sizeW,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                'otp_verification',
                style: AppTextStyle.s16W400p,
              ),
              TextWidget(
                'otp_instructions',
                style: AppTextStyle.s14W300h,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _otpFieldWithCubit(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpError) {
          setState(() {
            _isOtpInvalid = true;
          });
          AppToast.showErrorSnackBar(
            context: context,
            message: state.exception.message,
          );
        }
        if (state is OtpSuccess) {
          context.pop();
          // context.pushReplacementNamed(HomeScreen.routeName);
        }
      },
      builder: (context, state) {
        return OtpField(
          onCompleted: _validateOtp,
          isOtpInvalid: _isOtpInvalid,
        );
      },
    );
  }

  Widget _countdownWidget() {
    return CountdownTimer(
      key: countdownKey,
      seconds: 120,
     
    );
  }

  Widget _phoneNumberEdit(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: AppBorderRadius.radius12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'edit_phone_instructions'.tr(),
                    style: AppTextStyle.s15W300h,
                  ),
                  TextSpan(
                    text: widget.phoneNumber,
                    style: AppTextStyle.s15W300h
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                    text: 'edit_instruction_part2'.tr(),
                    style: AppTextStyle.s15W300h,
                  ),
                ],
              ),
            ),
          ),
          SecondaryBtn(
            text: 'edit',
            borderRadius: AppBorderRadius.radius8,
            onTap: () {
              context.pop();
              AppModals.showBottomSheet(
                context,
                child: AuthSheet(type: widget.authSheetType),
                withBackBtn: true,
              );
            },
            textStyle: AppTextStyle.pButtonTextStyle.copyWith(
              color: AppColors.primaryColor,
              fontSize: 14.sp,
            ),
          ).sized(w: 52.w, h: 40.h),
        ],
      ),
    );
  }

  void _validateOtp(String otp) {
    OtpCubit.get(context).verify(widget.phoneNumber, otp);
  }
}

class OtpField extends StatefulWidget {
  final Function(String) onCompleted;
  final bool isOtpInvalid;

  const OtpField({
    super.key,
    required this.onCompleted,
    required this.isOtpInvalid,
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  late FocusNode _focusNode;
  @override
  initState() {
    
    super.initState();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        focusNode:_focusNode,
        length: 6,
        controller: TextEditingController(),
        autofocus: true,
        showCursor: false,
        
        keyboardType: TextInputType.phone,
        onCompleted: widget.onCompleted,
        defaultPinTheme: _pinTheme(),
        focusedPinTheme: _pinTheme(),
        followingPinTheme: _pinTheme().copyWith(
          decoration:
              _pinTheme().decoration!.copyWith(color: AppColors.whiteColor),
        ),
        submittedPinTheme: _pinTheme(),
        disabledPinTheme: _pinTheme(),
        pinAnimationType: PinAnimationType.scale,
      ),
    );
  }

  PinTheme _pinTheme() {
    return PinTheme(
      height: 50.h,
      width: 50.w,
      textStyle: const TextStyle(
        color: AppColors.whiteColor,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: AppBorderRadius.radius12,
        border: Border.all(
          color: widget.isOtpInvalid ? AppColors.dangerColor : AppColors.primaryColor,
          width: 1,
        ),
      ),
    );
  }
}
