import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/l10n/app_localizations.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:architecture_portfolio_web/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
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
              vertical: context.isMobile
                  ? AppSpacing.xl
                  : AppSpacing.xxl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopSection(context),
                const SizedBox(
                  height: AppSpacing.xxl,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.secondaryText.withValues(
                    alpha: 0.2,
                  ),
                ),
                const SizedBox(
                  height: AppSpacing.lg,
                ),
                _buildBottomSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    if (context.isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBrand(context),
          const SizedBox(
            height: AppSpacing.xl,
          ),
          _buildNavigation(context),
          const SizedBox(
            height: AppSpacing.xl,
          ),
          _buildSocialLinks(context),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildBrand(context),
        ),
        Expanded(
          child: _buildNavigation(context),
        ),
        Expanded(
          child: _buildSocialLinks(context),
        ),
      ],
    );
  }

  Widget _buildBrand(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ARCHI.',
          style: AppTextStyles.logo(context),
        ),
        const SizedBox(
          height: AppSpacing.md,
        ),
        SizedBox(
          width: context.isMobile ? double.infinity : 280,
          child: Text(
            'Architecture portfolio showcasing selected academic '
            'and conceptual works.',
            style: AppTextStyles.body(context),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigation(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NAVIGATION',
          style: AppTextStyles.label(context),
        ),
        const SizedBox(
          height: AppSpacing.md,
        ),
        _FooterLink(
          title: l10n.home,
          onTap: () {
            context.go(AppRoutes.home);
          },
        ),
        _FooterLink(
          title: l10n.projects,
          onTap: () {
            context.go(AppRoutes.projects);
          },
        ),
        _FooterLink(
          title: l10n.about,
          onTap: () {
            context.go(AppRoutes.about);
          },
        ),
        _FooterLink(
          title: l10n.contact,
          onTap: () {
            context.go(AppRoutes.contact);
          },
        ),
      ],
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CONNECT',
          style: AppTextStyles.label(context),
        ),
        const SizedBox(
          height: AppSpacing.md,
        ),
        const _FooterLink(
          title: 'INSTAGRAM',
        ),
        const _FooterLink(
          title: 'LINKEDIN',
        ),
        const _FooterLink(
          title: 'EMAIL',
        ),
      ],
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    if (context.isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.footerCopyright,
            style: AppTextStyles.label(context),
          ),
          const SizedBox(
            height: AppSpacing.sm,
          ),
          Text(
            l10n.footerDesignedBuilt,
            style: AppTextStyles.label(context),
          ),
        ],
      );
    }

    return Row(
      children: [
        Text(
          l10n.footerCopyright,
          style: AppTextStyles.label(context),
        ),
        const Spacer(),
        Text(
          l10n.footerDesignedBuilt,
          style: AppTextStyles.label(context),
        ),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  const _FooterLink({
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: AppSpacing.sm,
          ),
          child: AnimatedOpacity(
            duration: const Duration(
              milliseconds: 200,
            ),
            opacity: _isHovered ? 1 : 0.6,
            child: Text(
              widget.title,
              style: AppTextStyles.label(
                context,
                color: AppColors.primaryText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}