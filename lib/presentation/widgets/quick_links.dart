import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../style/app_style.dart';
import '../../style/colors.dart';

List<String> quickLinkAssets = [
  'images/star.svg',
  'images/save.svg',
  'images/book.svg',
  'images/pay.svg',
];

class QuickLinks extends StatelessWidget {
  final Size size;
  final int index;
  const QuickLinks(this.size, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height * 0.08,
          width: size.width * 0.15,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
          decoration: BoxDecoration(
            color: index == 0
                ? kPrimaryColor
                : index == 1
                    ? const Color(0xFFE8356D)
                    : index == 2
                        ? const Color(0xFF14B8A6)
                        : index == 3
                            ? const Color(0xFFFACC15)
                            : const Color(0xFFD09CFC),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0.5, 9).scale(0.5, 0.6),
                color: index == 0
                    ? const Color(0xFFD09CFC)
                    : index == 1
                        ? const Color(0xFFFAD1DE)
                        : index == 2
                            ? const Color(0xFFD1FAF5)
                            : index == 3
                                ? const Color(0xFFFEF4CD)
                                : const Color(0xFFD09CFC),
              ),
            ],
          ),
          child: SvgPicture.asset(
            quickLinkAssets[index],
            fit: BoxFit.cover,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          index == 0
              ? 'SAN'
              : index == 1
                  ? 'Save'
                  : index == 2
                      ? 'Learn'
                      : index == 3
                          ? 'Payment'
                          : '',
          style: StackivyStyle.normal(
            color: kBigTextColor,
            fontSize: 10.0,
          ),
        ),
      ],
    );
  }
}
