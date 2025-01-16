import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/providers/global_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final provider = ref.watch(globalProvider);
    return ValueListenableBuilder<ThemeMode?>(
      valueListenable: provider.themeMode,
      builder: (context, themeMode, child) => MaterialApp(
        title: 'Saldo',
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        theme: provider.themeUtil(context).lightTheme,
        darkTheme: provider.themeUtil(context).darkTheme,
        routes: provider.routeUtil(context).routes,
        initialRoute: provider.routeUtil(context).initialRoute,
        onGenerateRoute: provider.routeUtil(context).onGenerateRoute,
        // locale: provider.currentLocale,
        // supportedLocales: provider.supportedLocales,
        // localizationsDelegates: provider.localizationsDelegates,
        navigatorKey: provider.navigatorKey,
        navigatorObservers: [
          RouteObserver<PageRoute>(),
        ],
      ),
    );
  }
}
