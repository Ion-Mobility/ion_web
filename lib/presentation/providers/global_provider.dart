import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/utils/route_util.dart';
import '../../common/utils/theme_util.dart';

class GlobalProvider extends ChangeNotifier {
  GlobalProvider() {
    initState();
  }

  final globalMessanger = StreamController<dynamic>.broadcast();

  /// Utils
  bool get isPlatformIos => Platform.isIOS;
  bool get isPlatformAndroid => Platform.isAndroid;
  bool get isPlatformWindows => Platform.isWindows;
  bool get isDarkMode => (themeMode.value == ThemeMode.dark);
  bool get isLightMode => (themeMode.value == ThemeMode.light);
  bool get isDefaultMode => (themeMode.value == ThemeMode.system);
  Stream get globalMessangerStream => globalMessanger.stream;
  RouteUtil routeUtil(BuildContext context) => RouteUtil(context: context);
  ThemeUtil themeUtil(BuildContext context) => ThemeUtil(context: context);
  // Iterable<Locale> get supportedLocales => CoreLocalization.supportedLocales;
  // Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
  //       const CoreLocalizationDelegate(),
  //       GlobalMaterialLocalizations.delegate,
  //       GlobalCupertinoLocalizations.delegate,
  //       GlobalWidgetsLocalizations.delegate,
  //     ];
  GlobalKey<NavigatorState> get navigatorKey => RouteUtil.navigatorKey;

  /// Utils extension
  Size deviceSize(BuildContext innerContext) =>
      MediaQuery.of(innerContext).size;

  /// Theme state
  final themeMode = ValueNotifier(
    ThemeMode.light,
  );
  // var currentLocale = StringId.locale;

  void initState() {}

  /// Method section
  void retrievePreferences() {
    switchBrightness(
      ThemeMode.light,
    );
  }

  void switchBrightness(ThemeMode value) {
    themeMode.value = value;
  }

  // void changeLocale(Locale locale) {
  //   currentLocale = locale;
  //   notifyListeners();
  // }

  void sendMessage(dynamic message) {
    globalMessanger.add(message);
  }
}

final globalProvider = ChangeNotifierProvider<GlobalProvider>(
  (ref) {
    return GlobalProvider();
  },
);
