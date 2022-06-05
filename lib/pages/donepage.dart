import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loxtest/lox.dart';
import 'package:loxtest/pages/addappointment.dart';

class DonePage extends StatefulWidget {
  final Function func;
  const DonePage(this.func, {Key? key}) : super(key: key);

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height - 120,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            size: 120,
            color: Color(0xFF05C88D),
          ),
          const SizedBox(
            height: 54,
          ),
          Text(
            "Done",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Lox.textColor),
          ),
          const SizedBox(height: 150),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                  onTap: () {
                    widget.func();
                  },
                  child: Lox.defDottedButton("View Appointments")))
        ],
      )),
    );
  }
}
