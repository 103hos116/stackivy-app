import 'package:flutter/material.dart';
import 'package:stackivy_assesement/constants/app_style.dart';

import '../../../../constants/colors.dart';
import '../../../widgets/stackivy_button.dart';
import '../../../widgets/stackivy_text_form_field.dart';

class CompleteProfileScreen extends StatelessWidget {
  // const CompleteProfileScreen({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _inviteCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 30.0),
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
            SizedBox(height: size.height * 0.02),
            Text(
              'Complete your\n profile',
              textAlign: TextAlign.start,
              style: StackivyStyle.bold(
                color: kBigTextColor,
                fontSize: 26.0,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            StackivyTextFormField(
              hintText: 'Username',
              controller: _usernameController,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              validator: (text) {},
              prefixIcon: const Icon(
                Icons.code,
                color: kGray400,
              ),
            ),
            SizedBox(height: size.height * 0.015),
            StackivyTextFormField(
              hintText: 'First Name',
              controller: _firstNameController,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              validator: (text) {},
              prefixIcon: const Icon(
                Icons.person,
                color: kGray400,
              ),
            ),
            SizedBox(height: size.height * 0.015),
            StackivyTextFormField(
              hintText: 'Last Name',
              controller: _lastNameController,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              validator: (text) {},
              prefixIcon: const Icon(
                Icons.person,
                color: kGray400,
              ),
            ),
            SizedBox(height: size.height * 0.015),
            StackivyTextFormField(
              hintText: 'Phone Number',
              controller: _phoneNoController,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              validator: (text) {},
              prefixIcon: const Icon(
                Icons.phone_iphone_outlined,
                color: kGray400,
              ),
            ),
            SizedBox(height: size.height * 0.015),
            StackivyTextFormField(
              hintText: 'Invite code (optional)',
              controller: _inviteCodeController,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              validator: (text) {},
              prefixIcon: const Icon(
                Icons.people_alt_outlined,
                color: kGray400,
              ),
            ),
            SizedBox(height: size.height * 0.015),
            StackivyTextFormField(
              hintText: 'Password',
              controller: _passwordController,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              validator: (text) {},
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: kGray400,
              ),
            ),
            SizedBox(height: size.height * 0.06),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'By Signing Up , You’re agreeing to our ',
                  ),
                  TextSpan(
                    text: 'Terms and Conditions',
                    style: StackivyStyle.regular(
                      color: kPrimaryColor,
                      fontSize: 12.0,
                    ),
                  ),
                  const TextSpan(
                    text: ' and ',
                  ),
                  TextSpan(
                    text: ' Privacy Policy',
                    style: StackivyStyle.regular(
                      color: kPrimaryColor,
                      fontSize: 12.0,
                    ),
                  ),
                ],
                style: StackivyStyle.regular(
                  color: kGray500,
                  fontSize: 12.0,
                ),
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: size.height * 0.04),
            StackivyButton(
              onPressed: () {},
              backgroundColor: kPrimaryColor,
              borderColor: Colors.transparent,
              title: 'Create Account',
            ),
          ],
        ),
      ),
    );
  }
}
