import '../../design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSetup {
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    AppTextStyle.setFontFamily(GoogleFonts.sora());
  }
}
