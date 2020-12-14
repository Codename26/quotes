import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/bloc/quotes/quotes_bloc.dart';
import 'package:quotes/data/repository/quotes_repository.dart';

import 'ui/screen/main_screen.dart';

void main() => runApp(MaterialApp(
      home: MultiRepositoryProvider(
        providers: [RepositoryProvider<QuotesRepository>(create: (context) => QuotesRepository())],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<QuotesBloc>(create: (context) => QuotesBloc(RepositoryProvider.of<QuotesRepository>(context)))
          ],
          child: MyApp(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
