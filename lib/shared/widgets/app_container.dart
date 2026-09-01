import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_spacing.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppSizes.maxContentWidth,
        ),
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
              ),
          child: child,
        ),
      ),
    );
  }
}