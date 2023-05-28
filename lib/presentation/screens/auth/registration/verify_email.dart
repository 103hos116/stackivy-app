import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stackivy_assesement/constants/app_style.dart';
import 'package:stackivy_assesement/constants/colors.dart';

import '../../../widgets/stackivy_button.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kBigTextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: size.height * 0.08),
            Center(
              child: Image.asset(
                'images/paper.jpg',
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              'Verify your email address',
              textAlign: TextAlign.center,
              style: StackivyStyle.bold(
                color: kBigTextColor,
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            StackivyButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              borderColor: kPrimaryColor,
              title: 'Open Email App',
              titleColor: kPrimaryColor,
            ),
            SizedBox(height: size.height * 0.03),
            StackivyButton(
              onPressed: () {},
              backgroundColor: kPrimaryColor,
              borderColor: Colors.transparent,
              title: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
