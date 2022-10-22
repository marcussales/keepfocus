import 'package:get_it/get_it.dart';
import 'package:keepfocus/controllers/theme_selector_controller.dart';
import 'package:keepfocus/controllers/timer_controller.dart';

final getIt = GetIt.instance;
final TimerController timerController = getIt<TimerController>();
final ThemeSelectorController themeController =
    getIt<ThemeSelectorController>();
