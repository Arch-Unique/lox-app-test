import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loxtest/lox.dart';
import 'package:loxtest/pages/addappointment.dart';
import 'package:loxtest/pages/apptwithclient.dart';
import 'package:loxtest/pages/donepage.dart';
import 'package:loxtest/pages/payment.dart';
import 'package:loxtest/pages/profilepage.dart';

class ApptPage extends StatefulWidget {
  const ApptPage({Key? key}) : super(key: key);

  @override
  State<ApptPage> createState() => _ApptPageState();
}

class _ApptPageState extends State<ApptPage> {
  List<Widget> screens = [];

  int curPage = 0;

  nextPage() {
    if (curPage != 3) {
      setState(() {
        curPage++;
      });
    }
  }

  previousPage() {
    if (curPage != 0) {
      setState(() {
        curPage--;
      });
    }
  }

  @override
  void initState() {
    screens = [
      ApptWithClientPage(nextPage, () {
        Get.to(ProfilePage());
      }),
      PaymentPage(nextPage),
      DonePage(nextPage),
      AddAppointmentPage()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        curPage == 0
            ? const SizedBox()
            : Lox.defBackAppBar(func: () {
                previousPage();
              }),
        screens[curPage],
      ],
    );
  }
}
