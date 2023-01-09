import 'package:files_tracking/widgets/button_widget.dart';
import 'package:files_tracking/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class RatesPage extends StatelessWidget {
  RatesPage({super.key});

  late String qty;
  late String length;
  late String width;
  late String from;
  late String to;
  late String item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.keyboard_double_arrow_up_sharp,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextRegular(
                              text: 'From', fontSize: 14, color: Colors.black),
                          SizedBox(
                              height: 30,
                              width: 300,
                              child: TextFormField(
                                onChanged: (input) {
                                  from = input;
                                },
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 12),
                                    hintText: 'Origin City'),
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.keyboard_double_arrow_down_sharp,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextRegular(
                              text: 'To', fontSize: 14, color: Colors.black),
                          SizedBox(
                              height: 30,
                              width: 300,
                              child: TextFormField(
                                onChanged: (input) {
                                  to = input;
                                },
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 12),
                                    hintText: 'Destination City'),
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextRegular(
                            text: 'Item', fontSize: 14, color: Colors.black),
                        TextFormField(
                          onChanged: (input) {
                            item = input;
                          },
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 12),
                              hintText: 'File Type:'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextFormField(
                      onChanged: (input) {
                        qty = input;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 12),
                          hintText: 'Quantity: '),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextRegular(
                            text: '       Paper Size',
                            fontSize: 14,
                            color: Colors.black),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                onChanged: (input) {
                                  length = input;
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 12),
                                    hintText: 'Length:'),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                onChanged: (input) {
                                  width = input;
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 12),
                                    hintText: 'Width:'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonWidget(
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => Dialog(
                                  child: SizedBox(
                                    height: 300,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              children: [
                                                TextBold(
                                                    text:
                                                        'Estimated Shipping Rate',
                                                    fontSize: 18,
                                                    color: Colors.teal),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextBold(
                                                text: 'Origin: $from',
                                                fontSize: 14,
                                                color: Colors.black),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextBold(
                                                text: 'Destination: $to',
                                                fontSize: 14,
                                                color: Colors.black),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextBold(
                                                text: 'Item Type: $item',
                                                fontSize: 14,
                                                color: Colors.black),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextBold(
                                                text: 'Quantity: $qty',
                                                fontSize: 12,
                                                color: Colors.black),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextBold(
                                                text:
                                                    'Length: $length Width: $width',
                                                fontSize: 12,
                                                color: Colors.black),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                                child: TextBold(
                                                    text:
                                                        'Estimated Rate: ${(((double.parse(length) / double.parse(width)) * 10) * double.parse(qty)).toStringAsFixed(2)}php',
                                                    fontSize: 18,
                                                    color: Colors.amber)),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: ButtonWidget(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  text: 'Close'),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                      },
                      text: 'Calculate'),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.teal,
              child: ListTile(
                leading: const Icon(
                  Icons.shopping_cart_checkout_rounded,
                  color: Colors.white,
                ),
                title: TextBold(
                    text: 'Shipping Rates\nDomestic Shipments',
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
