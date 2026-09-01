import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProjectDetailDesignProcessSection extends StatelessWidget {
  const ProjectDetailDesignProcessSection({
    super.key,
    required this.project,
  });

  final Map<String, String> project;

  @override
  Widget build(BuildContext context) {
    final steps = [
      {
        'number': '01',
        'title': project['processStep1Title'] ?? 'INITIAL IDEA',
        'description': project['processStep1Description'] ??
            'Design process information will be available soon.',
      },
      {
        'number': '02',
        'title': project['processStep2Title'] ?? 'SPATIAL EXPLORATION',
        'description': project['processStep2Description'] ??
            'Design process information will be available soon.',
      },
      {
        'number': '03',
        'title': project['processStep3Title'] ?? 'DESIGN DEVELOPMENT',
        'description': project['processStep3Description'] ??
            'Design process information will be available soon.',
      },
    ];

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
                Text(
                  'DESIGN PROCESS',
                  style: AppTextStyles.h2(context),
                ),
                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.xl
                      : AppSpacing.xxl,
                ),
                ...List.generate(
                  steps.length,
                  (index) {
                    final step = steps[index];

                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index == steps.length - 1
                            ? 0
                            : AppSpacing.xxl,
                      ),
                      child: _DesignProcessItem(
                        number: step['number']!,
                        title: step['title']!,
                        description: step['description']!,
                      ),
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

class _DesignProcessItem extends StatelessWidget {
  const _DesignProcessItem({
    required this.number,
    required this.title,
    required this.description,
  });

  final String number;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return context.isMobile
        ? _buildMobileLayout(context)
        : _buildDesktopLayout(context);
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            number,
            style: AppTextStyles.label(
              context,
              color: AppColors.secondaryText,
            ),
          ),
        ),
        const SizedBox(
          width: AppSpacing.xl,
        ),
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: AppTextStyles.h3(context),
          ),
        ),
        const SizedBox(
          width: AppSpacing.xxl,
        ),
        Expanded(
          flex: 3,
          child: Text(
            description,
            style: AppTextStyles.bodyLarge(context),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: AppTextStyles.label(context),
        ),
        const SizedBox(
          height: AppSpacing.sm,
        ),
        Text(
          title,
          style: AppTextStyles.h3(context),
        ),
        const SizedBox(
          height: AppSpacing.md,
        ),
        Text(
          description,
          style: AppTextStyles.body(context),
        ),
      ],
    );
  }
}