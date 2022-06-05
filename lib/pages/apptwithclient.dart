import 'package:flutter/material.dart';
import 'package:loxtest/components/calendarpicker.dart';
import 'package:loxtest/lox.dart';
import 'package:loxtest/pages/payment.dart';

class ApptWithClientPage extends StatefulWidget {
  final Function func, pfunc;
  const ApptWithClientPage(this.func, this.pfunc, {Key? key}) : super(key: key);

  @override
  State<ApptWithClientPage> createState() => _ApptWithClientPageState();
}

class _ApptWithClientPageState extends State<ApptWithClientPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Lox.defCalendarHeader(),
          ),
          const SizedBox(
            height: 8,
          ),
          CalPicker(),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Lox.textTile(
                a: "Reminder",
                b: "Dont forget schedule for upcoming appointment",
                isCont: false),
          ),
          buildBottom()
        ],
      ),
    );
  }

  buildBottom() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildProfileHeader(),
        const SizedBox(
          height: 16,
        ),
        buildPickers(),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Lox.defButton(null, "Schedule",
                brad: 12, isWide: false, shdStay: true, hpad: 36, func: () {
              widget.func();
            }),
            Lox.defButton(null, "Cancel",
                brad: 12,
                isWide: false,
                isBorder: true,
                bcolor: Colors.white,
                shdStay: true, func: () {
              widget.pfunc();
            }),
          ]),
        )
      ],
    );
  }

  buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lox.textTile(isCont: false),
              Lox.smallSocialContainer("star", "Rating", "4.78 out of 5",
                  col: Color(0xFFEF802F)),
            ],
          ),
          const Spacer(),
          Image.asset(
            "assets/images/icon.png",
            height: 80,
            width: 80,
          ),
        ],
      ),
    );
  }

  buildPickers() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        width: double.maxFinite,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(0xFFF5FAFF)),
        child: Lox.defTableRow(
          Lox.defIconText(
            Icon(
              Icons.calendar_month_rounded,
              color: Lox.primaryColor,
              size: 16,
            ),
            Text(" Monday, Dec 23",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Lox.primaryColor,
                    fontWeight: FontWeight.w600)),
            isFront: true,
          ),
          Lox.defIconText(
              Icon(
                Icons.access_time_filled,
                color: Lox.primaryColor,
                size: 16,
              ),
              Text(" 12:00 - 13:00",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: Lox.primaryColor,
                      fontWeight: FontWeight.w600)),
              isFront: true),
        ),
      ),
    );
  }
}
