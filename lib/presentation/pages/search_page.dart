import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mivoe/mivoe.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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
            _searchResultTotal(),
            const SizedBox(height: 24),
            _movieList(),
          ],
        ),
      ),
    );
  }

  Expanded _movieList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return _movieItem(context);
        },
      ),
    );
  }

  Widget _movieItem(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, PagePath.detailMovie),
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
                  child: Image.asset(
                    Resources.adit,
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
                    'Dune',
                    style: AppTheme.headline2,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const ChipItem(text: 'Action'),
                      const SizedBox(width: 8),
                      const ChipItem(text: '2020'),
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
                            Text('9.2', style: AppTheme.text2),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Dune is a 1984 American epic space opera film directed by Ron Howard and written by Howard and David Peoples. Dune is a 1984 American epic space opera film directed by Ron Howard and written by Howard and David Peoples. Dune is a 1984 American epic space opera film directed by Ron Howard and written by Howard and David Peoples.',
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

  Padding _searchResultTotal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'Search result for "Dune" (1)',
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
            ),
          ),
        ),
      ],
    );
  }
}