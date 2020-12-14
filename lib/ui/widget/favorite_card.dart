import 'package:flutter/material.dart';
import 'package:quotes/theme.dart';
import 'package:quotes/ui/widget/like_button.dart';
import 'package:quotes/ui/widget/share_button.dart';

class FavoriteCard extends StatelessWidget {
  final String text;
  final String author;

  const FavoriteCard({@required this.text, @required this.author}) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16, 8, 30),
      child: Container(
          // height: 120,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                child: Stack(children: [
                  Positioned(
                      right: 4,
                      top: -10,
                      child:
                          Icon(Icons.format_quote_rounded, size: 90, color: ThemeProvider.QUOTE_ICON_SEMI_TRANSPARENT)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 18, 8, 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: ThemeProvider.QUOTE_MAIN_TEXT,
                        ),
                        SizedBox(height: 12),
                        Text(
                          " - $author",
                          style: ThemeProvider.QUOTE_AUTHOR_TEXT,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Positioned(bottom: -25, right: 100, child: LikeButton()),
              Positioned(bottom: -30, right: 20, child: ShareButton())
            ],
          )),
    );
  }
}
