import 'package:architecture_portfolio_web/core/l10n/app_localizations.dart';
import 'package:architecture_portfolio_web/shared/widgets/language_switcher.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:architecture_portfolio_web/router/app_routes.dart';
import 'package:architecture_portfolio_web/shared/widgets/mobile_menu.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_spacing.dart';

class AppNavbar extends StatelessWidget {
  const AppNavbar({
    super.key,
    this.onMenuPressed,
  });

  final VoidCallback? onMenuPressed;

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: context.isMobile
          ? AppSizes.mobileNavbarHeight
          : AppSizes.navbarHeight,
      decoration: const BoxDecoration(
        color: AppColors.background,
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
            child: Row(
              children: [
                const _Logo(),

                const Spacer(),

                if (!context.isMobile)
                  Row(
                    children: [
                      _NavItem(
                        title: l10n.home,
                        route: '/',
                        isActive: currentRoute == AppRoutes.home,
                      ),
                      SizedBox(width: AppSpacing.lg),
                      _NavItem(
                        title: l10n.projects,
                        route: '/projects',
                        isActive: currentRoute.startsWith(AppRoutes.projects),
                      ),
                      SizedBox(width: AppSpacing.lg),
                      _NavItem(
                        title: l10n.about,
                        route: '/about',
                        isActive: currentRoute == AppRoutes.about,
                      ),
                      SizedBox(width: AppSpacing.lg),
                      _NavItem(
                        title: l10n.contact,
                        route: '/contact',
                        isActive: currentRoute == AppRoutes.contact,
                      ),
                      const SizedBox(width: AppSpacing.xl),
                      const LanguageSwitcher(),
                    ],
                  ),

                if (context.isMobile)
                const LanguageSwitcher(),
                const SizedBox(width: AppSpacing.sm),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.transparent,
                      builder: (_) => const MobileMenu(),
                    );
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(AppRoutes.home);
      },
      child: Text(
        'ARCHI.',
        style: AppTextStyles.logo(context),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({
    required this.title,
    required this.route,
    this.isActive = false,
  });

  final String title;
  final String route;
  final bool isActive;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_){
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_){
        setState(() {
          _isHovered = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go(widget.route);
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: widget.isActive
              ? 1
              : _isHovered
                  ? 0.6
                  : 0.45,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.sm,
            ),
            child: Text(
              widget.title,
              style: AppTextStyles.navigation(context),
            ),
          ),
        ),
      ),
    );
  }
}