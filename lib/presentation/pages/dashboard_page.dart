import 'package:auto_size_text/auto_size_text.dart';
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
          child: Container(),
        ),
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
