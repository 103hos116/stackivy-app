import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../style/app_style.dart';
import '../../style/colors.dart';

List<String> title = [
  'Rank',
  'Badges',
  'Referrals',
  'Money Wise',
];

List<String> badge = [
  'Cadet',
  'Beginner',
  'Refer & Earn',
  'Financial nuggets',
];

List<String> badgeAssets = [
  'images/cadet.svg',
  'images/badge.svg',
  'images/coin.svg',
  'images/account.svg',
];

List<String> desc = [
  'Move up your Rank by completing\ntransactions',
  'Move up your Badge by completing transactions',
  'Invite using your Kode Hex.',
  'Take a step towards financial literacy with\nfinancial advice from the best minds in the\ngame.',
];

List<Color> colors = const [
  Color(0xFFFEF6F8),
  Color(0xFFF9F9F9),
  Color(0xFFF0F0FF),
  Color(0xFFF9F9F9),
];

class RanksCard extends StatelessWidget {
  final Size size;
  final int index;

  const RanksCard(this.size, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.35,
      margin: EdgeInsets.only(left: 30.0, right: index == 3 ? 0.0 : 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title[index],
            textAlign: TextAlign.start,
            style: StackivyStyle.normal(
              color: kBigTextColor,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Card(
            elevation: 0.5,
            color: colors[index],
            margin: EdgeInsets.zero,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.02, top: size.height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        badge[index],
                        style: StackivyStyle.bold(
                          color: index == 0 ? kSaveDecColor : kBigTextColor,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        desc[index],
                        style: StackivyStyle.regular(
                          color: kBigTextColor,
                          fontSize: 8.0,
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      index == 1
                          ? Column(
                              children: [
                                SvgPicture.asset('images/super_saver.svg'),
                                Text(
                                  'Super Saver',
                                  style: StackivyStyle.medium(
                                    color: kBigTextColor,
                                    fontSize: 8.0,
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      index == 2 || index == 3
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Click here',
                                  style: StackivyStyle.regular(
                                    color: const Color(0xFF8E15F8),
                                    fontSize: 12.0,
                                  ),
                                ),
                                SizedBox(
                                  width: index == 2
                                      ? size.width * 0.19
                                      : size.width * 0.4,
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF8E15F8),
                                  size: 16.0,
                                ),
                                SvgPicture.asset(
                                  badgeAssets[index],
                                )
                              ],
                            )
                          : Container()
                    ],
                  ),
                ),
                index == 0 || index == 1
                    ? SvgPicture.asset(
                        badgeAssets[index],
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
