import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/l10n/app_localizations.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:architecture_portfolio_web/features/about/data/model/profile_model.dart';
import 'package:architecture_portfolio_web/features/about/presentation/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutProfileSection extends ConsumerWidget {
  const AboutProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final profileAsync = ref.watch(profileProvider);

    return profileAsync.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Text(error.toString()),
      ),
      skipLoadingOnReload: true,
      data: (profile) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child: Container(
            key: ValueKey('${profile.title}-${profile.bio}'),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.aboutMe,
                        style: AppTextStyles.h3(context),
                      ),
                      SizedBox(
                        height: context.isMobile
                            ? AppSpacing.xl
                            : AppSpacing.xxl,
                      ),
                      context.isMobile
                          ? _MobileProfileContent(
                              l10n: l10n,
                              profile: profile,
                            )
                          : _DesktopProfileContent(
                              l10n: l10n,
                              profile: profile,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DesktopProfileContent extends StatelessWidget {
  const _DesktopProfileContent({
    required this.l10n,
    required this.profile,
  });

  final AppLocalizations l10n;
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 280,
          child: _ProfileImage(
            imageUrl: profile.profileImageUrl,
          ),
        ),
        const SizedBox(
          width: AppSpacing.xl,
        ),
        Expanded(
          child: _ProfileInformation(
            l10n: l10n,
            profile: profile
          ),
        ),
      ],
    );
  }
}

class _MobileProfileContent extends StatelessWidget {
  const _MobileProfileContent({
    required this.l10n,
    required this.profile,
  });

  final AppLocalizations l10n;
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProfileImage(
          imageUrl: profile.profileImageUrl,
        ),
        const SizedBox(
          height: AppSpacing.xl,
        ),
        _ProfileInformation(
          l10n: l10n,
          profile: profile,
        ),
      ],
    );
  }
}

class _ProfileInformation extends StatelessWidget {
  const _ProfileInformation({
    required this.l10n,
    required this.profile,
  });

  final AppLocalizations l10n;
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.helloIm,
          style: AppTextStyles.label(context),
        ),
        const SizedBox(
          height: AppSpacing.xs,
        ),
        Text(
          profile.name,
          style: AppTextStyles.h3(context),
        ),
        const SizedBox(
          height: AppSpacing.xs,
        ),
        Text(
          profile.title ?? '',
          style: AppTextStyles.body(context),
        ),
        const SizedBox(
          height: AppSpacing.lg,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 420,
          ),
          child: Text(
            profile.bio ?? '',
            style: AppTextStyles.body(context),
          ),
        ),
        const SizedBox(
          height: AppSpacing.lg,
        ),
        _ContactInformation(
          l10n: l10n,
          profile: profile,
        ),
      ],
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3/4,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondaryText.withValues(
            alpha: 0.08,
          ),
          border: Border.all(
            color: AppColors.secondaryText.withValues(
              alpha: 0.15,
            ),
          ),
        ),
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? Image.network(
                imageUrl!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              )
            : const Center(
                child: Icon(
                  Icons.person_outline,
                  size: 56,
                  color: AppColors.secondaryText,
                ),
              ),
      ),
    );
  }
}

class _ContactInformation extends StatelessWidget {
  const _ContactInformation({
    required this.l10n,
    required this.profile,
  });

  final AppLocalizations l10n;
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ContactItem(
          icon: Icons.location_on_outlined,
          text: profile.location ?? '',
        ),
        const SizedBox(
          height: AppSpacing.sm,
        ),
        _ContactItem(
          icon: Icons.email_outlined,
          text: profile.email ?? '',
        ),
        const SizedBox(
          height: AppSpacing.sm,
        ),
        _ContactItem(
          icon: Icons.phone_outlined,
          text: 'Masih belum ada no telpon di table db nya',
        ),
      ],
    );
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.secondaryText,
        ),
        const SizedBox(
          width: AppSpacing.sm,
        ),
        Text(
          text,
          style: AppTextStyles.body(context),
        ),
      ],
    );
  }
}