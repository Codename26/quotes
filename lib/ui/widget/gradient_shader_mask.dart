import 'package:flutter/material.dart';
import 'package:quotes/theme.dart';

class GradientShaderMask extends StatelessWidget {
  final Widget child;
  const GradientShaderMask({@required this.child}) : super();

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
              colors: [ThemeProvider.LIKE_BUTTON_START_GRADIENT, ThemeProvider.LIKE_BUTTON_FINISH_GRADIENT],
              stops: [0.2, 1],
            ).createShader(bounds),
        child: child);
  }
}
