import 'package:flutter/material.dart';
import 'package:money_tracker/pages/home_page.dart';
import 'package:money_tracker/shared/theme.dart';
import 'package:money_tracker/widgets/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Padding(
        padding: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, top: 100),
        child: Column(
          children: [
            Image.asset("assets/onboarding.png"),
            Container(
              margin: const EdgeInsets.only(top: 43),
              padding:
                  EdgeInsets.symmetric(vertical: defaultMargin, horizontal: 26),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  color: Colors.white),
              child: Column(
                children: [
                  Text(
                    "Welcome",
                    style: primaryColorText.copyWith(
                        fontSize: 24, fontWeight: semibold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "welcome to Money Tracker, the easy way to improve your finances and help you control expenses and income",
                    textAlign: TextAlign.center,
                    style: lightGreyColorText,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomButton(
                      radiusButton: defaultRadius,
                      buttonColor: buttonBlueColor,
                      buttonText: "Let's go",
                      onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                          (route) => false),
                      heightButton: 50)
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: content(),
    );
  }
}
