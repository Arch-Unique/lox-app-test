import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final bool isChecked;
  const CustomCheckBox({this.isChecked = false, Key? key}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  void initState() {
    isChecked = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.black),
        child: isChecked
            ? Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
