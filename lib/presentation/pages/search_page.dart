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
          children: [
            Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
