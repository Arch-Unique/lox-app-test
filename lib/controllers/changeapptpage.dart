import 'package:flutter/material.dart';
import 'package:loxtest/pages/addappointment.dart';
import 'package:loxtest/pages/apptwithclient.dart';
import 'package:loxtest/pages/donepage.dart';
import 'package:loxtest/pages/payment.dart';

class ChangeApptPage {
  List<Widget> screens = [
    ApptWithClientPage(),
    PaymentPage(),
    DonePage(),
    AddAppointmentPage()
  ];

  int curPage = 0;

  nextPage() {
    if (curPage != 3) {
      curPage++;
    }
  }

  previousPage() {
    if (curPage != 0) {
      curPage--;
    }
  }
}
