import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/language.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:pair_me/helper/pref_Service.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  SharedPrefsService prefsService = SharedPrefsService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Splash_Timer();
  }
  Splash_Timer(){
    Timer(Duration(seconds: 1), () async {
      prefsService.removeData('showcase');
      // showcasetime = await prefsService.getIntData("showcasetime") ?? 0;
      // showcasetime++;
      // prefsService.setIntData("showcasetime", showcasetime);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Language_Screen(),), (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context),
      width: screenWidth(context),
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/logo.png'),fit: BoxFit.cover)),
    );
  }
}
