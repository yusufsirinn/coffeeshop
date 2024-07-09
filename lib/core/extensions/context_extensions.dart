import '../core.dart';
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  String tr(String text) => AppLocalizations.of(this)?.translate(text) ?? '';
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);

  Size get msize => mediaQuery.size;
}

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations? get localization => Localizations.of<AppLocalizations>(this, AppLocalizations);
}
