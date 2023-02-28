import 'package:flutter/material.dart';
import 'package:keepfocus/controllers/theme_selector_controller.dart';
import 'package:keepfocus/shared/global.dart';
import 'package:keepfocus/utils/colors_util.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ModeSelectorWidget extends StatelessWidget {
  const ModeSelectorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorsUtil.white, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildMode(theme: ThemeSelectorENUM.LIGHT, context: context),
          _buildMode(theme: ThemeSelectorENUM.DARK, context: context),
        ],
      ),
    );
  }

  Widget _buildMode(
      {required ThemeSelectorENUM theme, required BuildContext context}) {
    String imageUrl = theme == ThemeSelectorENUM.LIGHT
        ? 'assets/images/sun.png'
        : 'assets/images/moon.png';
    return LayoutBuilder(builder: ((_, constraints) {
      return Observer(
          builder: (_) => GestureDetector(
                onTap: () {
                  themeController.setCurrentTheme(theme: theme);
                },
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: themeController.currentTheme == theme ? 60 : 50,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: themeController.currentTheme == theme
                          ? ColorsUtil.white
                          : themeController.backgroundColor,
                      boxShadow: themeController.currentTheme == theme
                          ? [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                                offset: Offset(4, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(imageUrl),
                    )),
              ));
    }));
  }
}
