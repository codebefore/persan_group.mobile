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
    this.prefixIcon,
    this.suffixIcon,
    this.assetImage,
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
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final AssetImage? assetImage;

  @override
  Widget build(BuildContext context) {
    TextStyle currentTextStyles = themeSubTitleMedium(context);

    if (style != null) {
      currentTextStyles = currentTextStyles.merge(style);
    }

    currentTextStyles = currentTextStyles
        .merge(TextStyle(color: Theme.of(context).colorScheme.background));

    if (textColor != null) {
      TextStyle newTextStyles = TextStyle(color: textColor);
      currentTextStyles = currentTextStyles.merge(newTextStyles);
    }

    return Material(
      color: bgColor ?? Theme.of(context).colorScheme.primary,
      borderRadius: ThemeParameters.borderRadius,
      child: InkWell(
        borderRadius: ThemeParameters.borderRadius,
        child: Container(
          width: width ?? buttonWidth,
          height: height ?? buttonHeight,
          decoration: BoxDecoration(
              borderRadius: ThemeParameters.borderRadius, border: border),
          child: prefixIcon == null && suffixIcon == null && assetImage == null
              ? BaseText(text,
                  textAlign: TextAlign.center, style: currentTextStyles)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (assetImage != null)
                        Image(image: assetImage!, height: 24, width: 24),
                      prefixIcon ?? Container(),
                      BaseText(text,
                          textAlign: TextAlign.center,
                          style: currentTextStyles),
                      suffixIcon ?? Container(),
                    ],
                  ),
                ),
        ),
        onTap: () {
          onTap.call();
        },
      ),
    );
  }
}
