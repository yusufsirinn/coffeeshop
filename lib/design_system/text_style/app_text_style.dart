import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static final TextStyle _font = GoogleFonts.sora();

  static TextStyle regular12(Color color) {
    return _font.copyWith(
      color: color,
      fontSize: 12,
      height: 15 / 12,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.24,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle regular14(Color color) {
    return _font.copyWith(
      color: color,
      fontSize: 14,
      height: 1.54,
      fontWeight: FontWeight.w400,
      letterSpacing: 14 * .01,
    );
  }

  static TextStyle regular32(Color color) {
    return _font.copyWith(
      color: color,
      fontSize: 32,
      height: 40 / 32,
    );
  }

  static TextStyle semiBold10(Color color) {
    return _font.copyWith(
      color: color,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold12(Color color) {
    return _font.copyWith(
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold14(Color color) {
    return _font.copyWith(
      color: color,
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold16(Color color) {
    return _font.copyWith(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold18(Color color) {
    return _font.copyWith(
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold20(Color color) {
    return _font.copyWith(
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold34(Color color) {
    return _font.copyWith(
      color: color,
      fontSize: 34,
      height: 43 / 34,
      fontWeight: FontWeight.w600,
      letterSpacing: 34 * 0.01,
    );
  }
}
