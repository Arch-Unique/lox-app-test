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
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lox.defCalendarHeader(),
            const SizedBox(
              height: 24,
            ),
            Expanded(child: CalendarPicker2()),
            Padding(
                padding: EdgeInsets.all(16),
                child: Lox.defDottedButton("Add Appointment")),
            const SizedBox(
              height: 48,
            )
          ],
        ),
      ),
    );
  }
}
