import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

/// This file consists of all the constants in this project

enum LOXtextTypes {
  email,
  phone,
  text,
  password,
  multi,
}

class Lox {
  static const Color primaryColor = Color(0xFF1648CE);
  static const Color textColor = Color(0xFF091F44);
  static const monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static Widget iconImage(String a) {
    return SizedBox(
      height: 24,
      width: 24,
      child: Image(
        image: AssetImage(a),
        width: 24,
        height: 24,
      ),
    );
  }

  static Widget smallSocialContainer(String a, String b, String c,
      {Color? col}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          "assets/svgs/$a.svg",
          color: col ?? primaryColor,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              b,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF394D6D),
              ),
            ),
            Text(
              c,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF091F44),
              ),
            ),
          ],
        )
      ],
    );
  }

  static Widget defTextFormField(String hint, TextEditingController _controller,
      {LOXtextTypes varl = LOXtextTypes.email, bool isLogin = true}) {
    return SizedBox(
      width: Get.width - 32,
      child: TextFormField(
        controller: _controller,
        keyboardType: varl == LOXtextTypes.email
            ? TextInputType.emailAddress
            : TextInputType.text,
        style: const TextStyle(fontSize: 14),
        validator: (value) => LOXtextTypesValidator(value).validate(varl),
        obscureText: varl == LOXtextTypes.password,
        decoration: InputDecoration(
            labelText: hint,
            fillColor: Colors.white,
            suffix: isLogin
                ? GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot ?",
                    ))
                : null,
            labelStyle: const TextStyle(
              fontSize: 14,
            )),
      ),
    );
  }

  static Container fitImage(String a) {
    return Container(
      width: Get.width,
      height: Get.height * 0.21,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(a),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Lox.primaryColor.withOpacity(0.69), BlendMode.srcOver))),
    );
  }

  static Container circleBox(double size, Color color,
      {Widget? child, bool isShadow = true}) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: isShadow
              ? const [
                  BoxShadow(
                    color: Color.fromRGBO(33, 214, 118, 0.2),
                    blurRadius: 50,
                  )
                ]
              : null),
      child: child,
    );
  }

  static Container circleButton(Color color, {Widget? child}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        backgroundBlendMode: BlendMode.multiply,
        color: color,
      ),
      child: child,
    );
  }

  static AppBar defBackAppBar({Function? func}) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              func == null ? Get.back() : func();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )));
  }

  static Widget textTile(
      {String a = "Seun Olumide", String b = "Nurse", bool isCont = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          a,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF091F44),
          ),
        ),
        Text(
          b,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF091F44),
          ),
        ),
        isCont
            ? Lox.smallSocialContainer("people", "Patients", "345+")
            : const SizedBox(),
      ],
    );
  }

  static Widget defTableRow(Widget a, Widget b) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [a, const Spacer(), b],
      ),
    );
  }

  static Widget defIconText(Widget icon, Text a, {bool isFront = false}) {
    return Text.rich(TextSpan(children: [
      WidgetSpan(
          child: isFront ? icon : a, alignment: PlaceholderAlignment.middle),
      WidgetSpan(
          child: isFront ? a : icon, alignment: PlaceholderAlignment.middle),
    ]));
  }

  static Widget defCell({String? a, String? b, String? c}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 48, left: 8, right: 8),
      child: Row(
        children: [
          const Text("Seun Olumide \n\$250",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF3E3E50))),
          const Spacer(),
          const Text("1",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF3E3E50)))
        ],
      ),
    );
  }

  static Widget defCalendarHeader() {
    final today = DateTime.now();
    final month = monthNames[today.month - 1];
    String day = today.day > 9 ? today.day.toString() : "0${today.day}";

    return defTableRow(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$month $day, ${today.year}",
              style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF929CAD)),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text("Today",
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 20)),
          ],
        ),
        defButton(null, "+ Add", brad: 90, isWide: false, vpad: 8, hpad: 24));
  }

  static Widget defDottedButton(String a) {
    return DottedBorder(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [const Spacer(), Text(a), const Spacer()],
        ),
      ),
      borderType: BorderType.RRect,
      radius: const Radius.circular(8),
    );
  }

  static Widget defButton(
    Widget? screen,
    String data, {
    Color bcolor = primaryColor,
    bool isWide = true,
    double hpad = 48,
    double vpad = 10,
    bool isBorder = false,
    bool porr = false,
    double brad = 8,
    double fsize = 16,
    bool shdStay = false,
    String icon = "",
    bool isF = true,
    Function? func,
  }) {
    bool isPressed = false;
    return StatefulBuilder(builder: (context, setState) {
      return TextButton(
        onPressed: screen == null
            ? () async {
                setState(() {
                  isPressed = true;
                });
                if (!shdStay) {
                  Get.back();
                } else {
                  await func!();
                  setState(() {
                    isPressed = false;
                  });
                }
              }
            : () {
                setState(() {
                  isPressed = true;
                });
                porr ? Get.to(screen) : Get.off(screen);
              },
        child: isPressed
            ? loadingIndicator()
            : icon != ""
                ? Text.rich(TextSpan(children: [
                    isF
                        ? WidgetSpan(
                            child: iconImage(icon),
                            alignment: PlaceholderAlignment.middle,
                          )
                        : TextSpan(),
                    TextSpan(
                      text: "  $data  ",
                      style: TextStyle(
                          color: bcolor != Colors.white
                              ? Colors.white
                              : primaryColor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: fsize),
                    ),
                    isF
                        ? TextSpan()
                        : WidgetSpan(
                            child: iconImage(icon),
                            alignment: PlaceholderAlignment.middle,
                          ),
                  ]))
                : Text(
                    data,
                    style: TextStyle(
                        color: bcolor != Colors.white
                            ? Colors.white
                            : primaryColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserrat',
                        fontSize: fsize),
                  ),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size?>(
              isWide ? const Size.fromHeight(24) : null),
          backgroundColor: MaterialStateProperty.all<Color>(bcolor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(brad),
                side: isBorder
                    ? const BorderSide(color: primaryColor)
                    : BorderSide.none),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: vpad, horizontal: hpad)),
        ),
      );
    });
  }

  static Widget loadingIndicator() {
    return const SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        color: primaryColor,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class LOXtextTypesValidator {
  String? value;

  LOXtextTypesValidator(this.value) {
    value = value?.trim();
  }

  static bool validList(List<TextEditingController> tecs) {
    int validCnt = 0;
    for (TextEditingController cont in tecs) {
      cont.value.text.isNotEmpty ? validCnt++ : validCnt--;
    }
    return validCnt == tecs.length;
  }

  String? validate(LOXtextTypes m) {
    switch (m) {
      case LOXtextTypes.text:
        return valText();
      case LOXtextTypes.email:
        return valEmail();
      case LOXtextTypes.phone:
        return valPhone();
      case LOXtextTypes.password:
        return valPassword();
      default:
        return null;
    }
  }

  String? valEmail() {
    if (GetUtils.isEmail(value ?? "")) {
      return null;
    }
    return "Invalid Email";
  }

  String? valPhone() {
    if (value != null &&
        value!.length == 10 &&
        (value!.startsWith("8") ||
            value!.startsWith("7") ||
            value!.startsWith("9"))) {
      return null;
    }
    return "Invalid Phone Number";
  }

  String? valText() {
    if (value != null && value!.isNotEmpty) {
      return null;
    }
    return "Must not be empty";
  }

  String? valPassword() {
    if (value != null && value!.length >= 8) {
      return null;
    }
    return "Invalid Password";
  }
}
