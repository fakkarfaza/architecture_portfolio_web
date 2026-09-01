import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProjectsFilter extends StatelessWidget {
  const ProjectsFilter({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  static const List<String> categories = [
    'ALL',
    'RESIDENTIAL',
    'PUBLIC',
    'COMMUNITY',
    'HOSPITALITY',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: categories.map((category) {
        final isSelected = category == selectedCategory;

        return _FilterItem(
          title: category,
          isSelected: isSelected,
          onTap: () {
            onCategorySelected(category);
          },
        );
      }).toList(),
    );
  }
}

class _FilterItem extends StatefulWidget {
  const _FilterItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<_FilterItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.isSelected
        ? AppColors.primaryText
        : _isHovered
            ? AppColors.primaryText.withValues(alpha: 0.08)
            : Colors.transparent;

    final textColor = widget.isSelected
        ? AppColors.background
        : AppColors.primaryText;

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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: AppColors.primaryText.withValues(
                alpha: 0.3,
              ),
            ),
          ),
          child: Text(
            widget.title,
            style: AppTextStyles.label(
              context,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}