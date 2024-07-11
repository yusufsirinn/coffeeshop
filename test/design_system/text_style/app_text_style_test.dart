import 'package:coffeeshop/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  group('AppTextStyle Tests', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    AppTextStyle.setFontFamily(const TextStyle());
    setUp(() => GoogleFonts.config.allowRuntimeFetching = false);
    test('regular12 should return correct TextStyle', () {
      final textStyle = AppTextStyle.regular12(Colors.black);

      expect(textStyle.color, equals(Colors.black));
      expect(textStyle.fontSize, equals(12));
      expect(textStyle.height, equals(15 / 12));
      expect(textStyle.fontWeight, equals(FontWeight.w400));
      expect(textStyle.letterSpacing, equals(-0.24));
      expect(textStyle.overflow, equals(TextOverflow.ellipsis));
    });

    test('regular14 should return correct TextStyle', () {
      final textStyle = AppTextStyle.regular14(Colors.red);

      expect(textStyle.color, equals(Colors.red));
      expect(textStyle.fontSize, equals(14));
      expect(textStyle.height, equals(1.54));
      expect(textStyle.fontWeight, equals(FontWeight.w400));
      expect(textStyle.letterSpacing, equals(14 * .01));
    });

    test('regular32 should return correct TextStyle', () {
      final textStyle = AppTextStyle.regular32(Colors.blue);

      expect(textStyle.color, equals(Colors.blue));
      expect(textStyle.fontSize, equals(32));
      expect(textStyle.height, equals(40 / 32));
    });

    test('semiBold10 should return correct TextStyle', () {
      final textStyle = AppTextStyle.semiBold10(Colors.green);

      expect(textStyle.color, equals(Colors.green));
      expect(textStyle.fontSize, equals(10));
      expect(textStyle.fontWeight, equals(FontWeight.w600));
    });

    test('semiBold12 should return correct TextStyle', () {
      final textStyle = AppTextStyle.semiBold12(Colors.purple);

      expect(textStyle.color, equals(Colors.purple));
      expect(textStyle.fontSize, equals(12));
      expect(textStyle.fontWeight, equals(FontWeight.w600));
    });

    test('semiBold14 should return correct TextStyle', () {
      final textStyle = AppTextStyle.semiBold14(Colors.yellow);

      expect(textStyle.color, equals(Colors.yellow));
      expect(textStyle.fontSize, equals(14));
      expect(textStyle.height, equals(18 / 14));
      expect(textStyle.fontWeight, equals(FontWeight.w600));
    });

    test('semiBold16 should return correct TextStyle', () {
      final textStyle = AppTextStyle.semiBold16(Colors.orange);

      expect(textStyle.color, equals(Colors.orange));
      expect(textStyle.fontSize, equals(16));
      expect(textStyle.fontWeight, equals(FontWeight.w600));
    });

    test('semiBold18 should return correct TextStyle', () {
      final textStyle = AppTextStyle.semiBold18(Colors.teal);

      expect(textStyle.color, equals(Colors.teal));
      expect(textStyle.fontSize, equals(18));
      expect(textStyle.fontWeight, equals(FontWeight.w600));
    });

    test('semiBold20 should return correct TextStyle', () {
      final textStyle = AppTextStyle.semiBold20(Colors.deepPurple);

      expect(textStyle.color, equals(Colors.deepPurple));
      expect(textStyle.fontSize, equals(20));
      expect(textStyle.fontWeight, equals(FontWeight.w600));
    });

    test('semiBold34 should return correct TextStyle', () {
      final textStyle = AppTextStyle.semiBold34(Colors.cyan);

      expect(textStyle.color, equals(Colors.cyan));
      expect(textStyle.fontSize, equals(34));
      expect(textStyle.height, equals(43 / 34));
      expect(textStyle.fontWeight, equals(FontWeight.w600));
      expect(textStyle.letterSpacing, equals(34 * 0.01));
    });
  });
}
