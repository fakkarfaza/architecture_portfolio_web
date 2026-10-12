import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'locale_controller.dart';

final localeProvider = ChangeNotifierProvider<LocaleController>((ref) {
  return localeController;
});