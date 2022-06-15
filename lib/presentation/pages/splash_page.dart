import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mivoe/mivoe.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    _navigateOtherScreen();
    super.initState();
  }

  void _navigateOtherScreen() {
    Future.delayed(const Duration(seconds: 3)).then(
        (_) => Navigator.pushReplacementNamed(context, PagePath.dashboard));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Resources.iconLauncher,
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 10),
            Text('Mivoe', style: AppTheme.headline1),
          ],
        ),
      ),
    );
  }
}
