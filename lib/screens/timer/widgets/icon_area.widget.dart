import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../../shared/global.dart';

class IconAreaWidget extends StatefulWidget {
  final BoxConstraints constraints;
  const IconAreaWidget({Key? key, required BoxConstraints this.constraints})
      : super(key: key);

  @override
  State<IconAreaWidget> createState() => _IconAreaWidgetState();
}

class _IconAreaWidgetState extends State<IconAreaWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: Container(
        height: widget.constraints.maxHeight / 5.5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            timerController.currentImageUrl,
          ),
        ),
      ),
    );
  }
}
