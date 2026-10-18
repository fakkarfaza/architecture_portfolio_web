import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:architecture_portfolio_web/features/projects/data/model/project_detail_model.dart';
import 'package:architecture_portfolio_web/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectDetailHeroSection extends StatelessWidget {
  const ProjectDetailHeroSection({
    super.key, 
    required this.project,
  });

  final ProjectDetailModel project;

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
                _BackButton(),
                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.xxl
                      : AppSpacing.xxxl,
                ),
                _ProjectHeader(
                  project: project,
                ),
                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.xxl
                      : AppSpacing.xxxl,
                ),
                _ProjectVisual(
                  imageUrl: project.heroImageUrl,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go(AppRoutes.projects);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.arrow_back,
              size: 18,
              color: AppColors.primaryText,
            ),
            const SizedBox(
              width: AppSpacing.sm,
            ),
            Text(
              'BACK TO PROJECTS',
              style: AppTextStyles.label(
                context,
                color: AppColors.primaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectHeader extends StatelessWidget {
  const _ProjectHeader({
    required this.project,
  });

  final ProjectDetailModel project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          (project.category ?? '').toUpperCase(),
          style: AppTextStyles.label(context),
        ),
        const SizedBox(
          height: AppSpacing.lg,
        ),
        Text(
          project.title.toUpperCase(),
          style: AppTextStyles.h1(context),
        ),
        const SizedBox(
          height: AppSpacing.xl,
        ),
        Wrap(
          spacing: AppSpacing.xl,
          runSpacing: AppSpacing.sm,
          children: [
            _ProjectMetaItem(
              label: 'YEAR',
              value: project.year?.toString() ?? '-',
            ),
            _ProjectMetaItem(
              label: 'LOCATION',
              value: project.location ?? '-',
            ),
          ],
        ),
      ],
    );
  }
}

class _ProjectMetaItem extends StatelessWidget {
  const _ProjectMetaItem({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$label: ',
          style: AppTextStyles.label(context),
        ),
        Text(
          value,
          style: AppTextStyles.body(context),
        ),
      ],
    );
  }
}

class _ProjectVisual extends StatelessWidget {
  const _ProjectVisual({
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: context.isMobile ? 4 / 5 : 16 / 9,
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? Image.network(
              imageUrl!,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildPlaceholder();
              },
            )
          : _buildPlaceholder(),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: double.infinity,
      color: AppColors.secondaryText.withValues(alpha: 0.08),
      child: const Center(
        child: Icon(
          Icons.architecture_outlined,
          size: 64,
          color: AppColors.secondaryText,
        ),
      ),
    );
  }
}

