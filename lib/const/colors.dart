import 'package:flutter/material.dart';

abstract class ThemedColor {
  Color get white;
  Color get boxShadow;
  Color get primary;
  Color get primary1;
  Color get primary2;
  Color get textColor1;
  Color get textColor2;
  Color get textColor3;
  Color get appBlue;
  Color get borderColor;
  Color get backgroundColor;
}

class ThemedColorLight implements ThemedColor {
  @override
  Color get white => const Color(0xffffffff);
  @override
  Color get boxShadow => const Color(0x33000029);
  @override
  Color get primary => const Color(0xff81E6D9);
  @override
  Color get primary1 => const Color(0xff319795);
  @override
  Color get primary2 => const Color(0xffE6FFFA);
  @override
  Color get textColor1 => const Color(0xff2D3748);
  @override
  Color get textColor2 => const Color(0xff4A5568);
  @override
  Color get textColor3 => const Color(0xff718096);
  @override
  Color get appBlue => const Color(0xff3182CE);
  @override
  Color get borderColor => const Color(0xffCBD5E0);
  @override
  Color get backgroundColor => const Color(0xffF7FAFC);
}

class ThemedColorDark implements ThemedColor {
  @override
  Color get white => const Color(0xffffffff);
  @override
  Color get boxShadow => const Color(0x33000029);
  @override
  Color get primary => const Color(0xff81E6D9);
  @override
  Color get primary1 => const Color(0xff319795);
  @override
  Color get primary2 => const Color(0xffE6FFFA);
  @override
  Color get textColor1 => const Color(0xff2D3748);
  @override
  Color get textColor2 => const Color(0xff4A5568);
  @override
  Color get textColor3 => const Color(0xff718096);
  @override
  Color get appBlue => const Color(0xff3182CE);
  @override
  Color get borderColor => const Color(0xffCBD5E0);
  @override
  Color get backgroundColor => const Color(0xffF7FAFC);
}

class AppColors {
  static ThemedColor themedColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? ThemedColorDark()
          : ThemedColorLight();
  static ThemedColor get lightColor => ThemedColorLight();
  static ThemedColor get darkColor => ThemedColorDark();
}
