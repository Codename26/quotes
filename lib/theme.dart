import 'package:flutter/material.dart';

class SwiperTheme {
  static const Color blueTransparent = Color(0x6681d4fa);
  static const Color violetTransparent = Color(0x66ce93d8);
  static const Color pinkTransparent = Color(0x66f48fb1);
  static const Color cyanTransparent = Color(0x6680deea);
  static const Color yellowGreenTransparent = Color(0x66e6ee9c);
  static const Color yellowTransparent = Color(0x66fff59d);
  static const Color orangeTransparent = Color(0x66ffcc80);
  static const Color redTransparent = Color(0x66ffab91);
  static const Color blueGreyTransparent = Color(0x66b0bec5);

  static const TextStyle mainTextStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black);
}

class ThemeProvider {
  static const Color BAR_MAIN_COLOR = Color(0xFF2B3545);
  static const Color BACKGROUND_MAIN_COLOR = Color(0xFF293143);
  static const Color LIKE_BUTTON_START_GRADIENT = Color(0xFFFBB8B8);
  static const Color LIKE_BUTTON_FINISH_GRADIENT = Color(0xFFE049D9);
  static const Color QUOTE_ICON_SEMI_TRANSPARENT = Color(0x102B3545);
  static const Color COLOR_FULL_TRANSPARENT = Color(0xFF000000);

  static const TextStyle QUOTE_MAIN_TEXT = TextStyle(
      fontSize: 26,
      fontFamily: "PxGrotesk",
      fontWeight: FontWeight.w600,
      color: BACKGROUND_MAIN_COLOR,
      decoration: null);
  static const TextStyle QUOTE_AUTHOR_TEXT = TextStyle(
      fontSize: 16,
      fontFamily: "PxGrotesk",
      fontWeight: FontWeight.w600,
      color: BACKGROUND_MAIN_COLOR,
      decoration: null);

  static const TextStyle CATEGORIES_LIST_ITEM_ACTIVE = TextStyle(
      fontSize: 26, fontFamily: "PxGrotesk", fontWeight: FontWeight.w400, color: Colors.white, decoration: null);
  static const TextStyle CATEGORIES_LIST_ITEM_INACTIVE = TextStyle(
      fontSize: 26, fontFamily: "PxGrotesk", fontWeight: FontWeight.w400, color: Colors.white60, decoration: null);

  static Color colorPrimaryHolo = const Color(0xFF373C4A);
  static Color colorAccentHolo = const Color(0xFFF68C3D);
  static final Color transparent = Color(0x00000000);
  static final Color white = Color(0xFFFFFFFF);
  static final Color greyLight = Color(0xFFCCCCCC); // Font
  static final Color greyMedium = Color(0xFF666666); // inactive button
  static final Color grey = Color(0xFF333333); // inactive button
  static final Color buttonGrey = Color(0xFFE5E4E3); // inactive button
  static final Color greyDark = Color(0xFF1B1B1B); // appbar
  static final Color black = Color(0xFF000000); // background
  static final Color blueLight = Color(0xFF00A5DC); // Playbutton
  static final Color yellow = Color(0xFFFFA500);
  static final Color backgroundGrey = Color(0xFF1A1A1A);
  static final Color tabGrey = Color(0xFFC4C4C4);
  static final Color tabNotActiveGrey = Color(0xFFA19C9C);

  static const double BOTTOM_BAR_ICON_SIZE = 30;
}
