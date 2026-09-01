import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../router/app_routes.dart';

class MobileMenu extends StatelessWidget {
  const MobileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const Spacer(),
              _buildMenuItems(context),
              const Spacer(),
              _buildSocialLinks(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Text(
          'ARCHI.',
          style: AppTextStyles.logo(context),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
            color: AppColors.primaryText,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MobileMenuItem(
          title: 'HOME',
          route: AppRoutes.home,
        ),
        const SizedBox(height: AppSpacing.lg),
        _MobileMenuItem(
          title: 'PROJECTS',
          route: AppRoutes.projects,
        ),
        const SizedBox(height: AppSpacing.lg),
        _MobileMenuItem(
          title: 'ABOUT',
          route: AppRoutes.about,
        ),
        const SizedBox(height: AppSpacing.lg),
        _MobileMenuItem(
          title: 'CONTACT',
          route: AppRoutes.contact,
        ),
      ],
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'INSTAGRAM',
          style: AppTextStyles.label(context),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'LINKEDIN',
          style: AppTextStyles.label(context),
        ),
      ],
    );
  }
}

  class _MobileMenuItem extends StatelessWidget {
  const _MobileMenuItem({
    required this.title,
    required this.route,
  });

  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final router = GoRouter.of(context);
        Navigator.of(context).pop();
        router.go(route);
      },
      child: Text(
        title,
        style: AppTextStyles.h2(context),
      ),
    );
  }
}
