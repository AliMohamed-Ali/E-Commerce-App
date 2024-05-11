import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();
  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      // textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      filledButtonTheme: _filledButtonTheme,
    );
  }

  static ColorScheme get _colorScheme {
    return const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xffDB3022),
        onPrimary: Color(0xffFFFFFF),
        primaryContainer: Color(0xfff2f3fb),
        onPrimaryContainer: Color(0xff000000),
        secondary: Color(0xff9c254d),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffdfa3b7),
        tertiary: Color(0xff2AA952), //success
        tertiaryContainer: Color(0xffe0e5ff),
        errorContainer: Color(0xfffcd8df),
        onErrorContainer: Color(0xff000000),
        surfaceVariant: Color(0xffeeeeee),
        outline: Color(0xff9B9B9B), //grey
        outlineVariant: Color(0xffbfbfbf),
        inverseSurface: Color(0xff121212),
        surfaceTint: Color(0xff909cdf),
        error: Color(0xFFF01F0E),
        onError: Color(0xFFf5e9ed),
        background: Color(0xFFF9F9F9),
        onBackground: Color(0xff000000),
        onSurface: Color(0xFF0e1016),
        surface: Color(0xFFf4f5fc));
  }

  // static TextTheme get _textTheme {
  //   const textTheme = TextTheme();
  //   final bodFont = GoogleFonts.ibmPlexSansTextTheme(textTheme);
  //   final headingFont = GoogleFonts.syneMonoTextTheme(textTheme);
  //   return bodFont.copyWith(
  //     displayLarge: headingFont.displayLarge,
  //     displayMedium: headingFont.displayMedium,
  //     displaySmall: headingFont.displaySmall,
  //     headlineLarge: headingFont.headlineLarge,
  //     headlineMedium: headingFont.headlineMedium,
  //     headlineSmall: headingFont.headlineSmall,
  //     bodyLarge: bodFont.bodyLarge,
  //     bodyMedium: bodFont.bodyMedium,
  //     bodySmall: bodFont.bodySmall,
  //   );
  // }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: _colorScheme.background,
      border: InputBorder.none,
      contentPadding: const EdgeInsets.all(12),
      enabledBorder: _enabledBorder,
      focusedBorder: _focusedBorder,
      disabledBorder: _disabledBorder,
    );
  }

  static FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static InputBorder get _enabledBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: _colorScheme.outline));
  }

  static InputBorder get _focusedBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: _colorScheme.outline));
  }

  static InputBorder get _disabledBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.withOpacity(.2)));
  }
}
