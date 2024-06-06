import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

// Color Styles
const Color primaryColor = Color(0xFF7EC1EB);
const Color Darkblu = Color(0xff24A1EF);
const Color lightGrey = Color(0xFFEBEBEB);
const Color darkGrey = Color(0xFF8A8A8A);

// margin and padding
const double defaultMargin = 15.0;
const double defaultPadding = 24;

// Text Styles
figmaFontsize(int fontSize) {
  return fontSize * 1.1;
}

// Headline Text Styles
// Large
TextStyle tsHeadlineLargeRegular(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(28),
  );
}

TextStyle tsHeadlineLargeMedium(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(28),
  );
}

TextStyle tsHeadlineLargeSemibold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(28),
  );
}

TextStyle tsHeadlineLargeBold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(28),
  );
}

// Medium
TextStyle tsHeadlineMediumRegular(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(26),
  );
}

TextStyle tsHeadlineMediumMedium(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(26),
  );
}

TextStyle tsHeadlineMediumSemibold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(26),
  );
}

TextStyle tsHeadlineMediumBold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(26),
  );
}

// Small
TextStyle tsHeadlineSmallRegular(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(24),
  );
}

TextStyle tsHeadlineSmallMedium(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(24),
  );
}

TextStyle tsHeadlineSmallSemibold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(24),
  );
}

TextStyle tsHeadlineSmallBold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(24),
  );
}

// Title Text Styles
// Large
TextStyle tsTitleLargeRegular(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(22),
  );
}

TextStyle tsTitleLargeMedium(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(22),
  );
}

TextStyle tsTitleLargeSemibold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(22),
  );
}

TextStyle tsTitleLargeBold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(22),
  );
}

// Medium
TextStyle tsTitleMediumRegular(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(20),
  );
}

TextStyle tsTitleMediumMedium(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(20),
  );
}

TextStyle tsTitleMediumSemibold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(20),
  );
}

TextStyle tsTitleMediumBold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(20),
  );
}

// Small
TextStyle tsTitleSmallRegular(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(18),
  );
}

TextStyle tsTitleSmallMedium(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(18),
  );
}

TextStyle tsTitleSmallSemibold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(18),
  );
}

TextStyle tsTitleSmallBold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(18),
  );
}

// Body Text Styles
// Large
TextStyle tsBodyLargeRegular(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(16),
  );
}

TextStyle tsBodyLargeMedium(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(16),
  );
}

TextStyle tsBodyLargeSemibold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(16),
  );
}

TextStyle tsBodyLargeBold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(16),
  );
}

// Medium
TextStyle tsBodyMediumRegular(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(14),
  );
}

TextStyle tsBodyMediumMedium(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(14),
  );
}

TextStyle tsBodyMediumSemibold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(14),
  );
}

TextStyle tsBodyMediumBold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(14),
  );
}

// Small
TextStyle tsBodySmallRegular(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(12),
  );
}

TextStyle tsBodySmallMedium(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(12),
  );
}

TextStyle tsBodySmallSemibold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(12),
  );
}

TextStyle tsBodySmallBold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(12),
  );
}

// Label Text Styles
// Large
TextStyle tsLabelLargeRegular(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(10),
  );
}

TextStyle tsLabelLargeMedium(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(10),
  );
}

TextStyle tsLabelLargeSemibold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(10),
  );
}

TextStyle tsLabelLargeBold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(10),
  );
}

// Medium
TextStyle tsLabelMediumRegular(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(8),
  );
}

TextStyle tsLabelMediumMedium(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(8),
  );
}

TextStyle tsLabelMediumSemibold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(8),
  );
}

TextStyle tsLabelMediumBold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(8),
  );
}

// Small
TextStyle tsLabelSmallRegular(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(6),
  );
}

TextStyle tsLabelSmallMedium(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(6),
  );
}

TextStyle tsLabelSmallSemibold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(6),
  );
}

TextStyle tsLabelSmallBold(Color color) {
  return GoogleFonts.poppins(
    color: color,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(6),
  );
}
