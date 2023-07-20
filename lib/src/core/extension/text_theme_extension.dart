import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get appTextTheme => Theme.of(this).textTheme;
}

extension AppTextStyleExtension on TextTheme {
  TextStyle get boldDark => bodyMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w800,
      );

  TextStyle get regularDark => bodyMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  TextStyle get thinDark => bodyMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  TextStyle get boldWhite => bodyMedium!.copyWith(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w800,
      );

  TextStyle get regularWhite => bodyMedium!.copyWith(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  TextStyle get thinWhite => bodyMedium!.copyWith(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
}
