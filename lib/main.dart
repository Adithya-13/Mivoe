import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mivoe/mivoe.dart';

void main() {
  debugPrint = (String? message, {int? wrapWidth}) {};
  BlocOverrides.runZoned(
    () => runApp(
      MivoeApp(),
    ),
  );
}

class MivoeApp extends StatelessWidget {
  late final PageRouter _router;
  MivoeApp({Key? key})
      : _router = PageRouter(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mivoe',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: _router.getRoute,
        navigatorObservers: [_router.routeObserver],
      ),
    );
  }
}
