import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color scaffoldColor = Color(0xFF1B1E25);
  static const Color purple = Color(0xFF546EE5);
  static const Color yellow = Color(0xFFFFD600);
  static const Color purpleDark = Color(0xFF272A3D);
  static const Color white = Colors.white;
  static const Color pink = Color(0xFFFF7878);

  static TextStyle headline1 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: white,
  );

  static TextStyle headline2 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: white,
  );

  static TextStyle headline3 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static TextStyle text1 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: white,
  );

  static TextStyle text2 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: white,
  );

  static TextStyle subText1 = TextStyle(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w300,
    color: white,
  );

  static List<BoxShadow> getShadow(Color color) {
    return [
      BoxShadow(
        color: color.withOpacity(0.2),
        offset: const Offset(0, 4),
        blurRadius: 20,
        spreadRadius: 4,
      ),
    ];
  }
}
