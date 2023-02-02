import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/fonts.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          "Please Change THIS TO FULL SCREEN MODE OR DESKTOP SITE",
          style: TextStyle(
            fontSize: 18.h,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: nunr,
          ),
        ),
      ),
    );
  }
}
