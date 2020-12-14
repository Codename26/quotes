import 'package:flutter/material.dart';
import 'package:quotes/ui/widget/favorite_card.dart';

import '../../theme.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen();

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeProvider.BACKGROUND_MAIN_COLOR,
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, position) {
            return FavoriteCard(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
              author: "Elon Musk",
            );
          },
          padding: EdgeInsets.fromLTRB(8, 0, 8, 4),
        ),
      ),
    );
  }
}
