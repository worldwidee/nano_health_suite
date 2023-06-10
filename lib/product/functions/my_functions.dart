import 'package:flutter/material.dart';

String amountConverter(double? amount, {bool doubleView = true}) {
  double amountTmp = amount ?? 0;
  String stringFormat = amountTmp.toStringAsFixed(2);
  List<String> formats = stringFormat.split(".");
  String number = formats[0];
  String newNumber = "";
  for (int i = 0; i < number.length; i++) {
    int reverseIndex = number.length - i;
    if (reverseIndex % 3 == 0 && reverseIndex != number.length) {
      newNumber += ",";
    }
    newNumber += number[i];
  }
  return doubleView ? "$newNumber.${formats[1]}" : newNumber;
}

ButtonStyle zeroPaddingTextButton() {
  return TextButton.styleFrom(
    minimumSize: Size.zero,
    padding: EdgeInsets.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
