import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:architecture_portfolio_web/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactCtaSection extends StatelessWidget {
  const ContactCtaSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryText,
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
                  'LET\'S WORK TOGETHER',
                  style: AppTextStyles.label(
                    context,
                    color: AppColors.background,
                  ),
                ),
                const SizedBox(
                  height: AppSpacing.xl,
                ),
                Text(
                  context.isMobile
                      ? 'LET\'S CREATE\nSOMETHING\nMEANINGFUL.'
                      : 'LET\'S CREATE SOMETHING\nMEANINGFUL.',
                  style: AppTextStyles.h1(
                    context,
                    color: AppColors.background,
                  ),
                ),
                const SizedBox(
                  height: AppSpacing.xl,
                ),
                SizedBox(
                  width: context.isMobile ? double.infinity : 500,
                  child: Text(
                    'Have a project, collaboration, or idea in mind? '
                    'I would love to hear from you.',
                    style: AppTextStyles.bodyLarge(
                      context,
                      color: AppColors.background,
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSpacing.xxl,
                ),
                _ContactButton(
                  onPressed: () {
                    context.go(AppRoutes.contact);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  const _ContactButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
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
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.background
                : Colors.transparent,
            border: Border.all(
              color: AppColors.background,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'GET IN TOUCH',
                style: AppTextStyles.label(
                  context,
                  color: _isHovered
                      ? AppColors.primaryText
                      : AppColors.background,
                ),
              ),
              const SizedBox(
                width: AppSpacing.md,
              ),
              Icon(
                Icons.arrow_forward,
                size: 18,
                color: _isHovered
                    ? AppColors.primaryText
                    : AppColors.background,
              ),
            ],
          ),
        ),
      ),
    );
  }
}