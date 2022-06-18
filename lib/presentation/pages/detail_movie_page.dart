import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mivoe/mivoe.dart';

class DetailMoviePage extends StatefulWidget {
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldColor,
      body: SafeArea(
        child: Column(
          children: [
            _headerDetail(context),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _movieDetail(context),
                    const SizedBox(height: 16),
                    _titleMovie(),
                    const SizedBox(height: 8),
                    _divider(),
                    const SizedBox(height: 8),
                    _synopsis(),
                    const SizedBox(height: 8),
                    _divider(),
                    const SizedBox(height: 8),
                    _other(),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                color: AppTheme.purple,
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              child: Text(
                'Watch Trailer',
                style: AppTheme.headline3,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerDetail(BuildContext context) {
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
          child: Text(
            'Movie Detail',
            style: AppTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 12),
        StatefulBuilder(builder: (context, favoriteSetState) {
          return GestureDetector(
            onTap: () {
              favoriteSetState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Container(
              decoration: const BoxDecoration(
                color: AppTheme.purpleDark,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(
                isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: AppTheme.pink,
                size: 28,
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _movieDetail(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.purpleDark,
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height * 0.32,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  Resources.adit,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _detailItem(
                  title: 'Release Date',
                  value: '13/06/2020',
                  icon: const Icon(
                    Icons.calendar_month_rounded,
                    color: AppTheme.white,
                    size: 28,
                  ),
                ),
                _detailItem(
                  title: 'Duration',
                  value: '2h 35m',
                  icon: SvgPicture.asset(
                    Resources.duration,
                    color: AppTheme.white,
                    width: 28,
                  ),
                ),
                _detailItem(
                  title: 'Rating',
                  value: '9.2/10',
                  icon: SvgPicture.asset(
                    Resources.star,
                    color: AppTheme.white,
                    width: 28,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _detailItem(
      {required String title, required String value, required Widget icon}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTheme.subText1,
        ),
        Text(
          value,
          style: AppTheme.text2.bold,
        ),
      ],
    );
  }

  Widget _titleMovie() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Dune (2020)',
            style: AppTheme.headline1,
          ),
          const SizedBox(height: 4),
          Text(
            'How much can you know about yourself if you\'ve never been in a fight?',
            style: AppTheme.text2,
          ),
          const SizedBox(height: 8),
          Wrap(
            children:
                ['Action', 'Fantasy', 'Sci-fi', 'Superhero', 'Drama', 'Horor']
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(right: 8, bottom: 8),
                        child: ChipItem(
                          text: item,
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Divider(
        color: AppTheme.purple,
        thickness: 2,
      ),
    );
  }

  Widget _synopsis() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Synopsis',
            style: AppTheme.headline3,
          ),
          const SizedBox(height: 8),
          Text(
            'Dune is a 1984 American epic space opera film directed by Howard G. Gullit and written by Michael Hammill. The film is based on the novel of the same name by Frank Herbert, and stars Peter Ostrander, James D Dune is a 1984 American epic space opera film directed by Howard G. Gullit and written by Michael Hammill. The film is based on the novel of the same name by Frank Herbert, and stars Peter Ostrander, James DDune is a 1984 American epic space opera film directed by Howard G. Gullit and written by Michael Hammill. The film is based on the novel of the same name by Frank Herbert, and stars Peter Ostrander, James DDune is a 1984 American epic space opera film directed by Howard G. Gullit and written by Michael Hammill. The film is based on the novel of the same name by Frank Herbert, and stars Peter Ostrander, James DDune is a 1984 American epic space opera film directed by Howard G. Gullit and written by Michael Hammill. The film is based on the novel of the same name by Frank Herbert, and stars Peter Ostrander, James D',
            style: AppTheme.text1,
          ),
        ],
      ),
    );
  }

  Widget _other() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _otherItem(
            title: 'Budget',
            value: '\$1,000,000',
          ),
          const SizedBox(height: 8),
          _otherItem(
            title: 'Revenue',
            value: '\$1,000,000',
          ),
          const SizedBox(height: 8),
          _otherItem(
            title: 'Popularity',
            value: '0.5',
          ),
          const SizedBox(height: 8),
          _otherItem(
            title: 'Vote Average',
            value: '8.2',
          ),
          const SizedBox(height: 8),
          _otherItem(
            title: 'Vote Count',
            value: '1306',
          ),
        ],
      ),
    );
  }

  Widget _otherItem({required String title, required String value}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '$title: ',
            style: AppTheme.headline3,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(value, style: AppTheme.text1),
        ),
      ],
    );
  }
}
