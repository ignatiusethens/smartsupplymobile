import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Headline styles — Work Sans
  static TextStyle headlineLg = GoogleFonts.workSans(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static TextStyle headlineMd = GoogleFonts.workSans(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static TextStyle headlineSm = GoogleFonts.workSans(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  // Body styles — Inter
  static TextStyle bodyLg = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static TextStyle bodyMd = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle bodySm = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  // Label styles — Inter
  static TextStyle labelLg = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  static TextStyle labelMd = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static TextStyle labelSm = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.1,
  );
}
