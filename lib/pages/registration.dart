import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loxtest/components/regpainter.dart';
import 'package:loxtest/lox.dart';
import 'package:loxtest/pages/mainpage.dart';

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
  List<TextEditingController> conts =
      List.generate(2, (index) => TextEditingController());
  double wbox = sqrt(((Get.width + 30) * (Get.width + 30)) / 2);
  final key = GlobalKey<FormState>();
  bool isLogin = true;
  bool isEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Lox.primaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(height: Get.height, width: Get.width),
          Positioned(top: 72, left: 0, right: 0, child: buildHeader()),
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: RegPainter(),
              child: Container(
                color: Colors.white,
                height: Get.height,
                width: Get.width,
                child: Align(
                    alignment: Alignment.bottomCenter, child: buildForm()),
              ),
            ),
          ),

          // Positioned(
          //   top: Get.height * 0.3,
          //   child: Transform.rotate(
          //     angle: pi / 4,
          //     child: Container(
          //       height: wbox,
          //       width: wbox,
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(30)),
          //     ),
          //   ),
          // ),

          // Positioned(bottom: 0, child: buildForm()),
          //   CustomPaint(
          //   painter: RegPainter(),
          // ),
        ],
      ),
    );
  }

  buildHeader() {
    return Row(children: [
      const Spacer(),
      Image.asset(
        "assets/images/logo.png",
        height: 46,
        width: 46,
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
              const EdgeInsets.symmetric(vertical: 10, horizontal: 24)),
        ),
      ),
    );
  }

  Widget buildForm() {
    return SizedBox(
      width: Get.width,
      height: Get.height / 1.5,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
            key: key,
            child: Column(
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
                Lox.defTextFormField("Email", conts[0], isLogin: !isEmail),
                const SizedBox(
                  height: 16,
                ),
                Lox.defTextFormField("Password", conts[1],
                    isLogin: isLogin, varl: LOXtextTypes.password),
                const SizedBox(
                  height: 24,
                ),
                Lox.defButton(
                  null,
                  title[_curState],
                  bcolor: const Color(0xFF000113),
                  brad: 4,
                  fsize: 14,
                  shdStay: true,
                  func: () {
                    final form = key.currentState!;
                    if (form.validate()) {
                      Get.to(MainPage(1));
                    }
                  },
                ),
                const Spacer(),
                const Text(
                  "Or continue with",
                  style: TextStyle(color: Color(0xFF64748B)),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    buildSocialMediaButton(
                        "assets/images/google.png", "Google"),
                    const Spacer(),
                    buildSocialMediaButton(
                        "assets/images/facebook.png", "Facebook"),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: desc[_curState],
                    style:
                        const TextStyle(color: Color(0xFF64748B), fontSize: 16),
                  ),
                  WidgetSpan(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_curState == 0) {
                          _curState = 1;
                          isLogin = false;
                        } else {
                          _curState = 0;
                          isLogin = true;
                        }
                      });
                    },
                    child: Text(
                      "  ${descExt[_curState]}",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  )),
                ])),
                const Spacer()
              ],
            )),
      ),
    );
  }
}
