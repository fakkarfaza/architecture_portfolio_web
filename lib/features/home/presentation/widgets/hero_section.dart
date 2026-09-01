import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
  super.key,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.sizeOf(context).height - (context.isMobile ? AppSizes.mobileNavbarHeight : AppSizes.navbarHeight),
      ),
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSpacing.xxl,
              horizontal: context.isMobile
                ? AppSpacing.md
                : AppSpacing.xl,
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ARCHITECTURE PORTFOLIO',
                  style: AppTextStyles.label(context),
                ),
                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.lg
                      : AppSpacing.xl,
                ),
                Text(
                  'DESIGNING SPACES\nTHAT INSPIRE.',
                  style: AppTextStyles.hero(context),
                ),
                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.lg
                      : AppSpacing.xxl,
                ),
                SizedBox(
                  width: context.isMobile ? double.infinity : 500,
                  child: Text(
                    'Architecture is more than creating buildings. '
                    'It is about designing spaces that connect people, '
                    'nature, and experiences.',
                    style: AppTextStyles.bodyLarge(context),
                  ),
                ),
                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.xl
                      : AppSpacing.xxl,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_downward,
                      size: 18,
                      color: AppColors.secondaryText,
                    ),
                    SizedBox(
                      width: AppSpacing.sm,
                    ),
                    Text(
                      'SCROLL TO EXPLORE',
                      style: AppTextStyles.label(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
