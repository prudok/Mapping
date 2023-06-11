import 'package:flutter/material.dart';
import 'package:mapping/core/constants/colors/app_colors.dart';

final commonButtonStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  backgroundColor: AppColors.purple,
  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
);
