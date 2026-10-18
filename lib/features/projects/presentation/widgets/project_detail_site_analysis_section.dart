import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:architecture_portfolio_web/features/projects/data/model/project_detail_model.dart';
import 'package:flutter/material.dart';

class ProjectDetailSiteAnalysisSection extends StatelessWidget {
  const ProjectDetailSiteAnalysisSection({
    super.key,
    required this.project,
  });

  final ProjectDetailModel project;

  @override
  Widget build(BuildContext context) {
    final analysisTitle = 'SITE ANALYSIS';
    final analysisDescription = '';

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
                  'SITE ANALYSIS',
                  style: AppTextStyles.h2(context),
                ),
                const SizedBox(
                  height: AppSpacing.xl,
                ),
                Text(
                  analysisTitle,
                  style: AppTextStyles.h3(context),
                ),
                const SizedBox(
                  height: AppSpacing.md,
                ),
                SizedBox(
                  width: context.isMobile
                      ? double.infinity
                      : 700,
                  child: Text(
                    analysisDescription,
                    style: AppTextStyles.bodyLarge(context),
                  ),
                ),
                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.xl
                      : AppSpacing.xxl,
                ),
                const _SiteDiagramPlaceholder(),
                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.xxl
                      : AppSpacing.xxxl,
                ),
                _SiteInformation(
                  project: project,
                ),
                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.xxl
                      : AppSpacing.xxxl,
                ),
                _SiteAnalysisItems(
                  project: project,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SiteDiagramPlaceholder extends StatelessWidget {
  const _SiteDiagramPlaceholder();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: context.isMobile
          ? 4 / 3
          : 16 / 7,
      child: Container(
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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.map_outlined,
                size: 48,
                color: AppColors.secondaryText,
              ),
              const SizedBox(
                height: AppSpacing.md,
              ),
              Text(
                'SITE ANALYSIS DIAGRAM',
                style: AppTextStyles.label(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SiteInformation extends StatelessWidget {
  const _SiteInformation({
    required this.project,
  });

  final ProjectDetailModel project;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.isMobile
          ? AppSpacing.xl
          : AppSpacing.xxxl,
      runSpacing: AppSpacing.xl,
      children: [
        _SiteInfoItem(
          label: 'LOCATION',
          value: project.location ?? '-',
        ),
        _SiteInfoItem(
          label: 'CLIMATE',
          value: '-',
        ),
        _SiteInfoItem(
          label: 'ORIENTATION',
          value: '-',
        ),
      ],
    );
  }
}

class _SiteInfoItem extends StatelessWidget {
  const _SiteInfoItem({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isMobile
          ? 140
          : 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.label(context),
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          Text(
            value,
            style: AppTextStyles.body(context),
          ),
        ],
      ),
    );
  }
}

class _SiteAnalysisItems extends StatelessWidget {
  const _SiteAnalysisItems({
    required this.project,
  });

  final ProjectDetailModel project;

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'number': '01',
        'title': 'SUNLIGHT',
        'description': '',
      },
      {
        'number': '02',
        'title': 'NATURAL VENTILATION',
        'description': '',
      },
      {
        'number': '03',
        'title': 'SURROUNDING CONTEXT',
        'description': '',
      },
    ];

    return Column(
      children: List.generate(
        items.length,
        (index) {
          final item = items[index];

          return Padding(
            padding: EdgeInsets.only(
              bottom: index == items.length - 1
                  ? 0
                  : AppSpacing.xxl,
            ),
            child: _SiteAnalysisItem(
              number: item['number']!,
              title: item['title']!,
              description: item['description']!,
            ),
          );
        },
      ),
    );
  }
}

class _SiteAnalysisItem extends StatelessWidget {
  const _SiteAnalysisItem({
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
            style: AppTextStyles.label(context),
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