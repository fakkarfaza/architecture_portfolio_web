import 'package:architecture_portfolio_web/core/constants/app_colors.dart';
import 'package:architecture_portfolio_web/core/extensions/context_extensions.dart';
import 'package:architecture_portfolio_web/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle navigation(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.inter,
      fontSize: context.isMobile ? 11 : 12,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: 1.2,
      color: color ?? AppColors.primaryText,
    );
  }

  static TextStyle logo(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.manrope,
      fontSize: context.isMobile ? 16 : 18,
      fontWeight: fontWeight ?? FontWeight.w700,
      letterSpacing: 1,
      color: color ?? AppColors.primaryText,
    );
  }

  static TextStyle hero(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.manrope,
      fontSize: _heroSize(context),
      fontWeight: fontWeight ?? FontWeight.w700,
      height: 1.05,
      color: color ?? AppColors.primaryText,
    );
  }

  static TextStyle h1(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.manrope,
      fontSize: _h1Size(context),
      fontWeight: fontWeight ?? FontWeight.w700,
      height: 1.1,
      color: color ?? AppColors.primaryText,
    );
  }

  static TextStyle h2(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.manrope,
      fontSize: _h2Size(context),
      fontWeight: fontWeight ?? FontWeight.w600,
      height: 1.15,
      color: color ?? AppColors.primaryText,
    );
  }

  static TextStyle h3(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.manrope,
      fontSize: _h3Size(context),
      fontWeight: fontWeight ?? FontWeight.w600,
      height: 1.2,
      color: color ?? AppColors.primaryText,
    );
  }

  static TextStyle bodyLarge(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.inter,
      fontSize: context.isMobile ? 16 : 18,
      fontWeight: fontWeight ?? FontWeight.w400,
      height: 1.6,
      color: color ?? AppColors.primaryText,
    );
  }

  static TextStyle body(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.inter,
      fontSize: context.isMobile ? 14 : 16,
      fontWeight: fontWeight ?? FontWeight.w400,
      height: 1.5,
      color: color ?? AppColors.primaryText,
    );
  }

  static TextStyle label(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: AppFonts.inter,
      fontSize: context.isMobile ? 11 : 12,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: 1.5,
      color: color ?? AppColors.secondaryText,
    );
  }

  static double _heroSize(BuildContext context) {
    if (context.isMobile) return 48;
    if (context.isTablet) return 72;
    return 96;
  }

  static double _h1Size(BuildContext context) {
    if (context.isMobile) return 40;
    if (context.isTablet) return 52;
    return 64;
  }

  static double _h2Size(BuildContext context) {
    if (context.isMobile) return 32;
    if (context.isTablet) return 40;
    return 48;
  }

  static double _h3Size(BuildContext context) {
    if (context.isMobile) return 24;
    if (context.isTablet) return 28;
    return 32;
  }
}