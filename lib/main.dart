import 'package:architecture_portfolio_web/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:architecture_portfolio_web/router/app_router.dart';
import 'core/constants/app_colors.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Architecture Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,

        fontFamily: AppFonts.inter,

        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: AppFonts.manrope,
          ),
          displayMedium: TextStyle(
            fontFamily: AppFonts.manrope,
          ),
          headlineLarge: TextStyle(
            fontFamily: AppFonts.manrope,
          ),
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}