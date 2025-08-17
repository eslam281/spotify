import 'package:flutter/material.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:(context) => const GetStartedPage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Image.asset(AppImages.logo),)
    );
  }
}
