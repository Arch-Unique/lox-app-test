import 'package:flutter/material.dart';
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

  static Widget defButton(
    Widget? screen,
    String data, {
    Color bcolor = primaryColor,
    bool isWide = true,
    bool isBorder = false,
    bool porr = false,
    double brad = 8,
    bool shdStay = false,
    String icon = "",
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
                    WidgetSpan(
                      child: iconImage(icon),
                      alignment: PlaceholderAlignment.middle,
                    ),
                    TextSpan(
                      text: "  $data",
                      style: TextStyle(
                          color: bcolor != Colors.white
                              ? Colors.white
                              : primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    )
                  ]))
                : Text(
                    data,
                    style: TextStyle(
                        color: bcolor != Colors.white
                            ? Colors.white
                            : primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
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
              const EdgeInsets.symmetric(vertical: 10, horizontal: 48)),
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
