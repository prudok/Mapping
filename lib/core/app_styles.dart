import 'package:flutter/material.dart';
import 'package:mapping/core/app_colors.dart';

abstract class AppStyles {
  static final ButtonStyle wideButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 15,
    ),
    backgroundColor: AppColors.orange,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  static const BoxDecoration roundedOnlyBottomEdges = BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(50),
      bottomRight: Radius.circular(50),
    ),
  );
}
