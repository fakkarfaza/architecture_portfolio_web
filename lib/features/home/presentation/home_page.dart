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

            Container(
              height: 800,
              alignment: Alignment.center,
              child: const Text(
                'HOME PAGE',
              ),
            ),
          ],
        ),
      ),
    );
  }
}