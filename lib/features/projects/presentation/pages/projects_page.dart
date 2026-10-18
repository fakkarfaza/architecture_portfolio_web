import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/app_footer.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/project_card.dart';
import 'package:architecture_portfolio_web/features/projects/data/model/project_model.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/provider/project_provider.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_filter.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_header.dart';
import 'package:architecture_portfolio_web/router/app_routes.dart';
import 'package:architecture_portfolio_web/shared/widgets/app_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProjectsPage extends ConsumerStatefulWidget {
  const ProjectsPage({
    super.key,
  });

  @override
  ConsumerState<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends ConsumerState<ProjectsPage> {
  String _selectedCategory = 'ALL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppNavbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: context.isMobile
                          ? AppSpacing.xxl
                          : AppSpacing.xxxl,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: AppSizes.maxContentWidth,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.isMobile
                                ? AppSpacing.md
                                : AppSpacing.xl,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ProjectsHeader(),
                              SizedBox(
                                height: context.isMobile
                                    ? AppSpacing.xl
                                    : AppSpacing.xxl,
                              ),
                              ProjectsFilter(
                                selectedCategory: _selectedCategory,
                                onCategorySelected: (category) {
                                  setState(() {
                                    _selectedCategory = category;
                                  });
                                },
                              ),
                              SizedBox(
                                height: context.isMobile
                                    ? AppSpacing.xxl
                                    : AppSpacing.xxxl,
                              ),
                              _buildProjectsGrid(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const AppFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid() {
    final projectsAsync = ref.watch(projectsProvider);

    return projectsAsync.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Text(error.toString()),
      ),
      skipLoadingOnReload: true,
      data: (projects) {
        final filteredProjects = projects.where((project) {
          return _matchesCategory(project);
        }).toList();

        return LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = context.isMobile ? 1 : 2;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredProjects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: AppSpacing.lg,
                mainAxisSpacing: AppSpacing.xxl,
                childAspectRatio: context.isMobile ? 0.80 : 0.88,
              ),
              itemBuilder: (context, index) {
                final project = filteredProjects[index];

                return ProjectCard(
                  title: project.title.toUpperCase(),
                  category: project.category ?? '',
                  year: project.year?.toString() ?? '',
                  imagePath: project.thumbnailImageUrl,
                  onTap: () {
                    context.go(
                      AppRoutes.projectDetailPath(project.slug),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  bool _matchesCategory(ProjectModel project) {
    if (_selectedCategory == 'ALL') {
      return true;
    }

    final category = (project.category ?? '').trim().toUpperCase();

    switch (_selectedCategory) {
      case 'RESIDENTIAL':
        return {'RESIDENTIAL', 'HUNIAN'}.contains(category);

      case 'PUBLIC':
        return {
          'PUBLIC',
          'PUBLIC ARCHITECTURE',
          'PUBLIK',
          'ARSITEKTUR PUBLIK',
        }.contains(category);

      case 'COMMUNITY':
        return {'COMMUNITY', 'KOMUNITAS'}.contains(category);

      case 'HOSPITALITY':
        return {'HOSPITALITY', 'PERHOTELAN'}.contains(category);

      default:
        return false;
    }
  }
}