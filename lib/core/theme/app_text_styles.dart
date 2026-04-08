import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract final class AppTextStyles {
  // ── Display ──────────────────────────────────────────────
  static TextStyle get display => GoogleFonts.outfit(
        fontSize: 36.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
      );

  static TextStyle get heading1 => GoogleFonts.outfit(
        fontSize: 26.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        letterSpacing: 0.3,
      );

  static TextStyle get heading2 => GoogleFonts.outfit(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  static TextStyle get heading3 => GoogleFonts.outfit(
        fontSize: 17.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  // ── Body ─────────────────────────────────────────────────
  static TextStyle get body => GoogleFonts.outfit(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodySmall => GoogleFonts.outfit(
        fontSize: 13.sp,
        color: AppColors.textSecondary,
      );

  // ── Label ────────────────────────────────────────────────
  static TextStyle get label => GoogleFonts.outfit(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
      );

  static TextStyle get labelMuted => GoogleFonts.outfit(
        fontSize: 11.sp,
        color: AppColors.textMuted,
      );

  static TextStyle get caption => GoogleFonts.outfit(
        fontSize: 10.sp,
        color: AppColors.textSecondary,
      );

  // ── Accent ───────────────────────────────────────────────
  static TextStyle neon({double? size}) => GoogleFonts.outfit(
        fontSize: size?.sp ?? 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.neonCyan,
      );
}
