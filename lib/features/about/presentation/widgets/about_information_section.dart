import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/l10n/app_localizations.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AboutInformationSection extends StatelessWidget {
  const AboutInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
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
                  ? AppSpacing.xxl
                  : AppSpacing.xxxl,
            ),
            child: context.isMobile
                ? _MobileLayout(
                    l10n: l10n,
                  )
                : _DesktopLayout(
                    l10n: l10n,
                  ),
          ),
        ),
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _EducationContent(
                l10n: l10n,
              ),
              const SizedBox(
                height: AppSpacing.xxl,
              ),
              _ExperienceContent(
                l10n: l10n,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: AppSpacing.xxxl,
        ),
        Expanded(
          child: _SkillsContent(
            l10n: l10n,
          ),
        ),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _EducationContent(
          l10n: l10n,
        ),
        const SizedBox(
          height: AppSpacing.xxl,
        ),
        _ExperienceContent(
          l10n: l10n,
        ),
        const SizedBox(
          height: AppSpacing.xxl,
        ),
        _SkillsContent(
          l10n: l10n,
        ),
      ],
    );
  }
}

class _EducationContent extends StatelessWidget {
  const _EducationContent({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return _InformationSection(
      title: l10n.education,
      child: _TimelineItem(
        period: l10n.educationPeriod,
        title: l10n.educationDegree,
        subtitle: l10n.educationUniversity,
      ),
    );
  }
}

class _ExperienceContent extends StatelessWidget {
  const _ExperienceContent({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return _InformationSection(
      title: l10n.experience,
      child: Column(
        children: [
          _TimelineItem(
            period: l10n.experiencePeriodOne,
            title: l10n.experienceTitleOne,
            subtitle: l10n.experienceCompanyOne,
            descriptions: [
              l10n.experienceDescriptionOne,
              l10n.experienceDescriptionTwo,
            ],
          ),
          const SizedBox(
            height: AppSpacing.lg,
          ),
          _TimelineItem(
            period: l10n.experiencePeriodTwo,
            title: l10n.experienceTitleTwo,
            subtitle: l10n.experienceCompanyTwo,
            descriptions: [
              l10n.experienceDescriptionThree,
              l10n.experienceDescriptionFour,
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillsContent extends StatelessWidget {
  const _SkillsContent({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return _InformationSection(
      title: l10n.skills,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SkillGroup(
            title: l10n.designSkills,
            skills: [
              l10n.interiorDesign,
              l10n.urbanDesign,
              l10n.landscapeDesign,
              l10n.sustainableDesign,
            ],
          ),
          const SizedBox(
            height: AppSpacing.xl,
          ),
          _SkillGroup(
            title: l10n.softwareSkills,
            skills: [
              l10n.autoCad,
              l10n.revit,
              l10n.sketchup,
              l10n.lumion,
              l10n.enscape,
              l10n.photoshop,
              l10n.rhino,
            ],
            showLevels: true,
          ),
        ],
      ),
    );
  }
}

class _InformationSection extends StatelessWidget {
  const _InformationSection({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.navigation(context),
        ),
        const SizedBox(
          height: AppSpacing.lg,
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.secondaryText.withValues(
            alpha: 0.2,
          ),
        ),
        const SizedBox(
          height: AppSpacing.lg,
        ),
        child,
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.period,
    required this.title,
    required this.subtitle,
    this.descriptions = const [],
  });

  final String period;
  final String title;
  final String subtitle;
  final List<String> descriptions;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: context.isMobile ? 70 : 80,
          child: Text(
            period,
            style: AppTextStyles.label(context),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.body(context),
              ),
              const SizedBox(
                height: AppSpacing.xs,
              ),
              Text(
                subtitle,
                style: AppTextStyles.body(context),
              ),
              if (descriptions.isNotEmpty) ...[
                const SizedBox(
                  height: AppSpacing.sm,
                ),
                ...descriptions.map(
                  (description) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: AppSpacing.xs,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('•'),
                        const SizedBox(
                          width: AppSpacing.sm,
                        ),
                        Expanded(
                          child: Text(
                            description,
                            style: AppTextStyles.body(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SkillGroup extends StatelessWidget {
  const _SkillGroup({
    required this.title,
    required this.skills,
    this.showLevels = false,
  });

  final String title;
  final List<String> skills;
  final bool showLevels;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.label(context),
        ),
        const SizedBox(
          height: AppSpacing.md,
        ),
        ...skills.map(
          (skill) => Padding(
            padding: const EdgeInsets.only(
              bottom: AppSpacing.sm,
            ),
            child: showLevels
                ? _SoftwareSkillItem(
                    title: skill,
                  )
                : Row(
                    children: [
                      const Text('•'),
                      const SizedBox(
                        width: AppSpacing.sm,
                      ),
                      Text(
                        skill,
                        style: AppTextStyles.body(context),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}

class _SoftwareSkillItem extends StatelessWidget {
  const _SoftwareSkillItem({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: context.isMobile ? 110 : 130,
          child: Text(
            title,
            style: AppTextStyles.body(context),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.secondaryText.withValues(
              alpha: 0.35,
            ),
          ),
        ),
      ],
    );
  }
}