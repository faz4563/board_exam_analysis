// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/fonts.dart';
import '../utils/images.dart';
import '../utils/widget.dart';
import 'landingpg.dart';
import 'uploadpg.dart';

class MobileLanding extends StatefulWidget {
  const MobileLanding({
    Key? key,
    required this.ButtonEnabled,
    required this.RandomKey,
  }) : super(key: key);

  final bool ButtonEnabled;
  final String RandomKey;
  @override
  State<MobileLanding> createState() => _MobileLandingState();
}

class _MobileLandingState extends State<MobileLanding> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 29.0.h, bottom: 10.h),
              child: Text(
                "CENTRAL BOARD OF SECONDARY EDUCATION",
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: const Color(0xFF313131),
                  fontFamily: monb,
                  letterSpacing: 0.94,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.h,

                  // fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 1.h),
            FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(
                      'GET 360 (DEGREE) ANALYSIS OF YOUR',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18.0.h,
                          letterSpacing: 0.94,
                          fontWeight: FontWeight.w900,
                          fontFamily: rubm),
                      gradient: const LinearGradient(colors: [
                        Color(0xFF25D0DE),
                        Color(0xFFF638F7),
                      ]),
                    ),
                    GradientText(
                      'SCHOOL\'S CBSE RESULTS',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.94,
                          fontSize: 18.0.h,
                          fontFamily: rubm),
                      gradient: const LinearGradient(colors: [
                        Color(0xFF25D0DE),
                        Color(0xFFF638F7),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '1. Enter details of your school',
                  style: TextStyle(
                      letterSpacing: 0.35,
                      decoration: TextDecoration.none,
                      fontFamily: nunr,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF00425A),
                      fontSize: 14.h),
                ),
                SizedBox(height: 10.w),
                Text(
                  '2. Upload files',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: nunr,
                      letterSpacing: 0.35,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF00425A),
                      fontSize: 14.h),
                ),
                SizedBox(height: 10.w),
                Text(
                  '3. Download a detailed report',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: nunr,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.35,
                      color: const Color(0xFF00425A),
                      fontSize: 14.h),
                )
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 5.w),
              child: Image(
                  image: const AssetImage(analysis),
                  height: 147.h,
                  width: 147.h),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Features :',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: const Color(0xFF303030),
                          fontFamily: monb,
                          letterSpacing: 0.63,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0.h,

                          // fontStyle: FontStyle.italic,
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 160.h,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: FeaturesList.length,
                          itemExtent: 30,
                          itemBuilder: (context, index) => Row(
                                children: [
                                  Icon(
                                    Icons.brightness_1_rounded,
                                    color: const Color(0xFFBFDB38),
                                    size: 10.h,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      FeaturesList[index],
                                      style: TextStyle(
                                          fontSize: 13.h,
                                          fontFamily: rubm,
                                          decoration: TextDecoration.none,
                                          color: const Color(0xff303030),
                                          letterSpacing: 0.23,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SizedBox(
                width: 180.w,
                height: 35.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: widget.ButtonEnabled == true
                          ? const Color(0xFF1F8A70)
                          : Colors.grey),
                  onPressed: widget.ButtonEnabled == true
                      ? () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Uploadpg(
                                        RandomKey: widget.RandomKey,
                                      )));
                        }
                      : null,
                  child: Text(
                    'Generate Report',
                    style: TextStyle(fontFamily: rubm, fontSize: 12.h),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),
            //
            //
            //

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FittedBox(
                fit: BoxFit.contain,
                child: GlowingText(
                    text: 'We\'d Love To Hear From You', fontSize: 18.h),
              ),
            ),
            SizedBox(height: 7.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'If you would like to know more about our products and services, our team would be happy to speak to you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: rubm,
                      letterSpacing: 0.21,
                      color: const Color(0xff6A6A6A),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.h,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Reach us at ',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: rubr,
                              letterSpacing: 0.06,
                              color: const Color(0xff272727),
                              fontWeight: FontWeight.w100,
                              fontSize: 15.h,
                            ),
                          ),
                          TextSpan(
                            text: ' 8880280005',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              letterSpacing: 0.06,
                              fontFamily: rubm,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff272727),
                              fontSize: 15.h,
                            ),
                          ),
                          TextSpan(
                            text: ' or drop an email to ',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: rubr,
                              letterSpacing: 0.06,
                              color: const Color(0xff272727),
                              fontWeight: FontWeight.w100,
                              fontSize: 15.h,
                            ),
                          ),
                          TextSpan(
                            text: ' hello@neverskip.com',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: rubm,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.06,
                              color: const Color(0xff272727),
                              fontSize: 15.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            const Divider(
              color: Color(0xffC9C9C9),
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        child: Text(
                          'www.neverskip.com',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: rubr,
                              letterSpacing: 0.06,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF00425A),
                              fontSize: 8.h),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image(
                          image: const AssetImage(logo),
                          width: 60.w,
                          height: 60.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jarulss Software Solutions Pvt Ltd',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF333333),
                              fontSize: 10.h),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50.h,
                          child: Text(
                            '#47, Razaak Garden Road, Arumbakkam, Chennai,Tamil Nadu 600106',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: rubr,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF636363),
                                fontSize: 10.h),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // SizedBox(
        //   height: 10.h,
        // ),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.copyright_rounded,
                color: const Color(0xff00425A),
                size: 18.h,
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                '2023 Neverskip. All Rights Reserved',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: rubr,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff00425A),
                    fontSize: 10.h),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
      ],
    );
  }
}
