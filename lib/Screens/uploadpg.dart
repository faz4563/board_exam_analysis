// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unnecessary_new, unnecessary_null_comparison

import 'package:board_exam_analysis/Screens/MobileUpload.dart';
import 'package:flutter/material.dart';

import 'webUpload.dart';

class Uploadpg extends StatefulWidget {
  const Uploadpg({super.key, required this.RandomKey});
  final RandomKey;
  @override
  State<Uploadpg> createState() => _UploadpgState();
}

class _UploadpgState extends State<Uploadpg> {
  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 1000;
    return Scaffold(
        backgroundColor: Colors.white,
        body: isScreenWide
            ? WebUploadPg(
                RandomKey: widget.RandomKey,
              )
            : MobileUpload(
                RandomKey: widget.RandomKey,
              ));
  }
}
