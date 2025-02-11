import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor =Color(0XFF218482);
  static const Color scondaryColor =Color(0XFF8BB2B2);
  
  static const Color primaryContainer =Color(0X991A1C1C);
  static const Color secondaryContainer =Color(0XFFE24E47);
  static const Color errorContainer =Color(0XFF0E0E0E);
  static const Color onPrimary =Color(0XFF0E0E0E);
  static const Color onPrimaryContainer =Color(0XFFDBF9F6);

  static const Color primaryDisabledColor = Color(0x99224EA2);
  static const Color primaryDrawerColor = Color(0xFF112751);
  static const Color primaryGradientColor = Color(0xFFcdedf3);
  static const Color secondaryColor = Color(0x19218482);
  static const Color tertiaryColor = Color(0xFF009AD8);
  static const Color tagColor = Color(0xFFF79621);
  static const Color activeLabelColor = Color(0xFFFAAD51);
  static const Color activeBGColor = Color(0x19FAAD51);
  static const Color cartBGColor = Color(0xFFF7FAFF);
  static const Color redFadeColor = Color.fromARGB(255, 250, 211, 211);
  static const Color greenBGColor = Color(0x3300EC7E);
  static const Color greenLightColor = Color(0xFFEFF6F6);
  static const Color greenTxtColor = Color(0xFF009951);
  static const Color dangerColor = Color(0xFFC11C19);
  static const Color developerColor = Color(0xFFA0A9B9);

  static const Color dividerColor = Color(0x33224EA2);
  static const Color containerColor = Color(0x0C224EA2);
  static const Color transparent = Colors.transparent;

  static const Color buttonBackgroundColor = Color(0xFFA7B8DA);
  static const Color buttonBarBackgroundColor = Color(0xFFF4F6FA);
  static const Color backgroundColor = Colors.white;
  static const Color whiteColor = Colors.white;
  static Color opacitywhiteColor = Colors.white.withOpacity(0.2);
  static const Color blackColor = Colors.black;
  static const Color cardBgColor = Color(0xFFE9EDF6);
  static const Color avatarBgColor = Color(0xFFdee1e5);

  static const Color textfieldBorderColor = Color(0xFFFFFFFF);
   static const Color grayBorderColor = Color(0x498D8C8C);
/////////////////////////////////////////////////////////Text Colors//////////////////////////////////////////////////////////
  static const Color hintTextColor = Color(0xFF91918B);
  static const Color greyColor = Color(0xFFAEAEAE); //
  static const Color indicatorUnselectedColor = Color(0x33224EA2); //
 static const Color fontColor400 = Color(0xFFA1A1A1);
  static const Color notchColor = Color(0x7FC9C9C9);
  static const Color headLineColor = Color(0xff525252);

  static LinearGradient primaryBgGradient = const LinearGradient(
    colors: [primaryGradientColor, whiteColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient appBarGradient = const LinearGradient(
    colors: [greenLightColor , whiteColor],
    begin: AlignmentDirectional.topCenter,
    end: AlignmentDirectional.bottomCenter,
  );
   static BoxShadow get notfiBoxShadow => const BoxShadow(
        color: Color(0xE6218482),
        blurRadius: 14,
        offset: Offset(0, 0),
        spreadRadius: -8,
      );
  //
  // DEV COLORS
  //these colors are used for development purposes
  static const Color devRedColor = Color.fromARGB(255, 255, 0, 0);




}
