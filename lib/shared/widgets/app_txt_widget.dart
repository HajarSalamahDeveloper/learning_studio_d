import 'package:easy_localization/easy_localization.dart'as t;
import 'package:flutter/widgets.dart';

 
class TextWidget extends StatelessWidget {
  final String? text;

  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final int? maxLines;
  final TextOverflow? overflow;
  final Map<String, String>? namedArgs;

  final bool withLocale;
  const TextWidget(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.textDirection,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.withLocale = true,
    this.namedArgs,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
     withLocale? (text ?? "").tr(namedArgs: namedArgs,context: context):text??'',
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: true, 
    );
  }
}
