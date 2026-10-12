import 'package:architecture_portfolio_web/core/localization/locale_provider.dart';
import 'package:architecture_portfolio_web/features/about/data/model/profile_model.dart';
import 'package:architecture_portfolio_web/features/about/data/service/profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileServiceProvider = Provider<ProfileService>((ref) {
  return ProfileService();
});

final profileProvider = FutureProvider<ProfileModel>((ref) async {
  final localeController = ref.watch(localeProvider);
  final service = ref.read(profileServiceProvider);

  return service.getProfile(
    localeController.locale.languageCode,
  );
});