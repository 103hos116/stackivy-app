import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../style/app_style.dart';
import '../../style/colors.dart';

List<String> investmentAssets = [
  'images/investing.svg',
  'images/rafiki.svg',
  'images/shield.svg',
];

List<String> investmentTitles = [
  'Unprecedented access to\ninvestment opportunities',
  'Build your savings the right\nway',
  'Insurance policies you can\ntrust',
];

List<Color> colorGradient = [
  const Color(0xFF8807F7).withOpacity(0.3),
  const Color(0xFF10B981).withOpacity(0.3),
  const Color(0xFFE6356D).withOpacity(0.3),
];

class InvestmentCards extends StatelessWidget {
  final Size size;
  final int index;

  const InvestmentCards(
    this.size,
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 30.0, right: index == 2 ? 0.0 : 30.0),
      color: Colors.white,
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: size.height * 0.03, bottom: size.height * 0.013),
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.0,
                  1.0,
                ],
                colors: [
                  colorGradient[index],
                  const Color(0xFFD9D9D9).withOpacity(0.0),
                ],
              ),
            ),
            child: SvgPicture.asset(investmentAssets[index]),
          ),
          Text(
            investmentTitles[index],
            textAlign: TextAlign.center,
            style: StackivyStyle.normal(
              color: kBigTextColor,
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: size.height * 0.014),
          Text(
            index == 0 ? '20% Monthly ROI' : '12% Annual ROI',
            textAlign: TextAlign.center,
            style: StackivyStyle.normal(
              color: kGray400,
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: size.height * 0.012),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start Investing',
                style: StackivyStyle.normal(
                  color: kPrimaryColor,
                  fontSize: 10.0,
                ),
              ),
              SizedBox(width: size.width * 0.006),
              const Icon(
                Icons.arrow_forward,
                color: kPrimaryColor,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.03),
        ],
      ),
    );
  }
}
