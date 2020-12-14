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

class _SwiperScreenState extends State<SwiperScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<QuotesBloc, QuotesState>(listener: (context, state) {
      print(state);
    }, child: BlocBuilder<QuotesBloc, QuotesState>(builder: (context, state) {
      if (state is QuotesLoading) {
        return _buildLoader();
      } else if (state is QuotesSuccess) {
        return _buildSwiperBody(state);
      } else
        return Container();
    }));
  }

  Widget _buildLoader() {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
      ),
    );
  }

  Widget _buildSwiperBody(QuotesSuccess state) {
    print("quotes length is ${state.quotes.length}");
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
                  if (index == 2) {
                    BlocProvider.of<QuotesBloc>(context).add(QuotesGetNext());
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
}
