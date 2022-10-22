import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:keepfocus/models/PomodoCicleModel.dart';
import 'package:keepfocus/shared/global.dart';
import 'package:keepfocus/utils/breakpoints.dart';

import '../../../controllers/timer_controller.dart';
import '../../../utils/colors_util.dart';

class ActionsWidget extends StatefulWidget {
  final BoxConstraints constraints;
  const ActionsWidget(BoxConstraints this.constraints);

  @override
  State<ActionsWidget> createState() => _ActionsWidgetState();
}

class _ActionsWidgetState extends State<ActionsWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController =
      timerController.animationController!;
  @override
  Widget build(BuildContext context) {
    return _buildActions();
  }

  Widget _buildActions() {
    return Observer(builder: (_) {
      return Container(
        height: 100,
        child: Row(
          mainAxisAlignment: widget.constraints.maxWidth >= mobileBreakpoint
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.spaceBetween,
          children: [
            _buildAction(
                text: timerController.notStarted
                    ? 'Iniciar'
                    : timerController.canContinue
                        ? 'Continuar'
                        : 'Pular ciclo',
                iconUrl:
                    timerController.notStarted && !timerController.canContinue
                        ? 'play'
                        : 'skip',
                status: PomodoroStatusENUM.PLAYED),
            _buildAction(
                text: timerController.isPaused ? 'Em pausa' : 'Pausar',
                iconUrl: 'pause',
                status: PomodoroStatusENUM.PAUSED),
          ],
        ),
      );
    });
  }

  Widget _buildAction(
      {required String text,
      required String iconUrl,
      required PomodoroStatusENUM status}) {
    bool isCurrentStatus = status == timerController.status;
    String url =
        isCurrentStatus ? '${iconUrl}-with-shadow.png' : '${iconUrl}.png';
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.clickable,
      onTap: () {
        if (isCurrentStatus) {
          if (timerController.isPlayed && status == PomodoroStatusENUM.PLAYED) {
            timerController.nextCicle();
          }
          return;
        }
        timerController.updatePomodoroStatus(status);
        timerController.countDownCalc();
        if (_animationController.isAnimating) {
          _animationController.stop();
        } else {
          _animationController.reverse(
              from: _animationController.value == 0.0
                  ? 1.0
                  : _animationController.value);
        }
      },
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: ColorsUtil.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2, 2),
                  blurRadius: 3.0,
                  color: Color.fromARGB(50, 0, 0, 0),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/${url}',
          ),
        ],
      ),
    );
  }
}
