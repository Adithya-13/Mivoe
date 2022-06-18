import 'package:flutter/material.dart';
import 'package:mivoe/mivoe.dart';

class PageRouter {
  final RouteObserver<PageRoute> routeObserver;

  PageRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case PagePath.splash:
        return _buildRoute(settings, const SplashPage());
      case PagePath.dashboard:
        return _buildRoute(settings, const DashBoardPage());
      case PagePath.search:
        return _buildRoute(settings, const SearchPage());
      case PagePath.detailMovie:
        return _buildRoute(
            settings,
            DetailMoviePage(
              bundle: args as ArgumentBundle?,
            ));
      default:
        return _errorRoute();
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => builder,
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
