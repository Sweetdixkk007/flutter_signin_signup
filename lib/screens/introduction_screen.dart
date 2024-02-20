import 'package:onboarding_screen/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'สวัสดีจ้า!',
      body: 'ความรักก็เหมือนชีโตส ถ้าเธออยากโบตสะโบตโต้สเคส',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
// primary: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text("กดดิ!"),
        ),
      ),
      image: Center(
        child: Image.network(
            'data:image/jpeg;base64,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'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'ไม่รู้เบื่อ',
      body: 'ลุงเกมผัวเจ๊สี่ น้ำหมดอดล้างตูด',
// title: 'First Page',
// body: 'Description',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
// primary: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text("จัดไป"),
        ),
      ),
      image: Center(
        child: Image.network(
            'https://cloud.soichat.com/node_users/01/24698176/5f3383bb-ac77-44ea-b0af-819b48e2d0ae_big.jpeg'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'โบโบ้',
      body: '460 องศาเซลเซียส',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('คลิกๆๆ'),
        ),
      ),
      image: Center(
        child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIzuOjM6OnRTwGQ_j5tBQrhF9QeeH76tSouhfvOJfy6Fo9lVBTJn3DFBYJexdiGFkP9dQ&usqp=CAU'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On Boarding'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.blue,
          ),
          showDoneButton: true,
          done: const Text(
            'Done',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
