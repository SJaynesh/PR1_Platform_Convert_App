import 'dart:async';

import 'package:flutter/material.dart';
import 'package:platform_convert_app_code/utills/All_Atributes.dart';

class Splach_Screens extends StatefulWidget {
  const Splach_Screens({Key? key}) : super(key: key);

  @override
  State<Splach_Screens> createState() => _Splach_ScreensState();
}

class _Splach_ScreensState extends State<Splach_Screens> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("Home_Page", (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath + "Contact_logo.png",
                height: h * 0.25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
