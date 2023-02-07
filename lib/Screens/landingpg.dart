// ignore_for_file: non_constant_identifier_names


import 'package:board_exam_analysis/controllers/ApiController.dart';
import 'package:board_exam_analysis/utils/ApiConstants.dart';
import 'package:board_exam_analysis/utils/images.dart';
import 'package:flutter/material.dart';

import '../model/GettingRandomModel.dart';
import 'MobileLanding.dart';
import 'WebLanding.dart';

class Landingpg extends StatefulWidget {
  const Landingpg({super.key});

  @override
  State<Landingpg> createState() => _LandingpgState();
}

bool loader = true;
List FeaturesList = [
  "Subject Wise Grade Mark Distribution",
  "Subject Wise Distinctions",
  "Subject Wise Topper",
  "Subject Wise Highest Marks",
  "Subject Result, etc",
];

class _LandingpgState extends State<Landingpg> {
  @override
  void initState() {
    init();
    super.initState();
  }

  bool ButtonEnabled = false;
  String RandomKey = "";
  GetRandomKeyModel gettingRandomKey = GetRandomKeyModel();
  init() async {
    var response = await ApiController.post(gettingRandomKeyApi, "");
    if (response != null) {
      gettingRandomKey = GetRandomKeyModel.fromJson(response);
      RandomKey = gettingRandomKey.d!.data;
      Future.delayed(
          const Duration(seconds: 3),
          () => setState(() {
                ButtonEnabled = true;
              }));
      print(RandomKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 1000;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(pgone), fit: BoxFit.fill),
      ),
      child: isScreenWide
          ? WebLanding(ButtonEnabled: ButtonEnabled, RandomKey: RandomKey)
          : MobileLanding(ButtonEnabled: ButtonEnabled, RandomKey: RandomKey),
    );
  }
}
