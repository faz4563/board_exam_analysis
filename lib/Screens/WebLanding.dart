// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

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
    bool isScreenWide = MediaQuery.of(context).size.width >= 1000;
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "CENTRAL BOARD OF SECONDARY EDUCATION",
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xFF313131),
                  fontFamily: monb,
                  letterSpacing: 0.94,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,

                  // fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const SizedBox(height: 1),
          Column(
            children: const [
              GradientText(
                'GET 360 (DEGREE) ANALYSIS OF YOUR',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 28,
                    letterSpacing: 0.94,
                    fontWeight: FontWeight.w900,
                    fontFamily: rubm),
                gradient: LinearGradient(colors: [
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
                    fontSize: 28,
                    fontFamily: rubm),
                gradient: LinearGradient(colors: [
                  Color(0xFF25D0DE),
                  Color(0xFFF638F7),
                ]),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  '1. Enter details of your school',
                  style: TextStyle(
                    letterSpacing: 0.35,
                    decoration: TextDecoration.none,
                    fontFamily: nunr,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF00394E),
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '2. Upload files',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: nunr,
                    letterSpacing: 0.35,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF00394E),
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '3. Download a detailed report',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: nunr,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.35,
                    color: Color(0xFF00394E),
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              // height: isScreenWide ? 280.h : 250.h,
              // width: isScreenWide ? 160.w : 160.w,
              height: 300,
              width: 527,
              child: Card(
                elevation: 1,
                color: const Color(0xFFFBFBFB),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Color(0xFFE8E8E8), width: 2)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            // color: Colors.red,
                            width: 140,
                            height: 160,
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Image(
                                image: AssetImage(analysis),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  'FEATURES',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Color(0xFF303030),
                                    fontFamily: monb,
                                    letterSpacing: 0.63,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                // color: Colors.red,
                                height: 140,

                                width: 250,
                                child: ListView.builder(
                                    itemCount: FeaturesList.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemExtent: 25,
                                    itemBuilder: (context, index) => Row(
                                          children: [
                                            const Icon(
                                              Icons.brightness_1_rounded,
                                              color: Color(0xFFBFDB38),
                                              size: 7,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                              child: Text(
                                                FeaturesList[index],
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    color: Color(0xff303030),
                                                    letterSpacing: 0.23,
                                                    fontFamily: rubm,
                                                    fontWeight:
                                                        FontWeight.w200),
                                              ),
                                            )
                                          ],
                                        )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(120, 30),
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
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'GENERATE REPORT',
                              style: TextStyle(
                                  letterSpacing: 0.63,
                                  fontFamily: rubm,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          const SizedBox(height: 20),
          //
          //
          //

          FittedBox(
              fit: BoxFit.contain,
              child: GlowingText(text: 'We\'d Love To Hear From You')),
          const SizedBox(height: 7),
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
                        text: const TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'If you would like to know more about our ',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: rubm,
                                letterSpacing: 0.21,
                                color: Color(0xff343434),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                          TextSpan(
                              text: 'Products ',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: rubm,
                                letterSpacing: 0.21,
                                color: Color(0xFF1F8A70),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              )),
                          TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: rubm,
                                letterSpacing: 0.21,
                                color: Color(0xff343434),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                          TextSpan(
                              text: 'Services,',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: rubm,
                                letterSpacing: 0.21,
                                color: Color(0xFF1F8A70),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                height: 1.5,
                              )),
                          TextSpan(
                              text: ' our team would be happy to speak to you.',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: rubm,
                                letterSpacing: 0.21,
                                color: Color(0xff343434),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1.5,
                              )),
                        ]),
                      ),
                    )
                  ])),
          const SizedBox(height: 10),
          SizedBox(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Reach us at ',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: rubr,
                            letterSpacing: 0.06,
                            fontStyle: FontStyle.italic,
                            color: Color(0xff272727),
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
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
                            color: Color(0xff272727),
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: ' or drop an email to ',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: rubr,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 0.06,
                            color: Color(0xff272727),
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
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
                            color: Color(0xff272727),
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          const SizedBox(height: 10),
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
                      children: const [
                        Image(
                          image: AssetImage(logo),
                          width: 140,
                          height: 50,
                        ),
                      ],
                    ),
                    const Text(
                      'www.neverskip.com',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: rubr,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00425A),
                          fontSize: 12),
                    ),
                    // SizedBox(
                    //   width: 30.w,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Jarulss Software Solutions Pvt Ltd',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: Color(0xFF333333),
                                fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 70,
                            child: Column(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: const Text(
                                    '#47, Razaak Garden Road, Arumbakkam, Chennai - 600106.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: rubr,
                                        height: 1.5,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff343434),
                                        fontSize: 11),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.copyright_rounded,
                                          color: Color(0xff00425A),
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text(
                                            '2023 Neverskip. All Rights Reserved',
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontFamily: rubr,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 1,
                                                color: Color(0xff00425A),
                                                fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ]))
        ]));
  }
}
