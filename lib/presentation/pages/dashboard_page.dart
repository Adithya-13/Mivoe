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
          slider: _SliderView(
            onItemClick: (item) {},
          ),
          key: _key,
          sliderOpenSize: MediaQuery.of(context).size.width * 0.7,
          appBar: SliderAppBar(
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
            appBarPadding: EdgeInsets.only(bottom: 20),
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
            trailing: Container(
              decoration: const BoxDecoration(
                color: AppTheme.purpleDark,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                Resources.search,
                width: 28,
                color: AppTheme.white,
              ),
            ),
          ),
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
            _chip(text: 'Action'),
            const SizedBox(width: 8),
            _chip(text: '2020'),
            const SizedBox(width: 8),
            _chip(
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


  Widget _chip({String? text, Widget? widget}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.purpleDark,
        borderRadius: BorderRadius.circular(8),
      ),
      child: widget ??
          Text(
            text!,
            style: AppTheme.text2,
          ),
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

class _SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const _SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 28),
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.12,
            backgroundImage:
                Image.asset(Resources.adit, fit: BoxFit.cover).image,
            backgroundColor: AppTheme.purple,
          ),
          const SizedBox(height: 20),
          Text(
            'Adithya Firmansyah Putra',
            textAlign: TextAlign.center,
            style: AppTheme.headline2,
          ),
          const SizedBox(height: 8),
          Text(
            'aditputrafirmansyah@gmail.com',
            textAlign: TextAlign.center,
            style: AppTheme.text2,
          ),
          const SizedBox(height: 40),
          _SliderMenuItem(
              title: 'Now Playing',
              iconData: Icons.play_circle_outline_rounded,
              onTap: onItemClick),
          _SliderMenuItem(
              title: 'Top Rated',
              iconData: Icons.star_border_rounded,
              onTap: onItemClick),
          _SliderMenuItem(
            title: 'Popular',
            iconData: Icons.tv_rounded,
            onTap: onItemClick,
          ),
          _SliderMenuItem(
              title: 'Upcoming',
              iconData: Icons.upcoming_rounded,
              onTap: onItemClick),
          _SliderMenuItem(
              title: 'About',
              iconData: Icons.info_outline_rounded,
              onTap: onItemClick),
        ],
      ),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title, style: AppTheme.headline2.normal),
        leading: Icon(iconData, size: 28, color: AppTheme.white),
        onTap: () => onTap?.call(title));
  }
}
