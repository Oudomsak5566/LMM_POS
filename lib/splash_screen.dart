import 'package:flutter/material.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FooterLayout(
        footer: Text('data'),
        child: TextField(),
        // child: PageMainContent(),
      ),
    );
  }
}
