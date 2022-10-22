import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepfocus/controllers/theme_selector_controller.dart';
import 'package:keepfocus/controllers/timer_controller.dart';
import 'package:keepfocus/screens/timer/pomodoro_screen.dart';
import 'package:keepfocus/shared/global.dart';
import 'package:keepfocus/utils/colors_util.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _registerStores();
  runApp(KeepFocusApp());
}

void _registerStores() {
  final getIt = GetIt.I.registerSingleton;
  getIt(TimerController());
  getIt(ThemeSelectorController());
}

class KeepFocusApp extends StatelessWidget {
  const KeepFocusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<ThemeMode> notifier = ValueNotifier(ThemeMode.light);
    themeController.setNotifier(notifier);
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: notifier,
        builder: (_, mode, __) {
          return MaterialApp(
            title: 'Keepfocus',
            themeMode: mode,
            theme: ThemeData(
              textTheme: GoogleFonts.poppinsTextTheme(),
              brightness: Brightness.light,
              primaryColor: ColorsUtil.lightRed,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              textTheme: GoogleFonts.poppinsTextTheme(),
              primaryColor: ColorsUtil.darkRed,
            ),
            home: PomodoroScreen(),
          );
        });
  }
}
