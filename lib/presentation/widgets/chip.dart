import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mivoe/mivoe.dart';

class ChipItem extends StatelessWidget {
  final String? text;
  final Widget? widget;
  const ChipItem({Key? key, this.text, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
