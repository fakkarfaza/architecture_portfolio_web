import 'package:architecture_portfolio_web/core/localization/locale_provider.dart';
import 'package:architecture_portfolio_web/features/projects/data/model/project_detail_model.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/provider/project_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final projectDetailProvider = FutureProvider.family<ProjectDetailModel, String>((ref, slug) async {
  final localeController = ref.watch(localeProvider);
  final service = ref.read(projectServiceProvider);

  return service.getProjectBySlug(
    slug,
    localeController.locale.languageCode,
  );
});