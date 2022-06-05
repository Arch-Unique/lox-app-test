import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loxtest/components/apptpage.dart';
import 'package:loxtest/lox.dart';
import 'package:loxtest/pages/apptwithclient.dart';
import 'package:loxtest/pages/homepage.dart';
import 'package:loxtest/pages/payment.dart';
import 'package:loxtest/pages/profilepage.dart';
import 'package:loxtest/pages/searchpage.dart';

class MainPage extends StatefulWidget {
  final int curScreen;
  const MainPage(this.curScreen, {Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentScreen = 1;
  List<Widget?> screens = [];
  Map<String, String> tabs = {
    "Home": "assets/svgs/home.svg",
    "Search": "assets/svgs/search.svg",
    "Appointment": "assets/svgs/calendar.svg",
    "Me": "assets/svgs/person.svg",
  };

  @override
  void initState() {
    _currentScreen = widget.curScreen;
    screens = [HomePage(), SearchPage(), ApptPage(), HomePage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
            child: SingleChildScrollView(child: screens[_currentScreen]),
          ),
        ),
        bottomNavigationBar: buildbottomNavBar());
  }

  buildbottomNavBar() {
    return BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              MapEntry<String, String> eachTab = tabs.entries.elementAt(index);
              return buildNavItem(eachTab.value, eachTab.key, index);
            }),
          ),
        ));
  }

  buildNavItem(String a, String b, int i) {
    bool c = i == _currentScreen;
    Color sel = c ? Lox.primaryColor : Color(0xFF929CAD);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_currentScreen != i) {
            _currentScreen = i;
          }
        });
      },
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SvgPicture.asset(
          a,
          color: sel,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          b,
          style: c
              ? TextStyle(
                  fontFamily: 'Montserrat',
                  color: sel,
                  fontWeight: FontWeight.w500,
                  fontSize: 10)
              : TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  color: sel,
                  fontSize: 10),
        )
      ]),
    );
  }
}
