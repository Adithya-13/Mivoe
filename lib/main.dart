import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mivoe/mivoe.dart';

void main() {
  debugPrint = (String? message, {int? wrapWidth}) {};
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<DashboardRepository>(
            create: (context) => DashboardRepository(),
          ),
          RepositoryProvider<DetailRepository>(
            create: (context) => DetailRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<NowPlayingBloc>(
              create: (context) => NowPlayingBloc(
                dashboardRepository: context.read<DashboardRepository>(),
              ),
            ),
            BlocProvider<PopularBloc>(
              create: (context) => PopularBloc(
                dashboardRepository: context.read<DashboardRepository>(),
              ),
            ),
            BlocProvider<UpcomingBloc>(
              create: (context) => UpcomingBloc(
                dashboardRepository: context.read<DashboardRepository>(),
              ),
            ),
            BlocProvider<TopRatedBloc>(
              create: (context) => TopRatedBloc(
                dashboardRepository: context.read<DashboardRepository>(),
              ),
            ),
            BlocProvider<MovieDetailBloc>(
              create: (context) => MovieDetailBloc(
                detailRepository: context.read<DetailRepository>(),
              ),
            ),
          ],
          child: MivoeApp(),
        ),
      ),
    ),
    blocObserver: SimpleBlocObserver(),
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
