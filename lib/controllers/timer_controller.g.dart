// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerController on _TimerControllerBase, Store {
  Computed<Duration>? _$_durationCicleComputed;

  @override
  Duration get _durationCicle => (_$_durationCicleComputed ??=
          Computed<Duration>(() => super._durationCicle,
              name: '_TimerControllerBase._durationCicle'))
      .value;
  Computed<String>? _$formatedTimeComputed;

  @override
  String get formatedTime =>
      (_$formatedTimeComputed ??= Computed<String>(() => super.formatedTime,
              name: '_TimerControllerBase.formatedTime'))
          .value;
  Computed<bool>? _$isPlayedComputed;

  @override
  bool get isPlayed =>
      (_$isPlayedComputed ??= Computed<bool>(() => super.isPlayed,
              name: '_TimerControllerBase.isPlayed'))
          .value;
  Computed<bool>? _$isPausedComputed;

  @override
  bool get isPaused =>
      (_$isPausedComputed ??= Computed<bool>(() => super.isPaused,
              name: '_TimerControllerBase.isPaused'))
          .value;
  Computed<bool>? _$notStartedComputed;

  @override
  bool get notStarted =>
      (_$notStartedComputed ??= Computed<bool>(() => super.notStarted,
              name: '_TimerControllerBase.notStarted'))
          .value;
  Computed<bool>? _$canContinueComputed;

  @override
  bool get canContinue =>
      (_$canContinueComputed ??= Computed<bool>(() => super.canContinue,
              name: '_TimerControllerBase.canContinue'))
          .value;
  Computed<bool>? _$focusedComputed;

  @override
  bool get focused => (_$focusedComputed ??= Computed<bool>(() => super.focused,
          name: '_TimerControllerBase.focused'))
      .value;
  Computed<bool>? _$relaxedComputed;

  @override
  bool get relaxed => (_$relaxedComputed ??= Computed<bool>(() => super.relaxed,
          name: '_TimerControllerBase.relaxed'))
      .value;
  Computed<Duration>? _$durationCicleComputed;

  @override
  Duration get durationCicle =>
      (_$durationCicleComputed ??= Computed<Duration>(() => super.durationCicle,
              name: '_TimerControllerBase.durationCicle'))
          .value;
  Computed<int>? _$minutesLeftComputed;

  @override
  int get minutesLeft =>
      (_$minutesLeftComputed ??= Computed<int>(() => super.minutesLeft,
              name: '_TimerControllerBase.minutesLeft'))
          .value;
  Computed<Duration>? _$focusDurationComputed;

  @override
  Duration get focusDuration =>
      (_$focusDurationComputed ??= Computed<Duration>(() => super.focusDuration,
              name: '_TimerControllerBase.focusDuration'))
          .value;
  Computed<Duration>? _$relaxDurationComputed;

  @override
  Duration get relaxDuration =>
      (_$relaxDurationComputed ??= Computed<Duration>(() => super.relaxDuration,
              name: '_TimerControllerBase.relaxDuration'))
          .value;
  Computed<String>? _$phraseComputed;

  @override
  String get phrase =>
      (_$phraseComputed ??= Computed<String>(() => super.phrase,
              name: '_TimerControllerBase.phrase'))
          .value;
  Computed<String>? _$currentImageUrlComputed;

  @override
  String get currentImageUrl => (_$currentImageUrlComputed ??= Computed<String>(
          () => super.currentImageUrl,
          name: '_TimerControllerBase.currentImageUrl'))
      .value;
  Computed<int>? _$currentCicleIdxComputed;

  @override
  int get currentCicleIdx =>
      (_$currentCicleIdxComputed ??= Computed<int>(() => super.currentCicleIdx,
              name: '_TimerControllerBase.currentCicleIdx'))
          .value;

  late final _$playerAtom =
      Atom(name: '_TimerControllerBase.player', context: context);

  @override
  AudioPlayer get player {
    _$playerAtom.reportRead();
    return super.player;
  }

  @override
  set player(AudioPlayer value) {
    _$playerAtom.reportWrite(value, super.player, () {
      super.player = value;
    });
  }

  late final _$ciclesAtom =
      Atom(name: '_TimerControllerBase.cicles', context: context);

  @override
  List<PomodoroCicleModel> get cicles {
    _$ciclesAtom.reportRead();
    return super.cicles;
  }

  @override
  set cicles(List<PomodoroCicleModel> value) {
    _$ciclesAtom.reportWrite(value, super.cicles, () {
      super.cicles = value;
    });
  }

  late final _$currentCicleAtom =
      Atom(name: '_TimerControllerBase.currentCicle', context: context);

  @override
  PomodoroCicleModel get currentCicle {
    _$currentCicleAtom.reportRead();
    return super.currentCicle;
  }

  @override
  set currentCicle(PomodoroCicleModel value) {
    _$currentCicleAtom.reportWrite(value, super.currentCicle, () {
      super.currentCicle = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_TimerControllerBase.status', context: context);

  @override
  PomodoroStatusENUM get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(PomodoroStatusENUM value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$typeAtom =
      Atom(name: '_TimerControllerBase.type', context: context);

  @override
  TimerTypeENUM get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(TimerTypeENUM value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$secondsLeftAtom =
      Atom(name: '_TimerControllerBase.secondsLeft', context: context);

  @override
  int get secondsLeft {
    _$secondsLeftAtom.reportRead();
    return super.secondsLeft;
  }

  @override
  set secondsLeft(int value) {
    _$secondsLeftAtom.reportWrite(value, super.secondsLeft, () {
      super.secondsLeft = value;
    });
  }

  late final _$initialTimeAtom =
      Atom(name: '_TimerControllerBase.initialTime', context: context);

  @override
  int get initialTime {
    _$initialTimeAtom.reportRead();
    return super.initialTime;
  }

  @override
  set initialTime(int value) {
    _$initialTimeAtom.reportWrite(value, super.initialTime, () {
      super.initialTime = value;
    });
  }

  late final _$showPhraseAtom =
      Atom(name: '_TimerControllerBase.showPhrase', context: context);

  @override
  bool get showPhrase {
    _$showPhraseAtom.reportRead();
    return super.showPhrase;
  }

  @override
  set showPhrase(bool value) {
    _$showPhraseAtom.reportWrite(value, super.showPhrase, () {
      super.showPhrase = value;
    });
  }

  late final _$isHidePhraseAtom =
      Atom(name: '_TimerControllerBase.isHidePhrase', context: context);

  @override
  bool get isHidePhrase {
    _$isHidePhraseAtom.reportRead();
    return super.isHidePhrase;
  }

  @override
  set isHidePhrase(bool value) {
    _$isHidePhraseAtom.reportWrite(value, super.isHidePhrase, () {
      super.isHidePhrase = value;
    });
  }

  late final _$animationControllerAtom =
      Atom(name: '_TimerControllerBase.animationController', context: context);

  @override
  AnimationController? get animationController {
    _$animationControllerAtom.reportRead();
    return super.animationController;
  }

  @override
  set animationController(AnimationController? value) {
    _$animationControllerAtom.reportWrite(value, super.animationController, () {
      super.animationController = value;
    });
  }

  late final _$changeTimerTypeAsyncAction =
      AsyncAction('_TimerControllerBase.changeTimerType', context: context);

  @override
  Future<void> changeTimerType() {
    return _$changeTimerTypeAsyncAction.run(() => super.changeTimerType());
  }

  late final _$playAlarmAsyncAction =
      AsyncAction('_TimerControllerBase.playAlarm', context: context);

  @override
  Future<void> playAlarm() {
    return _$playAlarmAsyncAction.run(() => super.playAlarm());
  }

  late final _$_TimerControllerBaseActionController =
      ActionController(name: '_TimerControllerBase', context: context);

  @override
  void setAnimationController(AnimationController animation) {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.setAnimationController');
    try {
      return super.setAnimationController(animation);
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pressHideMessage() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.pressHideMessage');
    try {
      return super.pressHideMessage();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkDisplayPhrase() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.checkDisplayPhrase');
    try {
      return super.checkDisplayPhrase();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePomodoroStatus(PomodoroStatusENUM currentStatus) {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.updatePomodoroStatus');
    try {
      return super.updatePomodoroStatus(currentStatus);
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void countDownCalc() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.countDownCalc');
    try {
      return super.countDownCalc();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextCicle() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.nextCicle');
    try {
      return super.nextCicle();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCicle() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.updateCicle');
    try {
      return super.updateCicle();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pauseAlarm() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.pauseAlarm');
    try {
      return super.pauseAlarm();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
player: ${player},
cicles: ${cicles},
currentCicle: ${currentCicle},
status: ${status},
type: ${type},
secondsLeft: ${secondsLeft},
initialTime: ${initialTime},
showPhrase: ${showPhrase},
isHidePhrase: ${isHidePhrase},
animationController: ${animationController},
formatedTime: ${formatedTime},
isPlayed: ${isPlayed},
isPaused: ${isPaused},
notStarted: ${notStarted},
canContinue: ${canContinue},
focused: ${focused},
relaxed: ${relaxed},
durationCicle: ${durationCicle},
minutesLeft: ${minutesLeft},
focusDuration: ${focusDuration},
relaxDuration: ${relaxDuration},
phrase: ${phrase},
currentImageUrl: ${currentImageUrl},
currentCicleIdx: ${currentCicleIdx}
    ''';
  }
}
