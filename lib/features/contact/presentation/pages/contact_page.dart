import 'package:architecture_portfolio_web/features/contact/presentation/widgets/contact_main_section.dart';
import 'package:architecture_portfolio_web/features/home/presentation/widgets/app_footer.dart';
import 'package:architecture_portfolio_web/shared/widgets/app_navbar.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppNavbar(),
            ContactMainSection(),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}