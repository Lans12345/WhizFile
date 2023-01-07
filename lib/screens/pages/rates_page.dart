import 'package:files_tracking/widgets/appbar_widget.dart';
import 'package:files_tracking/widgets/button_widget.dart';
import 'package:files_tracking/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class RatesPage extends StatelessWidget {
  const RatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget('Shipping Rates'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextBold(
                  text: 'Domestic Shipments',
                  fontSize: 18,
                  color: Colors.black),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_double_arrow_up_sharp,
                    size: 32,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextRegular(
                          text: 'From', fontSize: 14, color: Colors.black),
                      SizedBox(
                          height: 30,
                          width: 250,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 12),
                                hintText: 'Origin City'),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_double_arrow_down_sharp,
                    size: 32,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextRegular(
                          text: 'To', fontSize: 14, color: Colors.black),
                      SizedBox(
                          height: 30,
                          width: 250,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 12),
                                hintText: 'Destination City'),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
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
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 12),
                          hintText: 'File Type:'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 12),
                      hintText: 'Quantity: '),
                ),
              ),
              SizedBox(
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
                            decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 12),
                                hintText: 'Length:'),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 12),
                                hintText: 'Width:'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ButtonWidget(onPressed: () {}, text: 'Calculate'),
            ],
          ),
        ),
      ),
    );
  }
}
