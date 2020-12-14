import 'package:flutter/material.dart';
import 'package:quotes/theme.dart';

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [ThemeProvider.LIKE_BUTTON_START_GRADIENT, ThemeProvider.LIKE_BUTTON_FINISH_GRADIENT],
            stops: [0.2, 1],
          )),
      child: Icon(
        Icons.share,
        size: 35,
        color: Colors.white,
      ),
    );
  }
}
