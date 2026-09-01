import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/l10n/app_localizations.dart';
import 'package:architecture_portfolio_web/core/localization/locale_controller.dart';
import 'package:architecture_portfolio_web/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'router/app_router.dart';

class ArchitecturePortfolioApp extends StatelessWidget {
  const ArchitecturePortfolioApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: localeController,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,

          routerConfig: AppRouter.router,

          locale: localeController.locale,

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          supportedLocales: const [
            Locale('en'),
            Locale('id'),
          ],

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
        );
      },
    );
  }
}