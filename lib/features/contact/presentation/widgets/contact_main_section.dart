import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/constants/app_sizes.dart';
import 'package:architecture_portfolio_web/core/constants/app_spacing.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/l10n/app_localizations.dart';
import 'package:architecture_portfolio_web/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ContactMainSection extends StatelessWidget {
  const ContactMainSection({
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
                ? _MobileContactLayout(
                    l10n: l10n,
                  )
                : _DesktopContactLayout(
                    l10n: l10n,
                  ),
          ),
        ),
      ),
    );
  }
}

class _DesktopContactLayout extends StatelessWidget {
  const _DesktopContactLayout({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: _ContactInformation(
            l10n: l10n,
          ),
        ),

        const SizedBox(
          width: AppSpacing.xxxl,
        ),

        Expanded(
          flex: 5,
          child: _ContactForm(
            l10n: l10n,
          ),
        ),
      ],
    );
  }
}

class _MobileContactLayout extends StatelessWidget {
  const _MobileContactLayout({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ContactInformation(
          l10n: l10n,
        ),

        const SizedBox(
          height: AppSpacing.xxl,
        ),

        _ContactForm(
          l10n: l10n,
        ),
      ],
    );
  }
}

class _ContactInformation extends StatelessWidget {
  const _ContactInformation({
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

        Text(
          l10n.contactHeadline,
          style: AppTextStyles.h1(context),
        ),

        const SizedBox(
          height: AppSpacing.lg,
        ),

        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 460,
          ),
          child: Text(
            l10n.contactDescription,
            style: AppTextStyles.bodyLarge(context),
          ),
        ),

        const SizedBox(
          height: AppSpacing.xxl,
        ),

        _ContactInfoGroup(
          title: l10n.getInTouch,
          children: [
            _ContactInfoItem(
              label: l10n.email,
              value: l10n.contactEmail,
            ),
            _ContactInfoItem(
              label: l10n.location,
              value: l10n.contactLocation,
            ),
        ],
        ),

        const SizedBox(
          height: AppSpacing.xl,
        ),

        _ContactInfoGroup(
          title: l10n.followMe,
          children: [
            _ContactInfoItem(
              label: 'INSTAGRAM',
              value: l10n.instagram,
            ),
            _ContactInfoItem(
              label: 'LINKEDIN',
              value: l10n.linkedin,
            ),
            _ContactInfoItem(
              label: 'BEHANCE',
              value: l10n.behance,
            ),
          ],
        ),
      ],
    );
  }
}

class _ContactInfoGroup extends StatelessWidget {
  const _ContactInfoGroup({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

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
          height: AppSpacing.md,
        ),

        ...children,
      ],
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  const _ContactInfoItem({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.label(context),
          ),

          const SizedBox(
            height: AppSpacing.xs,
          ),

          Text(
            value,
            style: AppTextStyles.body(context),
          ),
        ],
      ),
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
          height: AppSpacing.lg,
        ),

        _ContactTextField(
          controller: _messageController,
          label: widget.l10n.yourMessage,
          maxLines: 6,
        ),

        const SizedBox(
          height: AppSpacing.xl,
        ),

        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton(
            onPressed: () {
              // Contact form submission will be
              // implemented when backend is available.
            },
            child: Text(
              widget.l10n.sendMessage,
            ),
          ),
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
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: AppTextStyles.body(context),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.label(context),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.secondaryText,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryText,
          ),
        ),
      ),
    );
  }
}