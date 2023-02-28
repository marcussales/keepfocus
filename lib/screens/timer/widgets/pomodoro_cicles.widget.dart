import 'package:flutter/material.dart';
import 'package:keepfocus/shared/global.dart';

class PomodoroCiclesWidget extends StatefulWidget {
  final Axis axis;
  const PomodoroCiclesWidget({Key? key, required Axis this.axis});

  @override
  State<PomodoroCiclesWidget> createState() => _PomodoroCiclesWidgetState();
}

class _PomodoroCiclesWidgetState extends State<PomodoroCiclesWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation =
      Tween<Offset>(begin: Offset(-3, 0.0), end: Offset.zero)
          .animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceIn,
  )..addListener(() {
              if (_controller.status == AnimationStatus.reverse) {
                _controller.stop();
              }
            }));

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
          height: widget.axis == Axis.horizontal ? 50 : 250,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: widget.axis,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: timerController.cicles[index].cicleCompleted!
                      ? _buildCheckedTomato()
                      : Image.asset('assets/images/tomato-uncheck.png',
                          height: 25, width: 25)),
            ),
          )),
    );
  }

  Widget _buildCheckedTomato() {
    return AnimatedSwitcher(
      child: Image(
          image: AssetImage('assets/images/tomato-checked.png'),
          height: 25,
          width: 25,
          key: ValueKey(Duration(milliseconds: 800))),
      duration: Duration(milliseconds: 800),
    );
  }
}
