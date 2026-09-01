import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProjectDetailVisualizationSection extends StatelessWidget {
  const ProjectDetailVisualizationSection({
    super.key,
    required this.project,
  });

  final Map<String, String> project;

  @override
  Widget build(BuildContext context) {
    final image1 = project['visualizationImage1'];
    final image2 = project['visualizationImage2'];
    final image3 = project['visualizationImage3'];
    final image4 = project['visualizationImage4'];

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
                  'VISUALIZATION',
                  style: AppTextStyles.h2(context),
                ),

                const SizedBox(
                  height: AppSpacing.md,
                ),

                SizedBox(
                  width: context.isMobile
                      ? double.infinity
                      : 600,
                  child: Text(
                    'A COLLECTION OF PERSPECTIVES AND SPATIAL EXPERIENCES.',
                    style: AppTextStyles.label(context),
                  ),
                ),

                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.xl
                      : AppSpacing.xxl,
                ),

                _VisualizationImage(
                  imageUrl: image1,
                  label: 'EXTERIOR PERSPECTIVE',
                  aspectRatio: 16 / 9,
                ),

                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.lg
                      : AppSpacing.xl,
                ),

                context.isMobile
                    ? Column(
                        children: [
                          _VisualizationImage(
                            imageUrl: image2,
                            label: 'COURTYARD',
                            aspectRatio: 4 / 3,
                          ),
                          const SizedBox(
                            height: AppSpacing.lg,
                          ),
                          _VisualizationImage(
                            imageUrl: image3,
                            label: 'INTERIOR SPACE',
                            aspectRatio: 4 / 3,
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: _VisualizationImage(
                              imageUrl: image2,
                              label: 'COURTYARD',
                              aspectRatio: 4 / 3,
                            ),
                          ),
                          const SizedBox(
                            width: AppSpacing.xl,
                          ),
                          Expanded(
                            child: _VisualizationImage(
                              imageUrl: image3,
                              label: 'INTERIOR SPACE',
                              aspectRatio: 4 / 3,
                            ),
                          ),
                        ],
                      ),

                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.lg
                      : AppSpacing.xl,
                ),

                _VisualizationImage(
                  imageUrl: image4,
                  label: 'FINAL ARCHITECTURAL VIEW',
                  aspectRatio: 16 / 9,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _VisualizationImage extends StatelessWidget {
  const _VisualizationImage({
    required this.imageUrl,
    required this.label,
    required this.aspectRatio,
  });

  final String? imageUrl;
  final String label;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
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
        child: imageUrl != null
            ? Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {
                  return _ImagePlaceholder(
                    label: label,
                  );
                },
              )
            : _ImagePlaceholder(
                label: label,
              ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.image_outlined,
            size: 48,
            color: AppColors.secondaryText,
          ),
          const SizedBox(
            height: AppSpacing.md,
          ),
          Text(
            label,
            style: AppTextStyles.label(context),
          ),
        ],
      ),
    );
  }
}