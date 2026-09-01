import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/localization/locale_controller.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: localeController,
      builder: (context, child) {
        final isEnglish = localeController.isEnglish;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LanguageItem(
              title: 'EN',
              isActive: isEnglish,
              onTap: () {
                localeController.setLocale(
                  const Locale('en'),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
              ),
              child: Text(
                '/',
                style: AppTextStyles.label(context),
              ),
            ),
            _LanguageItem(
              title: 'ID',
              isActive: !isEnglish,
              onTap: () {
                localeController.setLocale(
                  const Locale('id'),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _LanguageItem extends StatefulWidget {
  const _LanguageItem({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<_LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<_LanguageItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final opacity = widget.isActive
        ? 1.0
        : _isHovered
            ? 0.7
            : 0.4;

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
        onTap: widget.onTap,
        child: AnimatedOpacity(
          duration: const Duration(
            milliseconds: 200,
          ),
          opacity: opacity,
          child: Text(
            widget.title,
            style: AppTextStyles.label(
              context,
            ).copyWith(
              color: AppColors.primaryText,
            ),
          ),
        ),
      ),
    );
  }
}