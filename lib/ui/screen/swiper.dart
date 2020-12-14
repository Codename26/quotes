import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:quotes/bloc/quotes/quotes_bloc.dart';
import 'package:quotes/const.dart';
import 'package:quotes/ui/widget/card.dart';
import 'package:quotes/ui/widget/categories_horizontal_list.dart';

import '../../theme.dart';

class SwiperScreen extends StatefulWidget {
  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> with SingleTickerProviderStateMixin {
  String _currentCategory = Constant.CATEGORY_ALL;
  AnimationController _animationController;
  Animation<Color> _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _colorTween = _animationController.drive(
        ColorTween(begin: ThemeProvider.LIKE_BUTTON_START_GRADIENT, end: ThemeProvider.LIKE_BUTTON_FINISH_GRADIENT));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotesBloc, QuotesState>(builder: (context, state) {
      if (state is QuotesLoading) {
        return _buildLoader();
      } else if (state is QuotesSuccess) {
        return _buildSwiperBody(state);
      } else if (state is QuotesEmpty) {
        return _buildEmptyPage();
      } else
        return Container();
    });
  }

  Widget _buildLoader() {
    return Container(
      color: ThemeProvider.BACKGROUND_MAIN_COLOR,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: CategoriesHorizontalList(
                    categories: Constant.QUOTES_CATEGORIES,
                    categoryPickCallback: _setCurrentCategory,
                  ),
                ),
              )),
          Expanded(
            flex: 12,
            child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: _colorTween,
                ))),
          ),
        ],
      ),
    );
  }

  Widget _buildSwiperBody(QuotesSuccess state) {
    return Container(
      color: ThemeProvider.BACKGROUND_MAIN_COLOR,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: CategoriesHorizontalList(
                    categories: Constant.QUOTES_CATEGORIES,
                    categoryPickCallback: _setCurrentCategory,
                  ),
                ),
              )),
          Expanded(
            flex: 12,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return SwiperCard(count: index, quote: state.quotes[index]);
                },
                // itemWidth: 330,
                // itemHeight: 550,
                itemCount: state.quotes.length,
                layout: SwiperLayout.DEFAULT,
                onIndexChanged: (index) {
                  print(index);
                  if (state.quotes.length - index <= 2) {
                    BlocProvider.of<QuotesBloc>(context).add(QuotesGetNext(_currentCategory));
                  }
                },
                loop: false,
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyPage() {
    return Container(
      color: ThemeProvider.BACKGROUND_MAIN_COLOR,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: CategoriesHorizontalList(
                    categories: Constant.QUOTES_CATEGORIES,
                    categoryPickCallback: _setCurrentCategory,
                  ),
                ),
              )),
          Expanded(
            flex: 12,
            child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Center(
                    child: Text(
                  Constant.NO_QUOTES_MESSAGE,
                  style: ThemeProvider.CATEGORIES_LIST_ITEM_ACTIVE,
                ))),
          ),
        ],
      ),
    );
  }

  void _setCurrentCategory(String category) {
    setState(() {
      _currentCategory = category;
    });
  }
}
