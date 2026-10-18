import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:architecture_portfolio_web/features/projects/data/model/project_detail_model.dart';
import 'package:flutter/material.dart';

class ProjectDetailBriefSection extends StatelessWidget {
  const ProjectDetailBriefSection({
    super.key, 
    required this.project,
  });

  final ProjectDetailModel project;

  @override
  Widget build(BuildContext context) {
    final brief = project.brief ?? '';

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
            child: context.isMobile
                ? _buildMobileLayout(
                    context,
                    brief,
                  )
                : _buildDesktopLayout(
                    context,
                    brief,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    String brief,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            'PROJECT BRIEF',
            style: AppTextStyles.h2(context),
          ),
        ),
        const SizedBox(
          width: AppSpacing.xxxl,
        ),
        Expanded(
          flex: 3,
          child: Text(
            brief,
            style: AppTextStyles.bodyLarge(context),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    String brief,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PROJECT BRIEF',
          style: AppTextStyles.h2(context),
        ),
        const SizedBox(
          height: AppSpacing.xl,
        ),
        Text(
          brief,
          style: AppTextStyles.bodyLarge(context),
        ),
      ],
    );
  }
}