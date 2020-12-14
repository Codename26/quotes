import 'package:flutter/material.dart';
import 'package:quotes/data/model/quote.dart';
import 'package:quotes/theme.dart';
import 'package:quotes/ui/widget/like_button.dart';
import 'package:quotes/ui/widget/share_button.dart';

class SwiperCard extends StatelessWidget {
  final int count;
  final Quote quote;
  const SwiperCard({@required this.count, @required this.quote});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Stack(
              children: [
                Container(
                  color: Colors.black,
                ),
                Image.asset(
                  "assets/image_01.png",
                  height: 650,
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  color: _getBackgroundColor(count),
                ),
                Align(alignment: Alignment.center, child: Text(quote.text, style: SwiperTheme.mainTextStyle))
              ],
            )),
        Positioned(bottom: 10, right: 100, child: LikeButton()),
        Positioned(bottom: 10, right: 20, child: ShareButton())
      ],
    );
  }

  Color _getBackgroundColor(int i) {
    if (i % 9 == 0) {
      return SwiperTheme.blueGreyTransparent;
    } else if (i % 8 == 0) {
      return SwiperTheme.orangeTransparent;
    } else if (i % 7 == 0) {
      return SwiperTheme.pinkTransparent;
    } else if (i % 6 == 0) {
      return SwiperTheme.cyanTransparent;
    } else if (i % 5 == 0) {
      return SwiperTheme.violetTransparent;
    } else if (i % 4 == 0) {
      return SwiperTheme.yellowTransparent;
    } else if (i % 3 == 0) {
      return SwiperTheme.redTransparent;
    } else if (i % 2 == 0) {
      return SwiperTheme.yellowGreenTransparent;
    } else {
      return SwiperTheme.blueTransparent;
    }
  }
}
