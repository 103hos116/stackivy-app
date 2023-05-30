import 'package:flutter/material.dart';
import 'package:stackivy_assesement/presentation/widgets/stackivy_button.dart';
import '../../style/app_style.dart';
import '../../style/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Color> cardColor = [
  kPrimaryColor,
  const Color(0xFFE8356D),
  Colors.white,
];

List<String> title = [
  'SAN',
  'Dilla Wallet',
  'Total Funds',
];

List<String> balance = [
  'NGN 100,000.00',
  'USD 10,000.00',
  'NGN 400,000.00',
];

class WalletCard extends StatelessWidget {
  final Size size;
  final int index;

  const WalletCard(
    this.size,
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.26,
      margin: EdgeInsets.only(left: 30.0, right: index == 2 ? 0.0 : 30.0),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.04,
      ),
      decoration: BoxDecoration(
        color: cardColor[index],
        borderRadius: BorderRadius.circular(22.0),
        border: Border.all(
          width: index == 2 ? 2.0 : 0.0,
          color: index == 2
              ? const Color(0xFF8807F7).withOpacity(0.1)
              : Colors.transparent,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     blurRadius: 4.0,
        //     spreadRadius: 5.0,
        //     offset: const Offset(0, 8),
        //     color: const Color(0xFFFAD1DE),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title[index],
                style: StackivyStyle.normal(
                  color: index != 2 ? Colors.white : kBigTextColor,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(width: size.width * 0.04),
              Visibility(
                visible: index == 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: StackivyColors.harmony,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    '+10.00%',
                    style: StackivyStyle.normal(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                balance[index],
                style: StackivyStyle.normal(
                  color: index != 2 ? Colors.white : kBigTextColor,
                  fontSize: 22.0,
                ),
              ),
              FaIcon(
                FontAwesomeIcons.eye,
                color:
                    index != 2 ? Colors.white : kBigTextColor.withOpacity(0.5),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.027),
          Visibility(
            visible: index == 0,
            child: Text(
              '**********',
              style: StackivyStyle.normal(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          index == 0
              ? Row(
                  children: [
                    Text(
                      'Generate Account Number',
                      style: StackivyStyle.normal(
                        color: Colors.white,
                        fontSize: 11.0,
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_sharp,
                        size: 16.0,
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.006,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3D0072).withOpacity(0.11),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'NGN',
                            style: StackivyStyle.medium(
                              color: index != 2
                                  ? Colors.white
                                  : kBigTextColor.withOpacity(0.3),
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Text(
                              'USD',
                              style: StackivyStyle.medium(
                                color: kBigTextColor,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      '₦740 /\$1',
                      style: StackivyStyle.bold(
                        color: index != 2
                            ? Colors.white
                            : kBigTextColor.withOpacity(0.5),
                        fontSize: 12.0,
                      ),
                    ),
                    const Spacer(),
                    StackivyButton(
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      borderColor: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: Text(
                          'Add Money',
                          style: StackivyStyle.bold(
                            color: index == 2 ? Colors.white : kBigTextColor,
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
