import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/bloc/quotes/quotes_bloc.dart';
import 'package:quotes/ui/widget/categories_list_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoriesHorizontalList extends StatefulWidget {
  final List<String> categories;
  final Function(String) categoryPickCallback;
  CategoriesHorizontalList({@required this.categories, @required this.categoryPickCallback}) : super();

  @override
  _CategoriesHorizontalListState createState() => _CategoriesHorizontalListState();
}

class _CategoriesHorizontalListState extends State<CategoriesHorizontalList> {
  final ItemScrollController itemScrollController = ItemScrollController();
  int currentCategorie = 0;

  final scrollDuration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: ScrollablePositionedList.builder(
          physics: ClampingScrollPhysics(),
          itemCount: widget.categories.length,
          scrollDirection: Axis.horizontal,
          itemScrollController: itemScrollController,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    scrollTo(index);
                    setState(() {
                      currentCategorie = index;
                    });
                    widget.categoryPickCallback(widget.categories[index]);
                    BlocProvider.of<QuotesBloc>(context).add(QuotesGet(widget.categories[index]));
                  },
                  child: CategoriesListItem(
                    text: widget.categories[index],
                    isCurrent: currentCategorie == index,
                  ),
                ));
          }),
    );
  }

  void scrollTo(int index) =>
      itemScrollController.scrollTo(index: index, duration: scrollDuration, curve: Curves.easeInOutCubic, alignment: 0);
}
