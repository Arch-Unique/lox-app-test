import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loxtest/lox.dart';
import 'package:loxtest/pages/apptwithclient.dart';
import 'package:loxtest/pages/donepage.dart';
import 'package:loxtest/pages/mainpage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> ratingProf = ["question", "qperson"];
  List<String> ratingName = ["Anonymous Feedback", "Erika Lhee"];
  List<String> ratingDesc = [
    "Very competent specialist. I am very happy that there are such professional doctors. My baby is in safe hands. My child's health is above all",
    "Just a wonderful doctor, very happy that she is leading our child, competent, very smart, nice."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.chevron_left_rounded,
                color: Lox.primaryColor,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.mail_rounded, color: Lox.primaryColor))
          ],
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Profile",
            style: TextStyle(
                color: Color(0xFF070532),
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            buildProfileHeader(),
            buildProfileNumbers(),
            buildRatingBox(),
            Lox.defButton(MainPage(2), "Make Appointment",
                icon: "assets/images/mapt.png", vpad: 15)
          ]),
        ),
      ),
    );
  }

  buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Image.asset(
            "assets/images/icon.png",
            height: 80,
            width: 80,
          ),
          const SizedBox(
            width: 16,
          ),
          Lox.textTile()
        ],
      ),
    );
  }

  buildProfileNumbers() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildProfItemNum("275", "Articles"),
              buildProfItemNum("234", "Following"),
              buildProfItemNum("123", "Followers")
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Lox.defButton(null, "Follow", brad: 12, isWide: false),
            Lox.defButton(null, "Message",
                brad: 12, isWide: false, isBorder: true, bcolor: Colors.white),
          ])
        ],
      ),
    );
  }

  buildProfItemNum(String a, String b) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          a,
          style: TextStyle(
              color: Lox.textColor,
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          b,
          style: TextStyle(
              color: Lox.textColor,
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }

  buildRatingBox() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Lox.smallSocialContainer("star", "Rating", "4.78 out of 5",
                  col: Color(0xFFEF802F)),
              const Spacer(),
              Lox.defButton(null, "See All",
                  isWide: false,
                  brad: 90,
                  isF: false,
                  vpad: 6,
                  hpad: 16,
                  icon: "assets/images/right.png")
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          ...List.generate(
              2,
              (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/${ratingProf[index]}.png",
                        height: 24,
                        width: 24,
                      ),
                      title: Text(
                        ratingName[index],
                        style: TextStyle(
                            color: Lox.primaryColor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        ratingDesc[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ))
        ],
      ),
    );
  }
}
