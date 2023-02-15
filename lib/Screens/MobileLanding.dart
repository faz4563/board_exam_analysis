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
              padding: EdgeInsets.only(
                  top: 29.0.h, bottom: 10.h, left: 10, right: 10),
              child: Text(
                "CENTRAL BOARD OF SECONDARY EDUCATION",
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: const Color(0xFF313131),
                  fontFamily: monb,
                  letterSpacing: 0.64,
                  fontWeight: FontWeight.w800,
                  fontSize: 13.h,
                ),
              ),
            ),
            SizedBox(height: 1.5.h),
            SizedBox(
              width: 500.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GradientText(
                        'GET 360 (DEGREE) ANALYSIS OF YOUR',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16.0.h,
                            letterSpacing: 0.94,
                            fontWeight: FontWeight.w900,
                            fontFamily: rubm),
                        gradient: const LinearGradient(colors: [
                          Color(0xFF25D0DE),
                          Color(0xFFF638F7),
                        ]),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      GradientText(
                        'SCHOOL\'S CBSE RESULTS',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.94,
                            fontSize: 16.0.h,
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
            ),
            SizedBox(height: 15.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '1. Enter details of your school',
                  style: TextStyle(
                      letterSpacing: 0.50,
                      decoration: TextDecoration.none,
                      fontFamily: nunr,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF00394E),
                      fontSize: 12.h),
                ),
                SizedBox(height: 5.w),
                Text(
                  '2. Upload files',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: nunr,
                      letterSpacing: 0.50,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF00425A),
                      fontSize: 12.h),
                ),
                SizedBox(height: 5.w),
                Text(
                  '3. Download a detailed report',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: nunr,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.50,
                      color: const Color(0xFF00425A),
                      fontSize: 12.h),
                )
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 5.w),
              child: Image(
                  image: const AssetImage(analysis),
                  height: 137.h,
                  width: 137.h),
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
                    Text('FEATURES',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: const Color(0xFF303030),
                          fontFamily: monb,
                          letterSpacing: 0.33,
                          fontWeight: FontWeight.w700,
                          fontSize: 13.0.h,

                          // fontStyle: FontStyle.italic,
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: FeaturesList.length,
                          itemExtent: 30,
                          itemBuilder: (context, index) => SizedBox(
                                height: 160.h,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.brightness_1_rounded,
                                      color: const Color(0xFFBFDB38),
                                      size: 8.h,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      FeaturesList[index],
                                      style: TextStyle(
                                          fontSize: 12.h,
                                          fontFamily: rubm,
                                          decoration: TextDecoration.none,
                                          color: const Color(0xff303030),
                                          letterSpacing: 0.23,
                                          fontWeight: FontWeight.w200),
                                    )
                                  ],
                                ),
                              )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 15.h),
              child: SizedBox(
                width: 160.w,
                height: 30.h,
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
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'GENERATE REPORT',
                      style: TextStyle(
                          letterSpacing: 0.63, fontFamily: rubm, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10.h),
            //
            //
            //

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FittedBox(
                fit: BoxFit.contain,
                child: GlowingText(
                    text: 'We\'d Love To Hear From You', fontSize: 13.h),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 500,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text:
                                    'If you would like to know more about our ',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: rubm,
                                  letterSpacing: 0.21,
                                  color: const Color(0xff343434),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.h,
                                )),
                            TextSpan(
                                text: 'Products ',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: rubm,
                                  letterSpacing: 0.21,
                                  color: const Color(0xFF1F8A70),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.h,
                                )),
                            TextSpan(
                                text: 'and ',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: rubm,
                                  letterSpacing: 0.21,
                                  color: const Color(0xff343434),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.h,
                                )),
                            TextSpan(
                                text: 'Services,',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: rubm,
                                  letterSpacing: 0.21,
                                  color: const Color(0xFF1F8A70),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.h,
                                  height: 1.5,
                                )),
                            TextSpan(
                                text:
                                    ' our team would be happy to speak to you.',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: rubm,
                                  letterSpacing: 0.21,
                                  color: const Color(0xff343434),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.h,
                                  height: 1.5,
                                )),
                          ]),
                        ),
                      )
                    ])),
            SizedBox(height: 10.h),
            SizedBox(
              width: 250.w,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Center(
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
                              fontStyle: FontStyle.italic,
                              color: const Color(0xff272727),
                              fontWeight: FontWeight.w100,
                              fontSize: 12.h,
                            ),
                          ),
                          TextSpan(
                            text: ' 8880280005',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              letterSpacing: 0.06,
                              fontFamily: rubm,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              color: const Color(0xff272727),
                              fontSize: 12.h,
                            ),
                          ),
                          TextSpan(
                            text: ' or \ndrop an email to ',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: rubr,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 0.06,
                              color: const Color(0xff272727),
                              fontWeight: FontWeight.w100,
                              fontSize: 12.h,
                            ),
                          ),
                          TextSpan(
                            text: ' hello@neverskip.com',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: rubm,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.06,
                              fontStyle: FontStyle.italic,
                              color: const Color(0xff272727),
                              fontSize: 12.h,
                              height: 1.5,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            const Divider(
              color: Color(0xffC9C9C9),
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage(logo),
                        width: 140.w,
                        height: 50.h,
                      ),
                    ],
                  ),
                  Text(
                    'www.neverskip.com',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: rubr,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00425A),
                        fontSize: 12.h),
                  ),
                  // SizedBox(
                  //   width: 30.w,
                  // ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Jarulss Software Solutions Pvt Ltd',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF333333),
                              fontSize: 12.h),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 80.h,
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  '#47, Razaak Garden Road, Arumbakkam, Chennai,Tamil Nadu 600106',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontFamily: rubr,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff343434),
                                      fontSize: 11),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.copyright_rounded,
                                        color: const Color(0xff00425A),
                                        size: 16.h,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Expanded(
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text(
                                            '2023 Neverskip. All Rights Reserved',
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontFamily: rubr,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff00425A),
                                                fontSize: 10.h),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
      ],
    );
  }
}
