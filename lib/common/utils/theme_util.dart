import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/styles/component_theme.dart';
import '../extensions/context_extension.dart';

class ThemeUtil {
  final BuildContext context;

  ThemeUtil({
    required this.context,
  });

  /// Themes Mode
  /// Note : in this getter color scheme binded manually and not retrieved
  /// from context.theme because the color scheme is not yet binded to the
  /// build tree. But after the main file using this themes it will be available
  /// to retrieved from context.theme
  /// ```dart
  /// MaterialApp(
  ///   title: 'Cart It Out',
  ///   themeMode: ThemeMode.light,
  ///   theme: provider.themeUtil.lightTheme,
  ///   darkTheme: provider.themeUtil.darkTheme,
  ///   routes: provider.routeUtil.routes,
  ///   initialRoute: provider.routeUtil.initialRoute,
  /// ),
  /// ```

  ThemeData get lightTheme => ThemeData(
        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: lightColorScheme.surface,
        useMaterial3: true,
        bottomNavigationBarTheme:
            lightComponentTheme.bottomNavigationBarThemeData,
        appBarTheme: lightComponentTheme.appBarThemeData,
        inputDecorationTheme: lightComponentTheme.inputDecorationTheme,
        textTheme: lightTextTheme,
        iconTheme: lightComponentTheme.iconThemeData,
        chipTheme: lightComponentTheme.chipThemeData,
        navigationBarTheme: lightComponentTheme.navigationBarThemeData,
        dividerTheme: lightComponentTheme.dividerThemeData,
        elevatedButtonTheme: lightComponentTheme.elevatedButtonThemeData,
        outlinedButtonTheme: lightComponentTheme.outlinedButtonThemeData,
        textButtonTheme: lightComponentTheme.textButtonThemeData,
        popupMenuTheme: lightComponentTheme.popupMenuThemeData,
        toggleButtonsTheme: lightComponentTheme.toggleButtonsThemeData,
        snackBarTheme: lightComponentTheme.snackBarThemeData,
        tooltipTheme: lightComponentTheme.tooltipThemeData,
        dropdownMenuTheme: darkComponentTheme.dropdownMenuThemeData,
      );

  ThemeData get darkTheme => ThemeData(
        colorScheme: darkColorScheme,
        scaffoldBackgroundColor: darkColorScheme.surface,
        useMaterial3: true,
        bottomNavigationBarTheme:
            darkComponentTheme.bottomNavigationBarThemeData,
        appBarTheme: darkComponentTheme.appBarThemeData,
        inputDecorationTheme: darkComponentTheme.inputDecorationTheme,
        textTheme: darkTextTheme,
        iconTheme: darkComponentTheme.iconThemeData,
        chipTheme: darkComponentTheme.chipThemeData,
        dividerTheme: darkComponentTheme.dividerThemeData,
        textButtonTheme: darkComponentTheme.textButtonThemeData,
        elevatedButtonTheme: darkComponentTheme.elevatedButtonThemeData,
        outlinedButtonTheme: darkComponentTheme.outlinedButtonThemeData,
        popupMenuTheme: darkComponentTheme.popupMenuThemeData,
        toggleButtonsTheme: darkComponentTheme.toggleButtonsThemeData,
        snackBarTheme: darkComponentTheme.snackBarThemeData,
        tooltipTheme: darkComponentTheme.tooltipThemeData,
        dropdownMenuTheme: darkComponentTheme.dropdownMenuThemeData,
      );

  /// Componen Theme
  ComponentTheme get lightComponentTheme => ComponentTheme(
        context: context,
        colorScheme: lightColorScheme,
      );

  ComponentTheme get darkComponentTheme => ComponentTheme(
        context: context,
        colorScheme: darkColorScheme,
      );

  /// ColorScheme
  ColorScheme get lightColorScheme => ColorScheme.fromSwatch(
        primarySwatch: Colors.cyan,
      );

  ColorScheme get darkColorScheme => ColorScheme.fromSwatch(
        primarySwatch: Colors.cyan,
      );

  /// Text Theme
  TextTheme get lightTextTheme => GoogleFonts.interTextTheme().apply(
        bodyColor: lightColorScheme.onSurface,
        displayColor: lightColorScheme.onSurface,
        decorationColor: lightColorScheme.onSurface,
      );

  TextTheme get darkTextTheme => GoogleFonts.poppinsTextTheme().apply(
        bodyColor: darkColorScheme.onSurface,
        displayColor: darkColorScheme.onSurface,
        decorationColor: darkColorScheme.onSurface,
      );

  /// Method util
  static ThemeData theme(BuildContext context) => context.theme;

  ColorScheme get themeColorScheme => theme(context).colorScheme;

  Brightness get themeBrightness => themeColorScheme.brightness;

  bool get isBrightnessLight => themeBrightness == Brightness.light;

  bool get isBrightnessDark => themeBrightness == Brightness.dark;

  TextTheme get textTheme => theme(context).textTheme;
}
