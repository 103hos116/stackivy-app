import 'package:flutter/material.dart';
import '../../style/app_style.dart';

class ComingSoon extends StatelessWidget {
  final double fontSize;
  const ComingSoon(this.fontSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60.0),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Text(
        'Coming Soon',
        style: StackivyStyle.medium(
          color: Colors.white,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
