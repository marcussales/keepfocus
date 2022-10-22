import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:keepfocus/screens/timer/widgets/actions_widget.dart';
import 'package:keepfocus/screens/timer/widgets/circular_timer_widget.dart';
import 'package:keepfocus/screens/timer/widgets/icon_area.widget.dart';
import 'package:keepfocus/screens/timer/widgets/mode_selector_widget.dart';
import 'package:keepfocus/screens/timer/widgets/phrase_box_widget.dart';
import 'package:keepfocus/screens/timer/widgets/pomodoro_cicles.widget.dart';
import 'package:keepfocus/shared/global.dart';
import 'package:keepfocus/utils/breakpoints.dart';

class PomodoroScreen extends StatefulWidget {
  PomodoroScreen({Key? key}) : super(key: key);

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController =
      timerController.animationController!;

  @override
  void initState() {
    timerController.setAnimationController(AnimationController(
      vsync: this,
      duration: Duration(minutes: timerController.durationCicle.inMinutes),
    ));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      themeController.setCurrentTheme();
    });
    super.initState();
  }

  bool showPhraseBox = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Observer(builder: (_) {
        return Scaffold(
            backgroundColor: themeController.backgroundColor,
            body: constraints.maxWidth <= mobileBreakpoint
                ? _buildMobileBody(constraints)
                : _buildWebBody(constraints));
      });
    });
  }

  Widget _buildMobileBody(constraints) {
    return SingleChildScrollView(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: themeController.backgroundColor,
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              _buildThemeSelector(),
              SizedBox(
                height: 30,
              ),
              AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Observer(builder: (_) {
                      showPhraseBox = timerController.showPhrase;
                      _animationController.duration = Duration(
                          minutes: timerController.durationCicle.inMinutes);
                      return Container(
                        child: Column(
                          children: <Widget>[
                            CircularTimerWidget(constraints),
                            PhraseBoxWidget(
                              () => setState(() {
                                showPhraseBox = timerController.showPhrase;
                                timerController.pressHideMessage();
                              }),
                            ),
                            ActionsWidget(constraints),
                            IconAreaWidget(constraints: constraints)
                          ],
                        ),
                      );
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWebBody(BoxConstraints constraints) {
    return SingleChildScrollView(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1300),
        color: themeController.backgroundColor,
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildThemeSelector(),
                  PhraseBoxWidget(
                    () => setState(() {
                      showPhraseBox = timerController.showPhrase;
                      timerController.pressHideMessage();
                    }),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: PomodoroCiclesWidget(
                      axis: Axis.vertical,
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Observer(builder: (_) {
                            showPhraseBox = timerController.showPhrase;
                            _animationController.duration = Duration(
                                minutes:
                                    timerController.durationCicle.inMinutes);
                            return Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    height: constraints.maxHeight / 1.8,
                                    child: CircularTimerWidget(constraints),
                                  ),
                                  ActionsWidget(constraints)
                                ],
                              ),
                            );
                          });
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildThemeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ModeSelectorWidget(),
      ],
    );
  }
}
