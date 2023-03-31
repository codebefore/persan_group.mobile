import 'package:flutter/material.dart';
import 'package:persangroup_mobile/core/constant/text_styles.dart';

class BaseText extends StatelessWidget {
  const BaseText(
    String this.text, {
    this.style,
    this.textColor,
    this.textAlign,
    this.overflow,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  final String? text;
  final TextStyle? style;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    TextStyle currentTextStyles = style ?? themeTitleSmall(context);

    if (textColor != null) {
      TextStyle newTextStyles = TextStyle(color: textColor);
      currentTextStyles = currentTextStyles.merge(newTextStyles);
    }
    return Text(
      text ?? '',
      style: currentTextStyles,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
