import 'package:learning_studio/shared/extensions/context_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:learning_studio/shared/widgets/blur_widget.dart';

class AppBottomsheet extends StatefulWidget {
  const AppBottomsheet({
    super.key,
    required this.child,
    this.height,
    this.bottomPadding = 0,
    this.borderRadius,
    this.withBlur = true,
     this.withScrollview=true,
  });
  final Widget child;
  final double? height;
  final double? bottomPadding;
  final BorderRadiusGeometry? borderRadius;
  final bool withBlur;
  final bool withScrollview;

  @override
  State<AppBottomsheet> createState() => _AppBottomsheetState();
}

class _AppBottomsheetState extends State<AppBottomsheet> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.keyboardBottomPadding),
      child: widget.withBlur
          ? BlurWidget(
              child: _child(widget.withScrollview),
            )
          : _child(widget.withScrollview),
    );
  }

  Container _child([bool withscrollview=true]) {
    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(right: 10.w, left: 10.w, bottom: widget.bottomPadding ?? 0),
      width: double.infinity,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ?? BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        color: Colors.white,
      ),
      child:withscrollview? SingleChildScrollView(child: widget.child):widget.child,
    );
  }
}
