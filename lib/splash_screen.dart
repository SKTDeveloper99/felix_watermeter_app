import 'package:felix_watermeter_app/bottom_bar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => const BottomNavigationBarControl())));
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(164, 210, 227, 1.0),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Container(
                    height: 180,
                    width: 180,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/khoatrancodingminds.appspot.com/o/WechatIMG102.jpg?alt=media&token=5d5a5682-8293-43ca-851b-4380b2508cc8"),
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: const [
                      Text(
                        "Version",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "1.0.0",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 630,
            ),
          ],
        ),
      ),
    );
  }
}