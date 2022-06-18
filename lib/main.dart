import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mivoe/mivoe.dart';

void main() {
  debugPrint = (String? message, {int? wrapWidth}) {};
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio();

  final dioClient = DioClient(
      baseUrl: 'https://api.themoviedb.org/3/',
      apiKey:
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MzQxMmM4OTFkMTRjZDBkNTQ3YjQ1MTY4NjM4MzNhYiIsInN1YiI6IjVmOWQ1ZmM3NTM4NjZlMDAzNmU5NGJhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sFqV8zoDl3H1waHewQ8S1WQdBh8YJWfSz_AXp_RVFes',
      dio: dio,
      httpClient: HttpClient());

  final mivoeApi = MivoeApi(
    dioClient: dioClient,
  );

  BlocOverrides.runZoned(
    () => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<DashboardRepository>(
            create: (context) => DashboardRepository(
              mivoeApi: mivoeApi,
            ),
          ),
          RepositoryProvider<DetailRepository>(
            create: (context) => DetailRepository(
              mivoeApi: mivoeApi,
            ),
          ),
          RepositoryProvider<SearchRepository>(
            create: (context) => SearchRepository(
              mivoeApi: mivoeApi,
            ),
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
            BlocProvider<SearchBloc>(
              create: (context) => SearchBloc(
                searchRepository: context.read<SearchRepository>(),
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
