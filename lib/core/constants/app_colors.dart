import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // brand
  static const Color primary = Color(0xFF1A1A1A);
  static const Color accent = Color(0xFFF6C9D0);
  static const Color accentDeep = Color(0xFFE99BAB);
  static const Color accentSoft = Color(0xFFFCEDE8);

  // light mode
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFE5484D);
  static const Color success = Color(0xFF3EA96D);

  // semantic roles — dipake konsisten di semua page (cart, checkout, dashboard, dll)
  static const Color stepperBackground = accentSoft;   // background pill qty stepper
  static const Color stepperBorder = accentDeep;       // border/icon tombol +/-
  static const Color chipBackground = accentSoft;      // badge brand kategori
  static const Color chipText = accentDeep;            // teks di dalam chip
  static const Color deleteIconBackground = Color(0x1AE5484D); // error 10% opacity
  static const Color cardAccentBorder = accentDeep;     // aksen border kiri card produk
  static const Color ctaPrimary = primary;              // tombol utama (checkout, submit, dll)
  static const Color ctaGradientEnd = accentDeep;       // ujung gradient di CTA/banner

  // dark mode
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1C1C1E);
  static const Color darkSurfaceCard = Color(0xFF232326);
  static const Color darkTextPrimary = Color(0xFFF5F0EE);
  static const Color darkTextSecondary = Color(0xFFB8B3B0);
  static const Color darkTextHint = Color(0xFF7A7674);
  static const Color darkBorder = Color(0xFF333133);
  static const Color darkDivider = Color(0xFF2A282A);
}