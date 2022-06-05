import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loxtest/components/customcheckbox.dart';
import 'package:loxtest/controllers/calendar.dart';
import 'package:loxtest/lox.dart';

class CalPicker extends StatefulWidget {
  const CalPicker({Key? key}) : super(key: key);

  @override
  State<CalPicker> createState() => _CalPickerState();
}

class _CalPickerState extends State<CalPicker> {
  List<String> g = ["Mo", "Tu", "Wed", "Th", "Fr", "Sa", "Su"];
  List<String> defTimes = List.generate(24, (index) {
    return "$index".padLeft(2, "0") + ":00";
  });
  final lc = LoxCalendar();
  List<List<int>> weeks = [];
  int today = DateTime.now().day;
  late int curday;
  late int curweek;
  CarouselController cc = CarouselController();
  CarouselController cd = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    weeks = lc.getCalendarWeeks();
    curweek = lc.curWeek();
    curday = today;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDates(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Lox.textTile(a: "Schedule Today", b: "", isCont: false),
        ),
        buildTimes()
      ],
    );
  }

  buildDates() {
    return CarouselSlider.builder(
      itemBuilder: (ctx, i, j) {
        return buildDateContainer(i);
      },
      itemCount: weeks.length,
      carouselController: cc,
      options: CarouselOptions(
        disableCenter: true,
        autoPlay: false,
        viewportFraction: 1,
        height: 88,
        initialPage: curweek,
      ),
    );
  }

  buildTimes() {
    return CarouselSlider.builder(
      itemBuilder: (ctx, i, j) {
        return buildListItemTimes();
      },
      itemCount: lc.getCalendar().length,
      carouselController: cd,
      options: CarouselOptions(
        disableCenter: true,
        viewportFraction: 1,
        onPageChanged: (a, b) {
          final ncweek = a ~/ 7;
          cc.animateToPage(ncweek);
          setState(() {
            curday = lc.getCurDay(a);
          });
        },
        initialPage: lc.getCurIndex(),
      ),
    );
  }

  Widget buildListItemTimes() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: Get.height / 4,
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            return buildItemTimes(defTimes[i]);
          },
          itemCount: defTimes.length,
        ),
      ),
    );
  }

  buildItemTimes(String a) {
    final ta = (int.parse(a[0]) * 10) + int.parse(a[1]);
    bool isOn = ta == 1;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            a,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                color: Color(0xFF94A3B8),
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(width: 4),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildLine(DateTime.now().hour == ta),
                StatefulBuilder(builder: (ctx, setState) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          isOn = !isOn;
                        });
                      },
                      child: buildScheduleItems(isOn));
                })
              ])
        ]);
  }

  Widget buildScheduleItems(bool a) {
    return Container(
        width: Get.width * 0.75,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: a ? Color(0xFFFAE9E9) : Colors.white,
        ),
        child: a
            ? Lox.defTableRow(
                Lox.textTile(
                    a: "Cardiologist", b: "Dan Johnson", isCont: false),
                Image.asset("assets/images/profile.png"))
            : const SizedBox(
                height: 48,
              ));
  }

  buildLine(bool a) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: a ? Lox.primaryColor : Colors.white),
      ),
      const SizedBox(
        width: 4,
      ),
      Container(
          width: Get.width * 0.75,
          height: 1,
          color: a ? Lox.primaryColor : Color(0xFF94A3B8).withOpacity(0.2))
    ]);
  }

  Widget buildDateContainer(int i) {
    final dates = weeks[i];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              dates.length,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        curday = dates[index];
                        final page = i * 7 + index;
                        cd.jumpToPage(page);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: curday == dates[index]
                              ? Color(0xFFEFF1FC)
                              : Colors.white),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("${dates[index]}",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: curday == dates[index]
                                      ? Lox.primaryColor
                                      : Lox.textColor)),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(g[index],
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: curday == dates[index]
                                      ? Lox.primaryColor
                                      : Color(0xFF94A3B8))),
                        ],
                      ),
                    ),
                  ))),
    );
  }
}

class CalendarPicker2 extends StatefulWidget {
  const CalendarPicker2({Key? key}) : super(key: key);

  @override
  State<CalendarPicker2> createState() => _CalendarPicker2State();
}

class _CalendarPicker2State extends State<CalendarPicker2> {
  List<String> g = ["Mo", "Tu", "Wed", "Th", "Fr", "Sa", "Su"];
  List<String> defTimes = List.generate(24, (index) {
    return "$index".padLeft(2, "0") + ":00";
  });
  final lc = LoxCalendar();
  List<List<int>> weeks = [];
  int today = DateTime.now().day;
  late int curday;
  late int curweek;
  CarouselController cc = CarouselController();
  CarouselController cd = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    weeks = lc.getCalendarWeeks();
    curweek = lc.curWeek();
    curday = today;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildDates(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: buildStepper(),
        ))
      ],
    );
  }

  buildDates() {
    return CarouselSlider.builder(
      itemBuilder: (ctx, i, j) {
        return buildDateContainer(i);
      },
      itemCount: weeks.length,
      carouselController: cc,
      options: CarouselOptions(
        disableCenter: true,
        autoPlay: false,
        viewportFraction: 1,
        height: 120,
        initialPage: curweek,
      ),
    );
  }

  Widget buildStepper() {
    return CarouselSlider.builder(
      itemBuilder: (ctx, i, j) {
        return ListView.builder(
          itemBuilder: (ctx, i) {
            return buildSteps(i == 3);
          },
          itemCount: 4,
        );
      },
      itemCount: lc.getCalendar().length,
      carouselController: cd,
      options: CarouselOptions(
        disableCenter: true,
        viewportFraction: 1,
        onPageChanged: (a, b) {
          final ncweek = a ~/ 7;
          cc.animateToPage(ncweek);
          setState(() {
            curday = lc.getCurDay(a);
          });
        },
        initialPage: lc.getCurIndex(),
      ),
    );
  }

  Widget buildDateContainer(int i) {
    final dates = weeks[i];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              dates.length,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        curday = dates[index];
                        final page = i * 7 + index;
                        cd.jumpToPage(page);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(g[index],
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: curday == dates[index]
                                      ? Color(0xFF0C9359)
                                      : Colors.black.withOpacity(0.5))),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("${dates[index]}",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: curday == dates[index]
                                      ? Color(0xFF0C9359)
                                      : Colors.black)),
                          curday == dates[index]
                              ? Icon(
                                  Icons.circle,
                                  color: Color(0xFF0C9359),
                                  size: 8,
                                )
                              : const SizedBox(
                                  height: 8,
                                ),
                        ],
                      ),
                    ),
                  ))),
    );
  }

  Widget buildSteps(bool isLast) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCircleItem(isLast),
        const SizedBox(
          width: 40,
        ),
        SizedBox(
          width: Get.width * 0.75,
          child: Row(
            children: [
              Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Seun Olumide",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "9:00am",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                  ]),
              const Spacer(),
              CustomCheckBox(
                isChecked: !isLast,
              ),
            ],
          ),
        )
      ],
    );
  }

  buildCircleItem(bool isLast) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: 32,
            width: 32,
            child: Icon(
              Icons.radio_button_checked,
              size: 24,
              color: Color(0xFF0C9359),
            )),
        const SizedBox(
          height: 4,
        ),
        isLast
            ? const SizedBox()
            : Container(
                height: Get.height / 16,
                width: 2,
                color: Color(0xFF0C9359),
              ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
