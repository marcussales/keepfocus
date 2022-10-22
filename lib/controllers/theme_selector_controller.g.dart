// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_selector_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeSelectorController on _ThemeSelectorControllerBase, Store {
  Computed<bool>? _$isLightThemeComputed;

  @override
  bool get isLightTheme =>
      (_$isLightThemeComputed ??= Computed<bool>(() => super.isLightTheme,
              name: '_ThemeSelectorControllerBase.isLightTheme'))
          .value;
  Computed<Color>? _$backgroundColorComputed;

  @override
  Color get backgroundColor => (_$backgroundColorComputed ??= Computed<Color>(
          () => super.backgroundColor,
          name: '_ThemeSelectorControllerBase.backgroundColor'))
      .value;

  late final _$currentThemeAtom =
      Atom(name: '_ThemeSelectorControllerBase.currentTheme', context: context);

  @override
  ThemeSelectorENUM get currentTheme {
    _$currentThemeAtom.reportRead();
    return super.currentTheme;
  }

  @override
  set currentTheme(ThemeSelectorENUM value) {
    _$currentThemeAtom.reportWrite(value, super.currentTheme, () {
      super.currentTheme = value;
    });
  }

  late final _$_notifierAtom =
      Atom(name: '_ThemeSelectorControllerBase._notifier', context: context);

  @override
  ValueNotifier<ThemeMode> get _notifier {
    _$_notifierAtom.reportRead();
    return super._notifier;
  }

  @override
  set _notifier(ValueNotifier<ThemeMode> value) {
    _$_notifierAtom.reportWrite(value, super._notifier, () {
      super._notifier = value;
    });
  }

  late final _$_ThemeSelectorControllerBaseActionController =
      ActionController(name: '_ThemeSelectorControllerBase', context: context);

  @override
  void setNotifier(ValueNotifier<ThemeMode> notifier) {
    final _$actionInfo = _$_ThemeSelectorControllerBaseActionController
        .startAction(name: '_ThemeSelectorControllerBase.setNotifier');
    try {
      return super.setNotifier(notifier);
    } finally {
      _$_ThemeSelectorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTheme() {
    final _$actionInfo = _$_ThemeSelectorControllerBaseActionController
        .startAction(name: '_ThemeSelectorControllerBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_ThemeSelectorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentTheme({ThemeSelectorENUM? theme}) {
    final _$actionInfo = _$_ThemeSelectorControllerBaseActionController
        .startAction(name: '_ThemeSelectorControllerBase.setCurrentTheme');
    try {
      return super.setCurrentTheme(theme: theme);
    } finally {
      _$_ThemeSelectorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTheme: ${currentTheme},
isLightTheme: ${isLightTheme},
backgroundColor: ${backgroundColor}
    ''';
  }
}
