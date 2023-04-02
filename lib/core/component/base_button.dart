import 'package:flutter/material.dart';
import 'package:persangroup_mobile/core/constant/text_styles.dart';

import '../constant/size_config.dart';
import '../constant/theme_options.dart';
import 'base_text.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.bgColor,
    this.textColor,
    this.isInScrollView,
    this.style,
    this.border,
  }) : super(key: key);
  final Color? bgColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final String text;
  final Function onTap;
  final bool? isInScrollView;
  final BoxBorder? border;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    TextStyle currentTextStyles = style ?? themeTitleSmall(context);
    currentTextStyles = currentTextStyles
        .merge(TextStyle(color: Theme.of(context).colorScheme.background));
    if (textColor != null) {
      TextStyle newTextStyles = TextStyle(color: textColor);
      currentTextStyles = currentTextStyles.merge(newTextStyles);
    }

    return Container(
      width: width ?? buttonWidth,
      height: height ?? buttonHeight,
      decoration: BoxDecoration(
          color: bgColor ?? Theme.of(context).colorScheme.primary,
          borderRadius: ThemeParameters.borderRadius,
          border: border),
      child: InkWell(
        borderRadius: const BorderRadius.all(ThemeParameters.radiusCircular),
        onTap: () {
          onTap.call();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.016),
          child: BaseText(text,
              textAlign: TextAlign.center, style: currentTextStyles),
        ),
      ),
    );
  }
}
