import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/size_config.dart';

class BaseInput extends StatelessWidget {
  const BaseInput(
      {Key? key,
      required this.keyboardType,
      required this.textFormatters,
      required this.onChanged,
      required this.validator,
      this.isInScrollView,
      this.controller,
      this.onEditingComplete,
      this.onTap,
      this.decoration,
      this.containerHeight,
      this.containerWidth,
      this.style,
      this.focusNode,
      this.readOnly,
      this.textInputAction,
      this.obsecure,
      this.maxLength,
      this.initialValue})
      : super(key: key);
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final TextInputType keyboardType;
  final List<TextInputFormatter> textFormatters;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final TextStyle? style;
  final double? containerHeight;
  final double? containerWidth;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? obsecure;
  final bool? readOnly;
  final int? maxLength;
  final String? initialValue;
  final bool? isInScrollView;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      margin: isInScrollView == true
          ? EdgeInsets.only(bottom: screenHeight * .025)
          : const EdgeInsets.only(bottom: 0),
      child: TextFormField(
        style: style,
        initialValue: initialValue,
        readOnly: readOnly ?? false,
        textInputAction: textInputAction,
        controller: controller,
        decoration: decoration,
        keyboardType: keyboardType,
        inputFormatters: textFormatters,
        focusNode: focusNode,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onTap: onTap,
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.none,
        validator: validator,
        obscureText: obsecure ?? false,
      ),
    );
  }
}
