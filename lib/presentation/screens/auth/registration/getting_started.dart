import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stackivy_assesement/presentation/screens/auth/login/login.dart';
import 'package:stackivy_assesement/presentation/screens/auth/registration/verify_email.dart';
import 'package:stackivy_assesement/utils/validators.dart';
import '../../../../style/app_style.dart';
import '../../../../style/colors.dart';
import '../../../widgets/stackivy_button.dart';
import '../../../widgets/stackivy_text_form_field.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  State<GettingStartedScreen> createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  bool isEmpty = true;
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        if (_emailController.text.isNotEmpty) {
          isEmpty = false;
        } else {
          isEmpty = true;
        }
      });
    });
  }

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
                icon: const Icon(Icons.arrow_back_ios),
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
            Form(
              key: formKey,
              child: SliverToBoxAdapter(
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
                              validator: (email) =>
                                  StackivyValidators.emailValidator(email!),
                              prefixIcon: const Icon(
                                Icons.mail_outline,
                                color: kGray400,
                              ),
                            ),
                            const Spacer(),
                            StackivyButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const VerifyEmailScreen(),
                                    ),
                                  );
                                }
                              },
                              backgroundColor:
                                  isEmpty ? kGray200 : kPrimaryColor,
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
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =
                                          () => Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen(),
                                                ),
                                              ),
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
            ),
          ],
        ),
      ),
    );
  }
}
