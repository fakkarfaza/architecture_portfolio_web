import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProjectsHeader extends StatelessWidget {
  const ProjectsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PROJECTS',
          style: AppTextStyles.label(context),
        ),
        const SizedBox(
          height: AppSpacing.lg,
        ),
        Text(
          'SELECTED WORKS\n& EXPLORATIONS.',
          style: AppTextStyles.h1(context),
        ),
        const SizedBox(
          height: AppSpacing.lg,
        ),
        SizedBox(
          width: 500,
          child: Text(
            'A collection of academic, conceptual, '
            'and architectural explorations.',
            style: AppTextStyles.bodyLarge(context),
          ),
        ),
      ],
    );
  }
}