import 'package:flutter/material.dart';

abstract final class AppColors {
  // Legacy
  static const primary = Color(0xFF1565C0);
  static const primaryVariant = Color(0xFF003C8F);
  static const secondary = Color(0xFFFF6F00);
  static const background = Color(0xFFF5F5F5);
  static const surface = Color(0xFFFFFFFF);
  static const error = Color(0xFFB00020);

  static const statusOk = Color(0xFF2E7D32);
  static const statusSoon = Color(0xFFFF6F00);
  static const statusOverdue = Color(0xFFB00020);

  static const dotDone = Color(0xFF1565C0);
  static const dotPlanned = Color(0xFFFF6F00);
  static const dotOverdue = Color(0xFFB00020);

  // Splash
  static const splashBg = Color(0xFF1D2B3E);

  // Cards & surfaces
  static const cardDark = Color(0xFF334155);
  static const surfaceLight = Color(0xFFF1F5F9);
  static const surfaceMuted = Color(0xFFEFEDEF);
  static const surfaceSection = Color(0xFFF5F3F5);
  static const pageBackground = Color(0xFFFBF9FA);

  // Text
  static const textPrimary = Color(0xFF1B1B1D);
  static const textSecondary = Color(0xFF44474C);
  static const textHeader = Color(0xFF0F172A);
  static const textInactive = Color(0xFF94A3B8);
  static const textOnDark = Color(0xFFD5E3FD);
  static const textSubtleOnDark = Color(0xFF9EADC5);

  // Borders
  static const borderLight = Color(0xFFC5C6CD);
  static const borderLighter = Color(0xFFE2E8F0);

  // Auth screens
  static const textPlaceholder = Color(0xFF6B7180);

  // Icon backgrounds
  static const iconBg = Color(0xFFD2E1F7);

  // Health status dots
  static const statusGreen = Color(0xFF22C55E);
  static const statusYellow = Color(0xFFEAB308);
  static const urgentRed = Color(0xFFBA1A1A);
  static const urgentRedBg = Color(0x1ABA1A1A);

  // Badges
  static const badgeGreenBg = Color(0xFFDCFCE7);
  static const badgeGreenText = Color(0xFF15803D);
}
