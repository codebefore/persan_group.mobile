import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

getToast({required String content}) {
  return Fluttertoast.showToast(
    msg: content,
    backgroundColor: const Color(0xFFB3261E),
    toastLength: Toast.LENGTH_LONG,
    textColor: Colors.white,
  );
}
