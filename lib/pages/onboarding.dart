import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loxtest/pages/registration.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(RegistrationPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFA9A7A7)),
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Image.asset(
              "assets/images/charcohi.png",
              width: Get.width,
            ),
            const SizedBox(
              height: 90,
            ),
            const Text(
              "Hi there!",
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 40,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "This is Lox Service app development test!",
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
