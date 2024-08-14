import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_tracker/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedTheme: savedThemeMode));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, this.savedTheme});
  final GoRouter router = GoRouter(routes: $appRoutes);
  final AdaptiveThemeMode? savedTheme;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: savedTheme ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'JobTracker',
        theme: theme.copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme)),
        darkTheme: darkTheme.copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(darkTheme.textTheme)),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
