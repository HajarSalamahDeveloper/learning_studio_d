import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String? hintText, labelText;
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcon;
  final EdgeInsetsGeometry? padding;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final bool autofocus;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool readOnly, enabled;
  final int maxLines;
  final bool alignLabelWithHint;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final TextAlign textAlign;
  final Color? fillColor, borderColor;
  final double borderRadius;
  final TextStyle? textStyle, hintStyle, labelStyle;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? focusedBorder, enabledBorder, disabledBorder;
  final InputDecoration? decoration;

  const AppTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.focusNode,
    this.suffixIcon,
    this.prefixIcon,
    this.padding,
    this.autovalidateMode,
    this.keyboardType,
    this.autofocus = false,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.enabled = true,
    this.alignLabelWithHint = false,
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.fillColor,
    this.borderColor,
    this.borderRadius = 8.0,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.inputFormatters,
    this.focusedBorder,
    this.enabledBorder,
    this.disabledBorder, this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      controller: controller,
      maxLines: maxLines,
      textInputAction: textInputAction,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      autofocus: autofocus,
      inputFormatters: inputFormatters ??
          (keyboardType == TextInputType.number || keyboardType == TextInputType.phone
              ? [FilteringTextInputFormatter.digitsOnly]
              : null),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      validator: validator,
      readOnly: readOnly,
      enabled: enabled,
      maxLength: maxLength,
      style: textStyle ?? const TextStyle(fontSize: 16),
      decoration: decoration??InputDecoration(
        contentPadding: padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        filled: fillColor != null,
        fillColor: fillColor ?? Colors.white,
        border: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor ?? Colors.grey.shade400),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
            
              // borderRadius: BorderRadius.circular(borderRadius),
              // borderSide: BorderSide(color: borderColor ?? Colors.blue, width: 2),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide.none
              // borderRadius: BorderRadius.circular(borderRadius),
              // borderSide: BorderSide(color: borderColor ?? Colors.grey.shade400),
            ),
        disabledBorder: disabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide.none
              // borderRadius: BorderRadius.circular(borderRadius),
              // borderSide: BorderSide(color: Colors.grey.shade300),
            ),
        hintText: hintText,
        hintStyle: hintStyle ?? const TextStyle(color: Colors.grey, fontSize: 14),
        labelText: labelText,
        labelStyle: labelStyle ?? const TextStyle(color: Colors.black),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        alignLabelWithHint: alignLabelWithHint,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }
}


// class AppTextField extends StatefulWidget {
//   final String? hintText, labelText;
//   final TextEditingController? controller;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final EdgeInsetsGeometry? padding;
//   final AutovalidateMode? autovalidateMode;
//   final TextInputType? keyboardType;
//   final bool autofocus;
//   final Function(String val)? onChanged;
//   final Function(String val)? onFieldSubmitted;
//   final FocusNode? focusNode;
//   final String? Function(String? val)? validator;
//   final bool readOnly;
//   final bool enabled;
//   final int maxLines;
//   final bool alignLabelWithHint;
//   final TextInputAction? textInputAction;
//   final int? maxLength;
//   final TextAlign textAlign;
//   final InputDecoration? decoration ;

//   const AppTextField(
//       {super.key,
//       this.hintText,
//       this.labelText,
//       this.controller,
//       this.focusNode,
//       this.suffixIcon,
//       this.prefixIcon,
//       this.padding,
//       this.autovalidateMode,
//       this.keyboardType,
//       this.autofocus = false,
//       this.onChanged,
//       this.validator,
//       this.onFieldSubmitted,
//       this.readOnly = false,
//       this.enabled = true,
//       this.alignLabelWithHint = false,
//       this.textInputAction = TextInputAction.next,
//       this.maxLines = 1,
//       this.textAlign = TextAlign.start,
//       this.maxLength, this.decoration});

//   @override
//   State<AppTextField> createState() => _AppTextFieldState();
// }

// class _AppTextFieldState extends State<AppTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: widget.maxLines > 1 ? null : 50.h,
//           padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 12.w),
//           decoration: BoxDecoration(
//             color: AppColors.textfieldBorderColor,
//             borderRadius: AppBorderRadius.radius8,
//             border: Border.all(color: AppColors.primaryColor),
//           ),
//           child: TextFormField(
//             textAlign: widget.textAlign,
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: widget.hintText?.tr(),
//                 hintStyle: AppTextStyle.s14W300,
//                 labelText: widget.labelText?.tr(),
//                 labelStyle: AppTextStyle.s14W300.copyWith(color: AppColors.primaryColor),
//                 suffixIcon: widget.suffixIcon,
//                 prefixIcon: widget.prefixIcon,
//                 prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
//                 alignLabelWithHint: widget.alignLabelWithHint,
//                 floatingLabelBehavior: FloatingLabelBehavior.auto),
//             controller: widget.controller,
//             maxLines: widget.maxLines,
//             textInputAction: widget.textInputAction,
//             autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
//             keyboardType: widget.keyboardType,
//             autofocus: widget.autofocus,
//             inputFormatters:
//                 (widget.keyboardType == TextInputType.number || widget.keyboardType == TextInputType.phone) ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))] : null,
//             onChanged: widget.onChanged,
//             onFieldSubmitted: widget.onFieldSubmitted,
//             focusNode: widget.focusNode,
//             validator: widget.validator,
//             readOnly: widget.readOnly,
//             enabled: widget.enabled,
//             maxLength: widget.maxLength,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class PhoneInputField extends StatelessWidget {
//   final String countryCode;
//   final String hintText;
//   final TextEditingController controller;
//   final VoidCallback? onCountryCodeTap;

//   const PhoneInputField({
//     super.key,
//     required this.countryCode,
//     required this.hintText,
//     required this.controller,
//     this.onCountryCodeTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12), // Rounded corners
//       ),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: onCountryCodeTap,
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.white, // White background for country code
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(
//                 countryCode,
//                 style: TextStyle(
//                   color: Colors.grey[600], // Color of country code text
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 16), // Spacing between code and input
//           Expanded(
//             child: TextField(
//               controller: controller,
//               textAlign: TextAlign.end, // Align text to the end (right side)
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 border: InputBorder.none, // No underline border
//                 hintStyle: TextStyle(
//                   color: Colors.grey[400], // Color for hint text
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
