import 'package:flutter/material.dart';
import 'package:keepfocus/controllers/timer_controller.dart';
import 'package:keepfocus/shared/global.dart';
import 'package:mobx/mobx.dart';
import 'dart:ui';

import '../utils/colors_util.dart';
part 'theme_selector_controller.g.dart';

class ThemeSelectorController = _ThemeSelectorControllerBase
    with _$ThemeSelectorController;

enum ThemeSelectorENUM { LIGHT, DARK }

abstract class _ThemeSelectorControllerBase with Store {
  @observable
  ThemeSelectorENUM currentTheme = ThemeMode.system == ThemeMode.light
      ? ThemeSelectorENUM.LIGHT
      : ThemeSelectorENUM.DARK;

  @observable
  ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.system);

  @action
  void setNotifier(ValueNotifier<ThemeMode> notifier) {
    _notifier = notifier;
  }

  @action
  void changeTheme() {
    _notifier.value = currentTheme == ThemeSelectorENUM.LIGHT
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  @action
  void setCurrentTheme({ThemeSelectorENUM? theme}) {
    currentTheme = theme ?? currentTheme;
    changeTheme();
  }

  @computed
  bool get isLightTheme => currentTheme == ThemeSelectorENUM.LIGHT;

  @computed
  Color get backgroundColor {
    Color lightColor = timerController.type == TimerTypeENUM.FOCUS
        ? ColorsUtil.lightRed
        : ColorsUtil.lightGreen;
    Color darkColor = timerController.type == TimerTypeENUM.FOCUS
        ? ColorsUtil.darkRed
        : ColorsUtil.darkGreen;
    if (timerController.currentCicle.id == 3 && timerController.relaxed) {
      return ColorsUtil.success;
    }

    return isLightTheme ? lightColor : darkColor;
  }
}
