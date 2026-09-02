import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/l10n/app_localizations.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ContactHeroSection extends StatelessWidget {
  const ContactHeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
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
            child: context.isMobile
                ? _MobileContactHero(
                    l10n: l10n,
                  )
                : _DesktopContactHero(
                    l10n: l10n,
                  ),
          ),
        ),
      ),
    );
  }
}

class _DesktopContactHero extends StatelessWidget {
  const _DesktopContactHero({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: _ContactHeroContent(
            l10n: l10n,
          ),
        ),

        const SizedBox(
          width: AppSpacing.xxxl,
        ),

        Expanded(
          flex: 6,
          child: _ContactForm(
            l10n: l10n,
          ),
        ),
      ],
    );
  }
}

class _MobileContactHero extends StatelessWidget {
  const _MobileContactHero({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ContactHeroContent(
          l10n: l10n,
        ),

        const SizedBox(
          height: AppSpacing.xxxl,
        ),

        _ContactForm(
          l10n: l10n,
        ),
      ],
    );
  }
}

class _ContactHeroContent extends StatelessWidget {
  const _ContactHeroContent({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.contact,
          style: AppTextStyles.label(context),
        ),

        const SizedBox(
          height: AppSpacing.lg,
        ),

        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 460,
          ),
          child: Text(
            l10n.contactHeadline,
            style: AppTextStyles.h1(context),
          ),
        ),

        const SizedBox(
          height: AppSpacing.lg,
        ),

        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400,
          ),
          child: Text(
            l10n.contactDescription,
            style: AppTextStyles.bodyLarge(context),
          ),
        ),
      ],
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ContactTextField(
          controller: _nameController,
          label: widget.l10n.yourName,
        ),

        const SizedBox(
          height: AppSpacing.lg,
        ),

        _ContactTextField(
          controller: _emailController,
          label: widget.l10n.emailAddress,
        ),

        const SizedBox(
          height: AppSpacing.lg,
        ),

        _ContactTextField(
          controller: _subjectController,
          label: widget.l10n.subject,
        ),

        const SizedBox(
          height: AppSpacing.xl,
        ),

        _ContactTextField(
          controller: _messageController,
          label: widget.l10n.yourMessage,
          maxLines: 5,
        ),

        const SizedBox(
          height: AppSpacing.sm,
        ),

        _ContactSubmitButton(
          label: widget.l10n.sendMessage,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _ContactTextField extends StatelessWidget {
  const _ContactTextField({
    required this.controller,
    required this.label,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String label;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: AppTextStyles.label(context),
        ),

        const SizedBox(
          height: AppSpacing.sm,
        ),

        TextField(
          controller: controller,
          maxLines: maxLines,
          cursorColor: AppColors.primaryText,
          style: AppTextStyles.body(context),
          decoration: const InputDecoration(
            isDense: true,
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.secondaryText,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.secondaryText,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactSubmitButton extends StatelessWidget {
  const _ContactSubmitButton({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryText,
          ),
        ),
        child: Text(
          label.toUpperCase(),
          style: AppTextStyles.label(context),
        ),
      ),
    );
  }
}