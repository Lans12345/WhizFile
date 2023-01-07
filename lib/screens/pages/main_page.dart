import 'package:files_tracking/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.teal),
              width: double.infinity,
              height: 150,
              child: Center(
                child: TextBold(
                  text: 'Ads Section',
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal),
                width: 150,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextBold(
                          text: 'Order',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextBold(
                          text: 'Create Order',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal),
                width: 150,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextBold(
                          text: 'Tracking',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextBold(
                          text: 'Track your Order',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ListTile(
                      leading: const Icon(Icons.discount),
                      title: TextRegular(
                          text: 'Vouchers', fontSize: 14, color: Colors.black),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
