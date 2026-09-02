import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/l10n/app_localizations.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ContactDetailsSection extends StatelessWidget {
  const ContactDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom: context.isMobile
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
              children: [
                _SectionDivider(),

                SizedBox(
                  height: context.isMobile
                      ? AppSpacing.xxl
                      : AppSpacing.xxxl,
                ),

                context.isMobile
                    ? _MobileContactDetails(
                        l10n: l10n,
                      )
                    : _DesktopContactDetails(
                        l10n: l10n,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DesktopContactDetails extends StatelessWidget {
  const _DesktopContactDetails({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: _GetInTouch(
            l10n: l10n,
          ),
        ),

        const SizedBox(
          width: AppSpacing.xxxl,
        ),

        Expanded(
          flex: 3,
          child: _FollowMe(
            l10n: l10n,
          ),
        ),

        const SizedBox(
          width: AppSpacing.xxxl,
        ),

        Expanded(
          flex: 4,
          child: _LocationMap(
            l10n: l10n,
          ),
        ),
      ],
    );
  }
}

class _MobileContactDetails extends StatelessWidget {
  const _MobileContactDetails({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _GetInTouch(
          l10n: l10n,
        ),

        const SizedBox(
          height: AppSpacing.xxl,
        ),

        _FollowMe(
          l10n: l10n,
        ),

        const SizedBox(
          height: AppSpacing.xxl,
        ),

        _LocationMap(
          l10n: l10n,
        ),
      ],
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return Center(
        child: Container(
          width: 48,
          height: 2,
          color: AppColors.primaryText.withValues(
            alpha: 0.3,
          ),
        ),
      );
    }

    return const Divider(
      color: AppColors.secondaryText,
      height: 1,
    );
  }
}

class _GetInTouch extends StatelessWidget {
  const _GetInTouch({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.getInTouch,
          style: AppTextStyles.navigation(context),
        ),

        const SizedBox(
          height: AppSpacing.lg,
        ),

        _ContactDetailRow(
          icon: Icons.email_outlined,
          value: l10n.contactEmail,
        ),

        const SizedBox(
          height: AppSpacing.md,
        ),

        _ContactDetailRow(
          icon: Icons.phone_outlined,
          value: l10n.profilePhone,
        ),

        const SizedBox(
          height: AppSpacing.md,
        ),

        _ContactDetailRow(
          icon: Icons.location_on_outlined,
          value: l10n.contactLocation,
        ),
      ],
    );
  }
}

class _ContactDetailRow extends StatelessWidget {
  const _ContactDetailRow({
    required this.icon,
    required this.value,
  });

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppColors.primaryText,
        ),

        const SizedBox(
          width: AppSpacing.sm,
        ),

        Expanded(
          child: Text(
            value,
            style: AppTextStyles.body(context),
          ),
        ),
      ],
    );
  }
}

class _FollowMe extends StatelessWidget {
  const _FollowMe({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.followMe,
          style: AppTextStyles.navigation(context),
        ),

        const SizedBox(
          height: AppSpacing.lg,
        ),

        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: const [
            _SocialButton(
              icon: Icons.camera_alt_outlined,
            ),
            _SocialButton(
              label: 'in',
            ),
            _SocialButton(
              label: 'Bē',
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    this.icon,
    this.label,
  });

  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondaryText.withValues(
            alpha: 0.4,
          ),
        ),
      ),
      child: icon != null
          ? Icon(
              icon,
              size: 20,
              color: AppColors.primaryText,
            )
          : Text(
              label ?? '',
              style: AppTextStyles.navigation(context),
            ),
    );
  }
}

class _LocationMap extends StatelessWidget {
  const _LocationMap({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.secondaryText.withValues(
              alpha: 0.3,
            ),
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.location_on_outlined,
            size: 42,
            color: AppColors.secondaryText,
          ),
        ),
      ),
    );
  }
}