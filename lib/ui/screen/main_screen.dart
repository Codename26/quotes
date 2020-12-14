import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/bloc/quotes/quotes_bloc.dart';
import 'package:quotes/ui/screen/favorite_screen.dart';
import 'package:quotes/ui/screen/settings_screen.dart';
import 'package:quotes/ui/screen/swiper.dart';
import 'package:quotes/ui/widget/gradient_shader_mask.dart';

import '../../const.dart';
import '../../theme.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  String _tabTitle = Constant.PAGE_TITLE[0];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    BlocProvider.of<QuotesBloc>(context).add(QuotesGet(Constant.CATEGORY_ALL));

    super.initState();
  }

  var _barItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          size: ThemeProvider.BOTTOM_BAR_ICON_SIZE,
        ),
        activeIcon: GradientShaderMask(
          child: Icon(
            Icons.home,
            size: ThemeProvider.BOTTOM_BAR_ICON_SIZE,
          ),
        ),
        label: "test"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          size: ThemeProvider.BOTTOM_BAR_ICON_SIZE,
        ),
        activeIcon: GradientShaderMask(
          child: Icon(
            Icons.favorite,
            size: ThemeProvider.BOTTOM_BAR_ICON_SIZE,
          ),
        ),
        label: "test"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.more_horiz,
          size: ThemeProvider.BOTTOM_BAR_ICON_SIZE,
        ),
        activeIcon: GradientShaderMask(
          child: Icon(
            Icons.more_horiz,
            size: ThemeProvider.BOTTOM_BAR_ICON_SIZE,
          ),
        ),
        label: "test"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          key: _scaffoldKey,
          appBar: _currentIndex == 1
              ? AppBar(
                  elevation: 0,
                  title: Text(_tabTitle),
                  centerTitle: true,
                  backgroundColor: ThemeProvider.BACKGROUND_MAIN_COLOR,
                )
              : null,
          body: Container(
            color: ThemeProvider.BACKGROUND_MAIN_COLOR,
            child: SafeArea(
              child: IndexedStack(
                index: _currentIndex,
                children: _getPagesStack(),
              ),
            ),
          ),
          bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: ThemeProvider.BAR_MAIN_COLOR,
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                primaryColor: ThemeProvider.BAR_MAIN_COLOR,
                textTheme: Theme.of(context).textTheme.copyWith(
                      caption: TextStyle(
                        color: Colors.white,
                      ),
                    ),
              ), // sets the

              child: BottomNavigationBar(
                showUnselectedLabels: false,
                showSelectedLabels: false,
                items: _barItems,
                currentIndex: _currentIndex,
                onTap: onTabTapped,
                fixedColor: ThemeProvider.LIKE_BUTTON_START_GRADIENT,
              ))),
    );
  }

  List<Widget> _getPagesStack() {
    List<Widget> res = [];
    res.add(SwiperScreen());
    res.add(FavoriteScreen());
    res.add(SettingsScreen());
    return res;
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _tabTitle = Constant.PAGE_TITLE[0];
          break;
        case 1:
          _tabTitle = Constant.PAGE_TITLE[1];
          break;
        case 2:
          _tabTitle = Constant.PAGE_TITLE[2];
          break;
        default:
          _tabTitle = Constant.PAGE_TITLE[0];
      }
    });
  }
}
