import 'package:flutter/material.dart';

Color greyShade() {
  return const Color(0xff3D3D3D);
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

TextStyle whiteHeading(double fontSize) {
  return TextStyle(
    color: Colors.white,
    fontSize: fontSize,
    letterSpacing: 1.0,
    fontWeight: FontWeight.bold,
  );
}

TextStyle whiteNormalText(double fontSize) {
  return TextStyle(
    color: Colors.white,
    fontSize: fontSize,
  );
}

TextStyle greyNormalText(double fontSize) {
  return TextStyle(
      color: const Color(0xff8C8C8C),
      fontSize: fontSize,
      fontWeight: FontWeight.w500);
}
