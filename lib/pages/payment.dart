import 'package:flutter/material.dart';
import 'package:loxtest/lox.dart';
import 'package:loxtest/pages/donepage.dart';

class PaymentPage extends StatefulWidget {
  final Function func;
  const PaymentPage(this.func, {Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: const Color(0xFFF2F2F2),
              child: const ListTile(
                leading: Icon(
                  Icons.credit_card,
                  color: Color(0xFF3E3E50),
                ),
                title: Text(
                  "Credit/Debit Card",
                  style: TextStyle(
                      color: Color(0xFF3E3E50),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF3E3E50),
                ),
              ),
            ),
            const SizedBox(
              height: 56,
            ),
            Lox.defTableRow(
                const Text("Order",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3E3E50))),
                const Text.rich(TextSpan(children: [
                  const WidgetSpan(
                      child: Icon(
                    Icons.edit,
                    size: 16,
                    color: Lox.primaryColor,
                  )),
                  TextSpan(
                      text: " Edit",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Lox.primaryColor))
                ]))),
            Lox.defTableRow(
                const Text("Nurse",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF3E3E50))),
                const Text("Quantity",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3E3E50)))),
            const Divider(color: Color(0xFFE0E0E0)),
            Lox.defCell(),
            const Divider(color: Color(0xFFE0E0E0)),
            Lox.defTableRow(
                const Text("Total",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3E3E50))),
                const Text("\$250.00",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3E3E50)))),
            const SizedBox(
              height: 32,
            ),
            Lox.defDottedButton("Discount Code"),
            const SizedBox(
              height: 120,
            ),
            Lox.defButton(null, "PAY", shdStay: true, func: () {
              widget.func();
            }),
            // const SizedBox(
            //   height: 32,
            // )
          ]),
    );
  }
}
