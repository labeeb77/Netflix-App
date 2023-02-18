import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../main_page/widgets/screen_main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToHome();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/netflix-logo.png'),
                )),
      ),
    );
  }

  Future<void> goToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    // if (!mounted) {
    //   return;
    // }
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) =>  ScreenMainPage(),
    ));
  }
}
