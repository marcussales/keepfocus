import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:keepfocus/shared/global.dart';

import '../../../utils/colors_util.dart';

class PhraseBoxWidget extends StatefulWidget {
  final Function onPressed;
  const PhraseBoxWidget(this.onPressed);

  @override
  State<PhraseBoxWidget> createState() => _PhraseBoxWidgetState();
}

class _PhraseBoxWidgetState extends State<PhraseBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: timerController.showPhrase
              ? _buildPhraseBox()
              : SizedBox(
                  height: 80,
                ));
    });
  }

  _buildPhraseBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorsUtil.white, width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(timerController.phrase,
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                SizedBox(width: 5),
                TextButton(
                    onPressed: () => widget.onPressed.call(),
                    child: Text(
                      'OK',
                      style: TextStyle(color: themeController.backgroundColor),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        textStyle: TextStyle(
                          color: themeController.backgroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                        elevation: 2,
                        shadowColor: Colors.white))
              ]),
        ),
      ),
    );
  }
}
