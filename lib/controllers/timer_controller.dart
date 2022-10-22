import 'dart:async';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:keepfocus/models/PomodoCicleModel.dart';
import 'package:keepfocus/utils/phrases.dart';
import 'package:flutter/services.dart';
import 'package:keepfocus/shared/extensions.dart';
import 'package:mobx/mobx.dart';
import 'dart:io' show Platform;
import 'dart:typed_data';
part 'timer_controller.g.dart';

class TimerController = _TimerControllerBase with _$TimerController;

enum PomodoroStatusENUM { PLAYED, PAUSED, NOT_STARTED }

enum TimerTypeENUM { FOCUS, RELAX }

abstract class _TimerControllerBase with Store {
  @observable
  AudioPlayer player = AudioPlayer();

  @observable
  List<PomodoroCicleModel> cicles = [
    PomodoroCicleModel(
        id: 0,
        cicleCompleted: false,
        focusImage: 'assets/images/focus-image-1.png',
        relaxImage: 'assets/images/relax-image-1.png'),
    PomodoroCicleModel(
        id: 1,
        cicleCompleted: false,
        focusImage: 'assets/images/focus-image-2.png',
        relaxImage: 'assets/images/relax-image-2.png'),
    PomodoroCicleModel(
        id: 2,
        cicleCompleted: false,
        focusImage: 'assets/images/focus-image-3.png',
        relaxImage: 'assets/images/relax-image-3.png'),
    PomodoroCicleModel(
        id: 3,
        cicleCompleted: false,
        focusImage: 'assets/images/focus-image-4.png',
        relaxImage: 'assets/images/relax-image-4.png'),
  ];

  @observable
  late PomodoroCicleModel currentCicle = cicles.first;

  @observable
  PomodoroStatusENUM status = PomodoroStatusENUM.NOT_STARTED;

  @observable
  TimerTypeENUM type = TimerTypeENUM.FOCUS;

  @computed
  Duration get _durationCicle => focused ? focusDuration : relaxDuration;

  @observable
  late int secondsLeft = _durationCicle.inSeconds;

  @observable
  int initialTime = 0;

  @computed
  String get formatedTime => '${secondsLeft.secondsToMinutesAndSeconds()}';

  @observable
  bool showPhrase = false;

  @observable
  bool isHidePhrase = false;

  @observable
  AnimationController? animationController;

  @computed
  bool get isPlayed => status == PomodoroStatusENUM.PLAYED;

  @computed
  bool get isPaused => status == PomodoroStatusENUM.PAUSED;

  @computed
  bool get notStarted => status == PomodoroStatusENUM.NOT_STARTED;

  @computed
  bool get canContinue => isPaused && !notStarted;

  @computed
  bool get focused => type == TimerTypeENUM.FOCUS;

  @computed
  bool get relaxed => type == TimerTypeENUM.RELAX;

  @computed
  Duration get durationCicle => _durationCicle;

  @computed
  int get minutesLeft => (secondsLeft / 60).floor();

  @computed
  Duration get focusDuration => Duration(minutes: 1);

  @computed
  Duration get relaxDuration => Duration(minutes: 1);

  @computed
  String get phrase {
    if (minutesLeft <= 4 && focused) return leftFiveMinutes;
    if (relaxed && currentCicle.id != 3) return relaxTime;
    return congratulations;
  }

  @action
  void setAnimationController(AnimationController animation) =>
      animationController = animation;

  @computed
  String get currentImageUrl =>
      focused ? currentCicle.focusImage! : currentCicle.relaxImage!;

  @computed
  int get currentCicleIdx =>
      cicles.indexWhere((circle) => circle.id == currentCicle.id);

  @action
  void pressHideMessage() {
    isHidePhrase = true;
    checkDisplayPhrase();
    pauseAlarm();
  }

  @action
  void checkDisplayPhrase() {
    showPhrase =
        isHidePhrase ? false : (((minutesLeft <= 4) && isPlayed || relaxed));
  }

  @action
  void updatePomodoroStatus(PomodoroStatusENUM currentStatus) =>
      status = currentStatus;

  @action
  void countDownCalc() {
    playAlarm();
    return;
    if (status != PomodoroStatusENUM.PLAYED) return;
    if (secondsLeft == 0) {
      changeTimerType();
      return;
    }
    secondsLeft = secondsLeft - 1;
    checkDisplayPhrase();
    Future.delayed(Duration(seconds: 1)).then((value) => countDownCalc());
  }

  @action
  Future<void> changeTimerType() async {
    if (relaxed) {
      updateCicle();
    }
    type = focused ? TimerTypeENUM.RELAX : TimerTypeENUM.FOCUS;
    secondsLeft = _durationCicle.inSeconds;
    status = PomodoroStatusENUM.NOT_STARTED;
    animationController?.reset();
    showPhrase = true;
    await playAlarm();
  }

  @action
  void nextCicle() {
    type = TimerTypeENUM.RELAX;
    changeTimerType();
  }

  @action
  void updateCicle() {
    int currentIdx =
        cicles.indexWhere((circle) => circle.id == currentCicle.id);
    cicles[currentIdx].cicleCompleted = true;
    showPhrase = false;
    if (currentCicle.id == 3) return;
    currentCicle = cicles[currentIdx + 1];
  }

  @action
  Future<void> playAlarm() async {
    String audioasset = "assets/audio/alarm.mp3";
    ByteData bytes = await rootBundle.load(audioasset);
    Uint8List audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    await player.playBytes(audiobytes);
    Future.delayed(Duration(seconds: 3)).then((value) => player.stop());
  }

  @action
  pauseAlarm() => player.stop();
}
