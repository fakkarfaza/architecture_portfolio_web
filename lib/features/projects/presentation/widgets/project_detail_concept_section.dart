import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProjectDetailConceptSection extends StatelessWidget {
  const ProjectDetailConceptSection({
    super.key, 
    required this.project,
  });

  final Map<String, String> project;

  @override
  Widget build(BuildContext context) {
    final conceptTitle = project['conceptTitle'] ??
        'DESIGN CONCEPT';

    final concept = project['concept'] ??
        'Concept information will be available soon.';

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
                  'CONCEPT',
                  style: AppTextStyles.h2(context),
                ),
                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.xl
                      : AppSpacing.xxl,
                ),
                _ConceptContent(
                  conceptTitle: conceptTitle,
                  concept: concept,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ConceptContent extends StatelessWidget {
  const _ConceptContent({
    required this.conceptTitle,
    required this.concept,
  });

  final String conceptTitle;
  final String concept;

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
        Expanded(
          flex: 2,
          child: _ConceptText(
            conceptTitle: conceptTitle,
            concept: concept,
          ),
        ),
        const SizedBox(
          width: AppSpacing.xxxl,
        ),
        const Expanded(
          flex: 3,
          child: _ConceptVisualPlaceholder(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ConceptText(
          conceptTitle: conceptTitle,
          concept: concept,
        ),
        const SizedBox(
          height: AppSpacing.xl,
        ),
        const _ConceptVisualPlaceholder(),
      ],
    );
  }
}

class _ConceptText extends StatelessWidget {
  const _ConceptText({
    required this.conceptTitle,
    required this.concept,
  });

  final String conceptTitle;
  final String concept;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          conceptTitle,
          style: AppTextStyles.h3(context),
        ),
        const SizedBox(
          height: AppSpacing.lg,
        ),
        Text(
          concept,
          style: AppTextStyles.bodyLarge(context),
        ),
      ],
    );
  }
}

class _ConceptVisualPlaceholder extends StatelessWidget {
  const _ConceptVisualPlaceholder();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: context.isMobile
          ? 4 / 3
          : 1,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryText.withValues(
            alpha: 0.08,
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.lightbulb_outline,
            size: 48,
            color: AppColors.secondaryText,
          ),
        ),
      ),
    );
  }
}