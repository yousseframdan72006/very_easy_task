import 'package:flutter/material.dart';

abstract final class AppColors {
  // ── Backgrounds ──────────────────────────────────────────
  static const Color bgDeep    = Color(0xFF0A0E1A);
  static const Color bgCard    = Color(0xFF111827);
  static const Color bgSurface = Color(0xFF1A2235);

  // ── Neon Accents ─────────────────────────────────────────
  static const Color neonCyan   = Color(0xFF00E5FF);
  static const Color neonTeal   = Color(0xFF0EFFC4);
  static const Color accentGold = Color(0xFFFFD166);
  static const Color accentRose = Color(0xFFFF6B9D);
  static const Color accentViolet = Color(0xFFB388FF);

  // ── Text ─────────────────────────────────────────────────
  static const Color textPrimary   = Color(0xFFEAF0FF);
  static const Color textSecondary = Color(0xFF8899BB);
  static const Color textMuted     = Color(0xFF4A5878);

  // ── Gradients ────────────────────────────────────────────
  static const LinearGradient bgGradient = LinearGradient(
    colors: [bgDeep, Color(0xFF0D1528)],
    begin: Alignment.topCenter,
    end:   Alignment.bottomCenter,
  );

  static const LinearGradient neonGradient = LinearGradient(
    colors: [neonCyan, neonTeal],
    begin: Alignment.topLeft,
    end:   Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF1A2235), Color(0xFF111827)],
    begin: Alignment.topLeft,
    end:   Alignment.bottomRight,
  );
}
