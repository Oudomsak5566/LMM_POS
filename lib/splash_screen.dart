import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lmm_pos/main_screen.dart';
import 'package:lmm_pos/widgets/textfont.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Get.off(const MainScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 70.w,
              child: Lottie.asset('assets/lotties/Animation - 1715778369520.json'),
            ),
          ),
          TextFont(
            text: 'LMM - POS',
            poppin: true,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
