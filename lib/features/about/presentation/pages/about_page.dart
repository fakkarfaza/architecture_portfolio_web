import 'package:architecture_portfolio_web/features/about/presentation/widgets/about_information_section.dart';
import 'package:architecture_portfolio_web/features/about/presentation/widgets/about_profile_section.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/app_footer.dart';
import 'package:architecture_portfolio_web/shared/widgets/app_navbar.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppNavbar(),
            AboutProfileSection(),
            AboutInformationSection(),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}