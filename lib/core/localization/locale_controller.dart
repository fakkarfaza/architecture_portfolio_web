import 'package:flutter/material.dart';

class LocaleController extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  bool get isEnglish {
    return _locale.languageCode == 'en';
  }

  void setLocale(Locale locale) {
    if (_locale == locale) {
      return;
    }

    _locale = locale;
    notifyListeners();
  }

  void toggleLocale() {
    setLocale(
      isEnglish
          ? const Locale('id')
          : const Locale('en'),
    );
  }
}

final localeController = LocaleController();