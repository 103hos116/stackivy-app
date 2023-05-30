import 'package:flutter/material.dart';
import '../../style/app_style.dart';
import '../../style/colors.dart';
import 'coming_soon.dart';

List<String> title = [
  'My Family and I',
  'Invest With Hargon',
  'Business with Ardilla',
  'Tax Save',
];

List<String> desc = [
  'A Family that stay together stays forever',
  'Loan as an investment',
  'A Partnership where you Earn!',
  'Where you save while spending',
];

class ExploreCard extends StatelessWidget {
  final Size size;
  final int index;

  const ExploreCard(this.size, this.index, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: index == 0 ? 30.0 : 0.0, right: index == 3 ? 30.0 : 0.0),
      padding: EdgeInsets.only(
        left: size.width * 0.06,
        top: size.height * 0.06,
        bottom: size.height * 0.06,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topRight: index == 3 ? const Radius.circular(10.0) : Radius.zero,
          bottomRight: index == 3 ? const Radius.circular(10.0) : Radius.zero,
          topLeft: index == 0 ? const Radius.circular(10.0) : Radius.zero,
          bottomLeft: index == 0 ? const Radius.circular(10.0) : Radius.zero,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Text(
                title[index],
                style: StackivyStyle.medium(
                  color: StackivyColors.valeViolet,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: size.height * 0.008),
              Text(
                'A family that stays together stays forever',
                style: StackivyStyle.medium(
                  color: StackivyColors.valeViolet,
                  fontSize: 9.0,
                ),
              ),
              SizedBox(height: size.height * 0.016),
              const ComingSoon(9.0),
            ],
          ),
          SizedBox(width: size.width * 0.15),
          SizedBox(
            height: size.height * 0.09,
            child: const VerticalDivider(
              color: Colors.white,
              thickness: 2.0,
              endIndent: 0.0,
            ),
          )
        ],
      ),
    );
  }
}
