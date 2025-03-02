
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle buttonPrimaryWhite = GoogleFonts.manrope(
    textStyle: const TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.normal),
  );

  static TextStyle primaryTextWhite = GoogleFonts.manrope(
    textStyle: const TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.normal),
  );

  static TextStyle primaryTitleBlack = GoogleFonts.manrope(
    textStyle: const TextStyle(color: AppColors.black, fontSize: 24, fontWeight: FontWeight.bold),
  );

  static TextStyle primaryTitleWhite = GoogleFonts.manrope(
    textStyle: const TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
  );

  static TextStyle secondaryTextGrey = GoogleFonts.manrope(
    textStyle: const TextStyle(color: AppColors.grey, fontSize: 14, fontWeight: FontWeight.normal),
  );

  static TextStyle buttonTextBlack = GoogleFonts.manrope(
    textStyle: const TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold),
  );
}
