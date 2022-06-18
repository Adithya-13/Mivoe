import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mivoe/mivoe.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerSearch(context),
            const SizedBox(height: 24),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return Center(
                      child: Text('Search Movies', style: AppTheme.headline1),
                    );
                  } else if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SearchFailure) {
                    return Center(
                      child: Text('Cannot search movies',
                          style: AppTheme.headline1),
                    );
                  } else if (state is SearchLoaded) {
                    final SearchEntity entity = state.searchEntity;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _searchResultTotal(entity),
                        const SizedBox(height: 24),
                        _movieList(entity),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _movieList(SearchEntity entity) {
    return Expanded(
      child: ListView.builder(
        itemCount: entity.searchList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final movieItem = entity.searchList[index];
          return _movieItem(context, movieItem);
        },
      ),
    );
  }

  Widget _movieItem(BuildContext context, MovieItemEntity movieItem) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, PagePath.detailMovie,
          arguments: ArgumentBundle(id: movieItem.id)),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.4,
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: movieItem.posterPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    movieItem.title,
                    style: AppTheme.headline2,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ChipItem(text: movieItem.releaseDate),
                      const SizedBox(width: 8),
                      ChipItem(
                        widget: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              Resources.star,
                              width: 12,
                              color: AppTheme.yellow,
                            ),
                            const SizedBox(width: 8),
                            Text(movieItem.rating.toString(), style: AppTheme.text2),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    movieItem.synopsis,
                    style: AppTheme.subText1,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _searchResultTotal(SearchEntity entity) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'Search result for "${entity.keyword}" (${entity.totalFound})',
        style: AppTheme.headline3,
      ),
    );
  }

  Widget _headerSearch(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: const BoxDecoration(
              color: AppTheme.purpleDark,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              Resources.back,
              width: 28,
              color: AppTheme.white,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: AppTheme.purpleDark,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.only(
              right: 20,
              top: 2,
              bottom: 2,
              left: 40,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                isDense: true,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Hero(
                    tag: Keys.searchIcon,
                    child: SvgPicture.asset(
                      Resources.search,
                      color: AppTheme.white,
                    ),
                  ),
                ),
                hintStyle: AppTheme.headline3.withWhiteOpacity,
              ),
              style: AppTheme.headline3,
              cursorColor: AppTheme.white,
              onChanged: (query) {
                if (query.isNotEmpty) {
                  context.read<SearchBloc>().add(SearchFetched(query: query));
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
