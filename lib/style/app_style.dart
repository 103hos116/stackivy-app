import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackivyStyle {
  static TextStyle _defaultTextStyle(
    Color color,
    double size,
    FontWeight fontWeight,
  ) {
    return GoogleFonts.spaceGrotesk(
      textStyle: TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: fontWeight,
      ),
    );
  }

  /// Returns a [TextStyle] that uses the default font Family (spacegrotesk)
  /// with default 'fontWeight' of [FontWeight.w700].
  static TextStyle bold({
    required Color color,
    required double fontSize,
  }) =>
      _defaultTextStyle(
        color,
        fontSize,
        FontWeight.w700,
      );

  /// Returns a [TextStyle] that uses the default font Family (spacegrotesk)
  /// with default 'fontWeight' of [FontWeight.w600].
  static TextStyle semiBold({
    required Color color,
    required double fontSize,
  }) =>
      _defaultTextStyle(color, fontSize, FontWeight.w600);

  /// Returns a [TextStyle] that uses the default font Family (spacegrotesk)
  /// with default 'fontWeight' of [FontWeight.w500].
  static TextStyle medium({
    required Color color,
    required double fontSize,
  }) =>
      _defaultTextStyle(
        color,
        fontSize,
        FontWeight.w500,
      );

  /// Returns a [TextStyle] that uses the default font Family (spacegrotesk)
  /// with default 'fontWeight' of [FontWeight.w500].
  static TextStyle normal({
    required Color color,
    required double fontSize,
  }) =>
      _defaultTextStyle(
        color,
        fontSize,
        FontWeight.w500,
      );

  /// Returns a [TextStyle] that uses the default font Family (spacegrotesk)
  /// with default 'fontWeight' of [FontWeight.w400].
  static TextStyle regular({
    required Color color,
    required double fontSize,
  }) =>
      _defaultTextStyle(color, fontSize, FontWeight.w400);
}
