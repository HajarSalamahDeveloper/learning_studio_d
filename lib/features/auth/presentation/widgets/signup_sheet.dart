import 'package:app_skeleton/shared/extensions/size_ex.dart';
import 'package:app_skeleton/shared/extensions/string_ex.dart';
import 'package:app_skeleton/shared/extensions/widget_ex.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:app_skeleton/config/const/app_images.dart';
import 'package:app_skeleton/config/const/app_radius.dart';
import 'package:app_skeleton/config/style/app_colors.dart';
import 'package:app_skeleton/config/style/text_style.dart';
import 'package:app_skeleton/features/auth/data/models/sign_up_model.dart';
import 'package:app_skeleton/features/auth/presentation/cubits/signup/signin_cubit.dart';
import 'package:app_skeleton/features/auth/presentation/widgets/auth_sheet.dart';
import 'package:app_skeleton/features/auth/presentation/widgets/otp_sheet.dart';
import 'package:app_skeleton/shared/enums/enums.dart';
import 'package:app_skeleton/shared/widgets/app_divider_widget.dart';
import 'package:app_skeleton/shared/widgets/app_text_field.dart';
import 'package:app_skeleton/shared/widgets/app_txt_widget.dart';
import 'package:app_skeleton/shared/widgets/buttons/buttons.dart';
import 'package:app_skeleton/shared/widgets/countrycode_textfield_prefix.dart';
import 'package:app_skeleton/shared/widgets/images/svg_image.dart';
import 'package:app_skeleton/shared/widgets/modals/app_toast.dart';
import 'package:app_skeleton/shared/widgets/modals/modals.dart';

// enum AccountType { individual, company }

class SignupSheet extends StatefulWidget {
  const SignupSheet({super.key});

  @override
  State<SignupSheet> createState() => _SignupSheetState();
}

class _SignupSheetState extends State<SignupSheet> {
  late ButtonBarModel<UserType> selectedItem;
  List<ButtonBarModel<UserType>> items = [
    const ButtonBarModel(id: UserType.personnel, name: 'individual'),
    const ButtonBarModel(id: UserType.organizations, name: 'companies'),
  ];
  @override
  void initState() {
    super.initState();
    selectedItem = items.first;
  }

  SignUpModel data = SignUpModel.empty;
  TextEditingController phoneCTR = TextEditingController();
  TextEditingController nameCRT = TextEditingController();
  TextEditingController orgCTR = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(children: [
                SvgAsset(
                  AppImages.addProfile,
                  width: 40.h,
                  height: 40.h,
                ),
                8.sizeW,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget('create_account_action', style: AppTextStyle.s16W400p),
                      TextWidget('register_your_account_now', style: AppTextStyle.s14W300h),
                    ],
                  ),
                ),
              ]),
              AppDividerWidget(paddingH: 8.h),
              ButtonBarWidget(
                      onChanged: (value) {
                        selectedItem = value as ButtonBarModel<UserType>;
                        setState(() {});
                      },
                      items: items,
                      value: selectedItem)
                  .sized(w: double.infinity),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: selectedItem.id == UserType.organizations ? 200.h : 150.h,
                child: SingleChildScrollView(
                  child: Column(children: [
                    14.sizeH,
                    if (selectedItem.id == UserType.organizations)
                      AppTextField(
                        labelText: 'Organization_or_Company_Name',
                        controller: orgCTR,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Organization_or_company_name_is_required'.tr();
                          }
                          return null;
                        },
                      ),
                    10.sizeH,
                    AppTextField(
                      labelText: 'full_name',
                      controller: nameCRT,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'name_required'.tr();
                        }
                        return null;
                      },
                    ),
                    10.sizeH,
                     AppTextField(
                      controller: phoneCTR,
                      prefixIcon: const CountryCodeTextFieldPrefix(),
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'phone_required'.tr();
                        }
                        if (val.length != 9) {
                          return 'phone_digits'.tr();
                        }
                        if (!val.startsWithValidCallablePhonePrefix()) {
                          return 'invalid_phone'.tr();
                        }

                        return null;
                      },
                      hintText: 'phone_number',
                    ),
                    14.sizeH,
                  ]),
                ),
              ),
              Container(
                // width: double.infinity,
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(color: AppColors.containerColor, borderRadius: AppBorderRadius.radius12),
                child: FittedBox(
                  child: TextWidget(
                    "service_notice",
                    style: AppTextStyle.s15W300h,
                  ),
                ),
              ),
              14.sizeH,
              BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {
                  if (state is SignupError) {
                    AppToast.showErrorSnackBar(message: state.exception.message,context: context);
                  }
                  if (state is SignupSuccess) {
                    context.pop();
                    AppModals.showBottomSheet(context,
                        child: OTPSheet(
                          phoneNumber: phoneCTR.text,
                          authSheetType: AuthSheetType.signup,
                        ));
                  }
                },
                builder: (context, state) {
                  return PrimaryBtn(
                    text: 'create_account_action',
                    disabled: state is SignupLoading,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        data = data.copyWith(
                          userName: nameCRT.text,
                          phone: phoneCTR.text,
                          organizationName: orgCTR.text.isEmptyOrNull ? null : orgCTR.text,
                          type: selectedItem.id,
                        );
                        SignupCubit.get(context).signup(data);
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
