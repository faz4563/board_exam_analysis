import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/fonts.dart';
import '../utils/images.dart';
import '../utils/widget.dart';
import 'landingpg.dart';
import 'uploadpg.dart';

class WebLanding extends StatelessWidget {
  const WebLanding({
    Key? key,
    required this.ButtonEnabled,
    required this.RandomKey,
  }) : super(key: key);

  final bool ButtonEnabled;
  final String RandomKey;

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width <= 1100;
    return ListView(
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: isScreenWide ? 15.h : 20.0.h, bottom: 10.h),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "CENTRAL BOARD OF SECONDARY EDUCATION",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: const Color(0xFF313131),
                    fontFamily: monb,
                    letterSpacing: 0.94,
                    fontWeight: FontWeight.w700,
                    fontSize: isScreenWide ? 16.h : 18.0.h,

                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Column(
              children: [
                GradientText(
                  'GET 360 (DEGREE) ANALYSIS OF YOUR',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: isScreenWide ? 16.h : 18.0.h,
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
                      fontSize: isScreenWide ? 14.h : 18.0.h,
                      fontFamily: rubm),
                  gradient: const LinearGradient(colors: [
                    Color(0xFF25D0DE),
                    Color(0xFFF638F7),
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: isScreenWide ? 10.h : 30.0.h,
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      fontSize: isScreenWide ? 10.h : 12.0.h,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '2. Upload files',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: nunr,
                      letterSpacing: 0.35,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF00425A),
                      fontSize: isScreenWide ? 10.h : 12.0.h,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '3. Download a detailed report',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: nunr,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.35,
                      color: const Color(0xFF00425A),
                      fontSize: isScreenWide ? 10.h : 12.0.h,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),
            FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                height: isScreenWide ? 280.h : 250.h,
                width: isScreenWide ? 160.w : 160.w,
                child: Card(
                  elevation: 1,
                  color: const Color(0xFFFBFBFB),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side:
                          const BorderSide(color: Color(0xFFE8E8E8), width: 2)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.h, left: 5.w),
                                child: Image(
                                  image: const AssetImage(analysis),
                                  height: isScreenWide ? 130.h : 130.h,
                                  // width: 150.w
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.h),
                                      child: Text(
                                        'Features :',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: const Color(0xFF303030),
                                          fontFamily: monb,
                                          letterSpacing: 0.63,
                                          fontWeight: FontWeight.w700,
                                          fontSize: isScreenWide ? 12.h : 14.h,

                                          // fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: isScreenWide ? 5.h : 10.h,
                                    ),
                                    SizedBox(
                                      height: isScreenWide ? 160.h : 140.h,
                                      width: isScreenWide ? 80.w : 150.w,
                                      child: ListView.builder(
                                          itemCount: FeaturesList.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemExtent:
                                              isScreenWide ? 30.h : 30.h,
                                          itemBuilder: (context, index) => Row(
                                                children: [
                                                  Icon(
                                                    Icons.brightness_1_rounded,
                                                    color:
                                                        const Color(0xFFBFDB38),
                                                    size: 10.h,
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      FeaturesList[index],
                                                      style: TextStyle(
                                                          fontSize: isScreenWide
                                                              ? 10.h
                                                              : 10.h,
                                                          letterSpacing: 0.23,
                                                          fontFamily: rubm,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )
                                                ],
                                              )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: isScreenWide ? 10.h : 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(40.w, 20.h),
                                  backgroundColor: ButtonEnabled == true
                                      ? const Color(0xFF1F8A70)
                                      : Colors.grey),
                              onPressed: ButtonEnabled == true
                                  ? () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Uploadpg(
                                                    RandomKey: RandomKey,
                                                  )));
                                    }
                                  : null,
                              child: Text(
                                'Generate Report',
                                style: TextStyle(
                                    fontFamily: rubm,
                                    fontSize: isScreenWide ? 11.h : 11.h),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            //
            //
            //

            GlowingText(text: 'We\'d Love To Hear From You'),
            SizedBox(height: 7.h),
            Text(
              'If you would like to know more about our products and services, our team would be happy to speak to you.',
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
            RichText(
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
            SizedBox(height: 10.h),

            Divider(
              indent: 20.w,
              endIndent: 20.w,
              color: const Color(0xffC9C9C9),
              thickness: 0.5,
            ),
            // SizedBox(
            //   height: 100.h,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Column(
                    children: [
                      Image(
                        image: const AssetImage(logo),
                        width: 40.w,
                        height: 40.h,
                      ),
                      Text(
                        'www.neverskip.com',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: rubr,
                            letterSpacing: 0.06,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00425A),
                            fontSize: 11.h),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
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
                            fontSize: 13.h),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '#47, Razaak Garden Road, Arumbakkam, Chennai, Tamil Nadu 600106',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: rubr,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF636363),
                            fontSize: 13.h),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: 80.w,
                // ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.copyright_rounded,
                        color: Color(0xff00425A),
                        size: 23,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        '2023 Neverskip. All Rights Reserved',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: rubr,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff00425A),
                            fontSize: 13.h),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}