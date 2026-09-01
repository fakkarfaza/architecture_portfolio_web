import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:architecture_portfolio_web/router/app_routes.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectedProjectsSection extends StatelessWidget {
  const SelectedProjectsSection({
    super.key,
  });

  static const List<Map<String, String>> _projects = [
    {
      'title': 'TROPICAL COURTYARD HOUSE',
      'category': 'Residential',
      'year': '2025',
    },
    {
      'title': 'URBAN CULTURAL CENTER',
      'category': 'Public Architecture',
      'year': '2024',
    },
    {
      'title': 'COMMUNITY PAVILION',
      'category': 'Community',
      'year': '2024',
    },
    {
      'title': 'COASTAL RETREAT',
      'category': 'Hospitality',
      'year': '2023',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
                _SectionHeader(
                  onViewAllPressed: () {
                    context.go(AppRoutes.projects);
                  },
                ),
                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.xl
                      : AppSpacing.xxl,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _projects.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.isMobile ? 1 : 2,
                    crossAxisSpacing: AppSpacing.lg,
                    mainAxisSpacing: AppSpacing.xxl,
                    childAspectRatio: context.isMobile
                        ? 1.15
                        : 1.05,
                  ),
                  itemBuilder: (context, index) {
                    final project = _projects[index];

                    return ProjectCard(
                      title: project['title']!,
                      category: project['category']!,
                      year: project['year']!,
                      onTap: () {
                        // Project detail navigation later.
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.onViewAllPressed,
  });

  final VoidCallback onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'SELECTED PROJECTS',
            style: AppTextStyles.h2(context),
          ),
        ),
        TextButton(
          onPressed: onViewAllPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'VIEW ALL',
                style: AppTextStyles.label(
                  context,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(
                width: AppSpacing.sm,
              ),
              const Icon(
                Icons.arrow_forward,
                size: 16,
                color: AppColors.primaryText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}