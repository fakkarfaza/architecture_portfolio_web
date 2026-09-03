import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/l10n/app_localizations.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:architecture_portfolio_web/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutPreviewSection extends StatelessWidget {
  const AboutPreviewSection({
    super.key,
  });

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
            child: context.isMobile
                ? _buildMobileLayout(context)
                : _buildDesktopLayout(context),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _AboutPlaceholder(),
        ),
        const SizedBox(
          width: AppSpacing.xxxl,
        ),
        Expanded(
          child: _AboutContent(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _AboutPlaceholder(),
        const SizedBox(
          height: AppSpacing.xxl,
        ),
        _AboutContent(),
      ],
    );
  }
}

class _AboutPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Container(
        color: AppColors.secondaryText.withValues(
          alpha: 0.1,
        ),
        child: const Center(
          child: Icon(
            Icons.person_outline,
            size: 64,
            color: AppColors.secondaryText,
          ),
        ),
      ),
    );
  }
}

class _AboutContent extends StatefulWidget {
  @override
  State<_AboutContent> createState() => _AboutContentState();
}

class _AboutContentState extends State<_AboutContent> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.about,
          style: AppTextStyles.label(context),
        ),
        const SizedBox(
          height: AppSpacing.lg,
        ),
        Text(
          '${l10n.helloIm}\nOPAL',
          style: AppTextStyles.h2(context),
        ),
        const SizedBox(
          height: AppSpacing.lg,
        ),
        Text(
          l10n.aboutHeadline,
          style: AppTextStyles.bodyLarge(context),
        ),
        const SizedBox(
          height: AppSpacing.md,
        ),
        Text(
          l10n.aboutHeroDescription,
          style: AppTextStyles.body(context),
        ),
        const SizedBox(
          height: AppSpacing.xxl,
        ),
        TextButton(
          onPressed: () {
            context.go(AppRoutes.about);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: AppColors.primaryText,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.moreAboutMe,
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
                size: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}