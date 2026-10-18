import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:architecture_portfolio_web/features/projects/data/model/project_detail_model.dart';
import 'package:flutter/material.dart';

class ProjectDetailMassingDevSection extends StatelessWidget {
  const ProjectDetailMassingDevSection({
    super.key,
    required this.project,
  });

  final ProjectDetailModel project;

  @override
  Widget build(BuildContext context) {
    final steps = [
      {
        'number': '01',
        'title': 'INITIAL MASS',
        'description': '',
      },
      {
        'number': '02',
        'title': 'CREATE THE COURTYARD',
        'description': '',
      },
      {
        'number': '03',
        'title': 'REFINE THE FORM',
        'description': '',
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
                  'MASSING DEVELOPMENT',
                  style: AppTextStyles.h2(context),
                ),
                const SizedBox(
                  height: AppSpacing.md,
                ),
                SizedBox(
                  width: context.isMobile ? double.infinity : 600,
                  child: Text(
                    'FROM SIMPLE FORM TO ARCHITECTURAL RESPONSE',
                    style: AppTextStyles.label(context),
                  ),
                ),
                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.xxl
                      : AppSpacing.xxxl,
                ),
                context.isMobile
                    ? _MobileMassingLayout(
                        steps: steps,
                      )
                    : _DesktopMassingLayout(
                        steps: steps,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DesktopMassingLayout extends StatelessWidget {
  const _DesktopMassingLayout({
    required this.steps,
  });

  final List<Map<String, String>> steps;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _MassingStep(
            number: steps[0]['number']!,
            title: steps[0]['title']!,
            description: steps[0]['description']!,
          ),
        ),
        _MassingArrow(),
        Expanded(
          child: _MassingStep(
            number: steps[1]['number']!,
            title: steps[1]['title']!,
            description: steps[1]['description']!,
          ),
        ),
        _MassingArrow(),
        Expanded(
          child: _MassingStep(
            number: steps[2]['number']!,
            title: steps[2]['title']!,
            description: steps[2]['description']!,
          ),
        ),
      ],
    );
  }
}

class _MassingArrow extends StatelessWidget {
  const _MassingArrow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 120,
        ),
        child: Icon(
          Icons.arrow_forward,
          color: AppColors.secondaryText.withValues(
            alpha: 0.5,
          ),
        ),
      ),
    );
  }
}

class _MobileMassingLayout extends StatelessWidget {
  const _MobileMassingLayout({
    required this.steps,
  });

  final List<Map<String, String>> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        steps.length,
        (index) {
          final step = steps[index];

          return Column(
            children: [
              _MassingStep(
                number: step['number']!,
                title: step['title']!,
                description: step['description']!,
              ),
              if (index != steps.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.xl,
                  ),
                  child: Icon(
                    Icons.arrow_downward,
                    color: AppColors.secondaryText.withValues(
                      alpha: 0.5,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _MassingStep extends StatelessWidget {
  const _MassingStep({
    required this.number,
    required this.title,
    required this.description,
  });

  final String number;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: AppTextStyles.label(context),
        ),
        const SizedBox(
          height: AppSpacing.md,
        ),
        Text(
          title,
          style: AppTextStyles.h3(context),
        ),
        const SizedBox(
          height: AppSpacing.xl,
        ),
        const _MassingVisualPlaceholder(),
        const SizedBox(
          height: AppSpacing.lg,
        ),
        Text(
          description,
          style: AppTextStyles.body(context),
        ),
      ],
    );
  }
}

class _MassingVisualPlaceholder extends StatelessWidget {
  const _MassingVisualPlaceholder();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondaryText.withValues(
            alpha: 0.04,
          ),
          border: Border.all(
            color: AppColors.secondaryText.withValues(
              alpha: 0.2,
            ),
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.view_in_ar_outlined,
            size: 48,
            color: AppColors.secondaryText,
          ),
        ),
      ),
    );
  }
}