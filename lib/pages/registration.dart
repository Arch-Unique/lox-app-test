import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loxtest/lox.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int _curState = 0;
  List<String> title = ["Login", "Sign Up"];
  List<String> desc = ["Don’t have account?", "Already have account?"];
  List<String> descExt = ["Create now", "Log In"];
  double wbox = sqrt((Get.width * Get.width) / 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Lox.primaryColor,
      body: Stack(
        children: [
          SizedBox(height: Get.height, width: Get.width),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.white,
              height: Get.height / 2,
              width: Get.width,
            ),
          ),
          Positioned(
            top: Get.height * 0.3,
            left: 0,
            right: 0,
            child: Transform.rotate(
              angle: pi / 4,
              child: Container(
                height: wbox,
                width: wbox,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Positioned(top: 72, left: 0, right: 0, child: buildHeader()),
          Positioned(bottom: 0, child: buildForm())
        ],
      ),
    );
  }

  buildHeader() {
    return Row(children: [
      const Spacer(),
      const CircleAvatar(
        radius: 22.5,
        backgroundImage: AssetImage("assets/images/logo.png"),
      ),
      const SizedBox(
        width: 12,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "The Test",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFFD2D4FA)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Powered by Lox",
            style: TextStyle(fontSize: 14, color: Color(0xFF000113)),
          ),
        ],
      ),
      const Spacer()
    ]);
  }

  buildSocialMediaButton(String a, String b) {
    return SizedBox(
      width: (Get.width / 2) - 32,
      child: TextButton(
        onPressed: () {},
        child: Text.rich(TextSpan(children: [
          WidgetSpan(
            child: Lox.iconImage(a),
            alignment: PlaceholderAlignment.middle,
          ),
          TextSpan(
            text: " $b",
            style: const TextStyle(
                color: Color(0xFF475569),
                fontWeight: FontWeight.w400,
                fontSize: 17),
          )
        ])),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFFF1F5F9)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 10, horizontal: 36)),
        ),
      ),
    );
  }

  buildForm() {
    return Form(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title[_curState],
          style: const TextStyle(
              color: Color(0xFF1E293B),
              fontWeight: FontWeight.w800,
              fontSize: 32),
        ),
        const SizedBox(
          height: 36,
        ),
        Lox.defTextFormField("Email", TextEditingController()),
        Lox.defTextFormField("Password", TextEditingController(),
            varl: LOXtextTypes.password),
        const SizedBox(
          height: 24,
        ),
        Lox.defButton(null, title[_curState],
            bcolor: const Color(0xFF000113), brad: 4),
        const SizedBox(
          height: 42,
        ),
        const Text(
          "Or continue with",
          style: TextStyle(color: Color(0xFF64748B)),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            buildSocialMediaButton("assets/images/google.png", "Google"),
            const Spacer(),
            buildSocialMediaButton("assets/images/facebook.png", "Facebook"),
          ],
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: desc[_curState],
            style: const TextStyle(color: Color(0xFF64748B), fontSize: 16),
          ),
          WidgetSpan(
              child: GestureDetector(
            onTap: () {
              setState(() {
                if (_curState == 0) {
                  _curState = 1;
                } else {
                  _curState = 0;
                }
              });
            },
            child: Text(
              descExt[_curState],
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          )),
        ]))
      ],
    ));
  }
}
