
import 'package:architecture_portfolio_web/features/projects/data/model/project_model.dart';
import 'package:architecture_portfolio_web/features/projects/data/service/project_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/locale_provider.dart';

final projectServiceProvider = Provider<ProjectService>((ref) {
  return ProjectService();
});

final projectsProvider = FutureProvider<List<ProjectModel>>((ref) async {
  final localeController = ref.watch(localeProvider);
  final service = ref.read(projectServiceProvider);

  return service.getProjects(
    localeController.locale.languageCode,
  );
});


