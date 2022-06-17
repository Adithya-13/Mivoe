import 'package:flutter/material.dart';
import 'package:mivoe/mivoe.dart';

class NavigationDrawer extends StatelessWidget {
  final Function(String)? onItemClick;

  const NavigationDrawer({Key? key, this.onItemClick}) : super(key: key);

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
