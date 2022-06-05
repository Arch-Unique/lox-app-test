import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loxtest/lox.dart';
import 'package:loxtest/pages/profilepage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Lox.fitImage("assets/images/people.png"),
          const SizedBox(
            height: 32,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Hire a nurse",
                style: TextStyle(
                    color: const Color(0xFF6A788E),
                    fontFamily: 'Montserrat',
                    fontSize: 16),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (ctx, i) {
              return ListTile(
                onTap: () {
                  Get.to(ProfilePage());
                },
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF242736),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                      child: Text(
                    "S",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
                ),
                title: const Text(
                  "Seun Olumide",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF242736)),
                ),
                subtitle: const Text(
                  "Gbagada",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Color(0xFFAEAEB3)),
                ),
                trailing: Text(
                  "\$250",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFF4658)),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
