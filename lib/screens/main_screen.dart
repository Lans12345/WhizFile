import 'package:files_tracking/auth/login_page.dart.dart';
import 'package:files_tracking/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Image(
                width: 500,
                image: AssetImage('assets/images/fblogo.jpg'),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: TextBold(
                  text: 'WHiZ File',
                  fontSize: 52,
                  color: Colors.lightGreen[400]!),
            ),
          ],
        ),
      ),
    );
  }
}
