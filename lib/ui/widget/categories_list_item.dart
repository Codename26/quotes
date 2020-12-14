import 'package:flutter/material.dart';
import 'package:quotes/theme.dart';

class CategoriesListItem extends StatelessWidget {
  final String text;
  final bool isCurrent;
  const CategoriesListItem({@required this.text, @required this.isCurrent}) : super();

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: isCurrent ? ThemeProvider.CATEGORIES_LIST_ITEM_ACTIVE : ThemeProvider.CATEGORIES_LIST_ITEM_INACTIVE);
  }
}
