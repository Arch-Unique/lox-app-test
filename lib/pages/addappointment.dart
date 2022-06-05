import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loxtest/components/calendarpicker.dart';
import 'package:loxtest/lox.dart';

class AddAppointmentPage extends StatefulWidget {
  final DateTime? today;
  const AddAppointmentPage({this.today, Key? key}) : super(key: key);

  @override
  State<AddAppointmentPage> createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  // bool isToday =

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height - 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Lox.defCalendarHeader(),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(child: CalendarPicker2()),
          Padding(
              padding: EdgeInsets.all(20),
              child: Lox.defDottedButton("Add Appointment")),
          const SizedBox(
            height: 48,
          )
        ],
      ),
    );
  }
}
