import 'package:flutter/material.dart';
import 'package:mivoe/mivoe.dart';

extension TextStyling on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get withWhiteOpacity =>
      copyWith(color: Colors.white.withOpacity(0.6));
  TextStyle get purple => copyWith(color: AppTheme.purple);
}
