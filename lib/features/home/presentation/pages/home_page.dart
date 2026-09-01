import 'package:architecture_portfolio_web/features/home/presentation/widgets/about_preview_section.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/app_footer.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/contact_cta_section.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/hero_section.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/selected_projects_section.dart';
import 'package:flutter/material.dart';
import 'package:architecture_portfolio_web/shared/widgets/app_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppNavbar(),
            HeroSection(),
            SelectedProjectsSection(),
            AboutPreviewSection(),
            ContactCtaSection(),
            AppFooter()
          ],
        ),
      ),
    );
  }
}