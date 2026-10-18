import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/app_footer.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/provider/project_detail_provider.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_concept_section.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_brief_section.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_hero_section.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_massing_dev_section.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_process_section.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_site_analysis_section.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_detail_visualization_section.dart';
import 'package:architecture_portfolio_web/shared/widgets/app_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectDetailPage extends ConsumerWidget {
  const ProjectDetailPage({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectAsync = ref.watch(projectDetailProvider(slug));

    return Scaffold(
      body: Column(
        children: [
          const AppNavbar(),
          Expanded(
            child: projectAsync.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => Center(
                child: Text(error.toString()),
              ),
              skipLoadingOnReload: true,
              data: (project) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ProjectDetailHeroSection(project: project),
                      ProjectDetailBriefSection(project: project),
                      ProjectDetailConceptSection(project: project),
                      ProjectDetailDesignProcessSection(project: project),
                      ProjectDetailSiteAnalysisSection(project: project),
                      ProjectDetailMassingDevSection(project: project),
                      ProjectDetailVisualizationSection(project: project),
                      const AppFooter(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
