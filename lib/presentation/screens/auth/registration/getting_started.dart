import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_style.dart';
import '../../../../constants/colors.dart';
import '../../../widgets/stackivy_button.dart';
import '../../../widgets/stackivy_text_form_field.dart';
import '../../dashboard/dashboard.dart';

class GettingStartedScreen extends StatelessWidget {
  // const GettingStartedScreen({Key? key}) : super(key: key);

  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              floating: false,
              snap: false,
              pinned: true,
              backgroundColor: kPrimaryColor,
              expandedHeight: size.height * 0.2,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'images/small_logo.svg',
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: size.width * 0.02),
                        Text(
                          'Ardilla',
                          style: StackivyStyle.bold(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03)
                  ],
                ),
                background: SvgPicture.asset(
                  'images/background.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: kPrimaryColor,
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.02,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: const BoxDecoration(
                        color: kPrimaryLight,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.7,
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: size.height * 0.05),
                          Text(
                            'Get Started',
                            style: StackivyStyle.bold(
                                color: kBigTextColor, fontSize: 36.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'To Create an account enter a valid email address',
                            style: StackivyStyle.regular(
                                color: kGray500, fontSize: 12.0),
                          ),
                          SizedBox(height: size.height * 0.05),
                          StackivyTextFormField(
                            hintText: 'Email Address',
                            controller: _emailController,
                            textInputType: TextInputType.emailAddress,
                            obscureText: false,
                            validator: (text) {},
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                              color: kGray400,
                            ),
                          ),
                          const Spacer(),
                          StackivyButton(
                            onPressed: () {},
                            backgroundColor: kGray200,
                            borderColor: Colors.transparent,
                            title: 'Continue',
                          ),
                          SizedBox(height: size.height * 0.03),
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                    text: 'Already have an account?  '),
                                TextSpan(
                                  text: 'Sign in',
                                  style: StackivyStyle.medium(
                                    color: kPrimaryColor,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                              style: StackivyStyle.medium(
                                color: kGray500,
                                fontSize: 12.0,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
