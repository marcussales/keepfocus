import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:keepfocus/controllers/timer_controller.dart';
import 'package:keepfocus/screens/timer/widgets/actions_widget.dart';
import 'package:keepfocus/screens/timer/widgets/custom_timer_widget.dart';
import 'package:keepfocus/screens/timer/widgets/icon_area.widget.dart';
import 'package:keepfocus/screens/timer/widgets/phrase_box_widget.dart';
import 'package:keepfocus/screens/timer/widgets/pomodoro_cicles.widget.dart';
import 'package:keepfocus/utils/breakpoints.dart';
import 'package:keepfocus/utils/colors_util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../shared/global.dart';

class CircularTimerWidget extends StatefulWidget {
  final BoxConstraints constraints;
  const CircularTimerWidget(this.constraints);
  @override
  _CircularTimerWidgetState createState() => _CircularTimerWidgetState();
}

class _CircularTimerWidgetState extends State<CircularTimerWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController =
      timerController.animationController!;

  @override
  Widget build(BuildContext context) {
    return _buildTimerArea();
  }

  Widget _buildTimerArea() {
    return Observer(builder: (_) {
      bool isMobile = widget.constraints.maxWidth <= mobileBreakpoint;
      return Align(
        alignment: FractionalOffset.center,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  child: CustomPaint(
                      painter: CustomTimerPainter(
                    animation: _animationController,
                    backgroundColor: themeController.backgroundColor,
                    color: ColorsUtil.primaryGray,
                  )),
                ),
              ),
              Column(
                mainAxisAlignment: isMobile
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTimeLeft(),
                  isMobile
                      ? PomodoroCiclesWidget(axis: Axis.horizontal)
                      : IconAreaWidget(constraints: widget.constraints),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildTimeLeft() {
    return Observer(
        builder: (_) => Align(
              alignment: FractionalOffset.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    timerController.formatedTime,
                    style: TextStyle(fontSize: 50.0, color: Colors.white),
                  )
                ],
              ),
            ));
  }
}
