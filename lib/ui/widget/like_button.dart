import 'package:flutter/material.dart';
import 'package:quotes/theme.dart';

class LikeButton extends StatelessWidget {
  final bool isFavorite;
  const LikeButton({this.isFavorite = false}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [ThemeProvider.LIKE_BUTTON_START_GRADIENT, ThemeProvider.LIKE_BUTTON_FINISH_GRADIENT],
            stops: [0.2, 1],
          )),
      child: isFavorite
          ? Icon(
              Icons.favorite,
              size: 30,
              color: Colors.white,
            )
          : Icon(
              Icons.favorite_border,
              size: 30,
              color: Colors.white,
            ),
    );
  }
}
