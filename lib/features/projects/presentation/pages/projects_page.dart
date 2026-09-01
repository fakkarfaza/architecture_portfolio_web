import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/app_footer.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/project_card.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_filter.dart';
import 'package:architecture_portfolio_web/features/projects/presentation/widgets/project_header.dart';
import 'package:architecture_portfolio_web/router/app_routes.dart';
import 'package:architecture_portfolio_web/shared/widgets/app_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({
    super.key,
  });

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  String _selectedCategory = 'ALL';

  static const List<Map<String, String>> _projects = [
    {
      'title': 'TROPICAL COURTYARD HOUSE',
      'category': 'RESIDENTIAL',
      'year': '2025',
      'slug': 'tropical-courtyard-house',
    },
    {
      'title': 'URBAN CULTURAL CENTER',
      'category': 'PUBLIC',
      'year': '2024',
      'slug': 'urban-cultural-center',
    },
    {
      'title': 'COMMUNITY PAVILION',
      'category': 'COMMUNITY',
      'year': '2024',
      'slug': 'community-pavilion',
    },
    {
      'title': 'COASTAL RETREAT',
      'category': 'HOSPITALITY',
      'year': '2023',
      'slug': 'coastal-retreat',
    },
  ];

  List<Map<String, String>> get _filteredProjects {
    if (_selectedCategory == 'ALL') {
      return _projects;
    }

    return _projects
        .where(
          (project) => project['category'] == _selectedCategory,
        )
        .toList();
  }

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = context.isMobile ? 1 : 2;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _filteredProjects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: AppSpacing.lg,
            mainAxisSpacing: AppSpacing.xxl,
            childAspectRatio: context.isMobile ? 1.1 : 1.05,
          ),
          itemBuilder: (context, index) {
            final project = _filteredProjects[index];

            return ProjectCard(
              title: project['title']!,
              category: project['category']!,
              year: project['year']!,
              onTap: () {
                context.go(
                  AppRoutes.projectDetailPath(
                    project['slug']!,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}