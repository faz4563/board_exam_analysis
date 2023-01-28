import 'package:board_exam_analysis/uploadpg.dart';
import 'package:board_exam_analysis/utils/fonts.dart';
import 'package:board_exam_analysis/utils/images.dart';
import 'package:board_exam_analysis/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class landingpg extends StatefulWidget {
  const landingpg({super.key});

  @override
  State<landingpg> createState() => _landingpgState();
}

List FeaturesList = [
  "Subject Wise Grade Mark Distribution",
  "Subject Wise Distinctions",
  "Subject Wise Topper",
  "Subject Wise Highest Marks",
  "Subject Result, etc",
];

class _landingpgState extends State<landingpg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(pgone), fit: BoxFit.fill),
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0.h),
                child: Text(
                  "CENTRAL BOARD OF SECONDARY EDUCATION",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: const Color(0xFF313131),
                    fontFamily: monb,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.h,

                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Column(
                children: [
                  GradientText(
                    'GET 360 (DEGREE) ANALYSIS OF YOUR',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 30.0.h,
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
                        fontSize: 30.0.h,
                        fontFamily: rubm),
                    gradient: const LinearGradient(colors: [
                      Color(0xFF25D0DE),
                      Color(0xFFF638F7),
                    ]),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '1. Enter Details Of Your School',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: nunr,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00425A),
                        fontSize: 14.h),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '2. Upload Files',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: nunr,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00425A),
                        fontSize: 14.h),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '3. Download A Detailed Report',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: nunr,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00425A),
                        fontSize: 14.h),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 350.h,
                width: 140.w,
                child: Card(
                  elevation: 5,
                  color: const Color(0xFFFBFBFB),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side:
                          const BorderSide(color: Color(0xFFE8E8E8), width: 2)),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                              image: const AssetImage(analysis),
                              height: 200.h,
                              width: 200.h),
                          SizedBox(
                            width: 3.w,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Features :',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: const Color(0xFF303030),
                                    fontFamily: monb,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0.h,

                                    // fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 200.h,
                                  width: 80.w,
                                  child: ListView.builder(
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
                                                width: 5.w,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  FeaturesList[index],
                                                  style: TextStyle(
                                                      fontSize: 11.h,
                                                      fontWeight:
                                                          FontWeight.w700),
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
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(80.w, 30.h),
                          backgroundColor: const Color(0xFF1F8A70)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Uploadpg()));
                      },
                      child: Text(
                        'Generate Report',
                        style: TextStyle(fontFamily: rubm, fontSize: 14.h),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 10.h),
              GlowingText(text: 'We\'d Love To Hear From You'),
              SizedBox(height: 5.h),
              Text(
                'If you would like to know more about our products and services, our team would be happy to speak to you.',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: rubm,
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
                        color: const Color(0xff272727),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.h,
                      ),
                    ),
                    TextSpan(
                      text: ' 8880280005',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: rubm,
                        color: const Color(0xff272727),
                        fontSize: 15.h,
                      ),
                    ),
                    TextSpan(
                      text: ' or drop an email to ',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: rubr,
                        color: const Color(0xff272727),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.h,
                      ),
                    ),
                    TextSpan(
                      text: ' hello@neverskip.com',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: rubm,
                        color: const Color(0xff272727),
                        fontSize: 15.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Divider(
                indent: 20.w,
                endIndent: 20.w,
                color: const Color(0xffC9C9C9),
                thickness: 0.5,
              ),
              // SizedBox(
              //   height: 1.h,
              // ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(logo),
                          width: 40.w,
                          height: 40.h,
                        ),
                        Text(
                          'www.neverskip.com',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: rubr,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF00425A),
                              fontSize: 13.h),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                  SizedBox(
                    width: 100.w,
                  ),
                  const Icon(
                    Icons.copyright_rounded,
                    color: Color(0xff00425A),
                    size: 23,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Expanded(
                    child: Text(
                      '2023 Neverskip. All Rights Reserved',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: rubr,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff00425A),
                          fontSize: 13.h),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}






//                               ListTile(
//                                   title: Text(
//                                     'Subject Wise Distinctions',
//                                     style: TextStyle(
//                                       decoration: TextDecoration.none,
//                                       color: Color(0xFF303030),
//                                       fontFamily: monb,
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 13.0,
//                                     ),
//                                   ),
//                                   leading: Icon(
//                                     Icons.brightness_1_rounded,
//                                     size: 10,
//                                     color: Color(0xFFBFDB38),
//                                   )),