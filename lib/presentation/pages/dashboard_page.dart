import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mivoe/mivoe.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldColor,
      body: SafeArea(
        child: SliderDrawer(
          slider: NavigationDrawer(
            onItemClick: (item) {},
          ),
          key: _key,
          sliderOpenSize: MediaQuery.of(context).size.width * 0.7,
          appBar: _sliderAppBar(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _nowPlaying(),
                const SizedBox(height: 40),
                _topRated(),
                const SizedBox(height: 32),
                _popular(),
                const SizedBox(height: 32),
                _upcoming(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sliderAppBar() {
    return SliderAppBar(
      appBarColor: AppTheme.scaffoldColor,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            'Hi, Adithya!',
            style: AppTheme.headline2,
            maxLines: 1,
            minFontSize: AppTheme.headline3.fontSize!,
          ),
          AutoSizeText(
            'What movie you lookin\' for?',
            style: AppTheme.text2,
            maxLines: 1,
            minFontSize: AppTheme.subText1.fontSize!,
          ),
        ],
      ),
      appBarHeight: AppBar().preferredSize.height + 40,
      appBarPadding: const EdgeInsets.only(bottom: 20),
      drawerIcon: GestureDetector(
        onTap: () => _key.currentState?.isDrawerOpen ?? false
            ? _key.currentState?.closeSlider()
            : _key.currentState?.openSlider(),
        child: Container(
          decoration: const BoxDecoration(
            color: AppTheme.purpleDark,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(40),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            Resources.humberger,
            width: 28,
            color: AppTheme.white,
          ),
        ),
      ),
      trailing: GestureDetector(
        onTap: () => Navigator.pushNamed(context, PagePath.search),
        child: Container(
          decoration: const BoxDecoration(
            color: AppTheme.purpleDark,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(40),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Hero(
            tag: Keys.searchIcon,
            child: SvgPicture.asset(
              Resources.search,
              width: 28,
              color: AppTheme.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _nowPlaying() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Now Playing',
          style: AppTheme.headline3,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.8,
          child: Swiper(
            layout: SwiperLayout.CUSTOM,
            customLayoutOption:
                CustomLayoutOption(startIndex: -1, stateCount: 3)
                  ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                  ..addTranslate(
                    [
                      Offset(-(MediaQuery.of(context).size.width * 0.7), -40.0),
                      const Offset(0.0, 0.0),
                      Offset((MediaQuery.of(context).size.width * 0.7), -40.0),
                    ],
                  ),
            itemWidth: MediaQuery.of(context).size.width * 0.5,
            itemHeight: MediaQuery.of(context).size.width * 0.5 +
                (MediaQuery.of(context).size.width * 0.5 / 3),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  Resources.adit,
                  fit: BoxFit.cover,
                ),
              );
            },
            itemCount: 3,
            onTap: (index) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailPage(
              //       movie: movies[index],
              //     ),
              //   ),
              // );
            },
          ),
        ),
        Text(
          'Dune',
          style: AppTheme.headline3,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
      ],
    );
  }

  Widget _topRated() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _headerMovieList(title: 'Top Rated', onClick: () {}),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.26,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _movieItem(index, context);
            },
            itemCount: 4,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ],
    );
  }

  Widget _popular() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _headerMovieList(title: 'Popular', onClick: () {}),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.26,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _movieItem(index, context);
            },
            itemCount: 4,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ],
    );
  }

  Widget _upcoming() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _headerMovieList(title: 'Upcoming', onClick: () {}),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.26,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _movieItem(index, context);
            },
            itemCount: 4,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ],
    );
  }

  Padding _headerMovieList(
      {required String title, required Function() onClick}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Top Rated',
            style: AppTheme.headline3,
          ),
          GestureDetector(
            onTap: onClick,
            child: Text(
              'See all',
              style: AppTheme.text2.purple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _movieItem(int index, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: index == 0 ? 16 : 0, right: 16),
      height: MediaQuery.of(context).size.height * 0.24,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        Resources.adit,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.16,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppTheme.purpleDark,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            Resources.star,
                            width: 10,
                            color: AppTheme.yellow,
                          ),
                          const SizedBox(width: 8),
                          Text('9.2', style: AppTheme.subText1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Dune',
            style: AppTheme.text1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            '2020',
            style: AppTheme.subText1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
