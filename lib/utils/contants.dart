import 'package:flutter/material.dart';

const Color primary = Color(0xFF2A3035);
const Color secondary = Color(0xFF202329);

BoxDecoration profileBoxDecoration(double screenWidth) {
  return BoxDecoration(
    color: secondary,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(screenWidth / 8),
      topRight: Radius.circular(screenWidth / 8),
    ),
  );
}

EdgeInsets profilePadding(double screenWidth) {
  return EdgeInsets.only(
    top: screenWidth / 10,
    left: screenWidth / 10,
    right: screenWidth / 10,
  );
}
