import 'package:board_exam_analysis/inputForm.dart';
import 'package:flutter/material.dart';
import 'package:board_exam_analysis/utils/images.dart';
import 'package:board_exam_analysis/utils/fonts.dart';
import 'package:board_exam_analysis/utils/widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Uploadpg extends StatefulWidget {
  const Uploadpg({super.key});

  @override
  State<Uploadpg> createState() => _UploadpgState();
}

class _UploadpgState extends State<Uploadpg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(pgone), fit: BoxFit.cover),
            ),
            child: Column(children: [
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GradientText(
                    'GET 360 (DEGREE) ANALYSIS OF YOUR',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 30.0.h,
                        fontWeight: FontWeight.bold,
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
                      fontFamily: rubm,
                      fontWeight: FontWeight.bold,
                    ),
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
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: const Color(0xffFBFBFB),
                    border: Border.all(color: const Color(0xffE8E8E8)),
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(15)),
                // height: MediaQuery.of(context).size.height / 2,
                child: Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: Text(
                              "School Info",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF448CF3),
                                  fontSize: 16.h),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'School Name',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: 'Muli',
                                          color: const Color(0xff828282),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.h,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: rubm,
                                          color: const Color.fromARGB(
                                              255, 231, 27, 27),
                                          fontSize: 15.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                TextInputs(
                                    Fields_Height: 40.h,
                                    // Fields_Width: 80.w,
                                    controller: schoolNameController,
                                    validator: () {},
                                    BgColor: const Color(0xffffffff),
                                    edgeRadius: 5.0,
                                    keyboardType: TextInputType.name,
                                    hideText: false,
                                    fontWeight: FontWeight.w200,
                                    BorderColor: const Color(0xffE8E8E8),
                                    hintText: "Your School Name",
                                    inputTextSize: 12.0,
                                    label: null,
                                    sufficon: null,
                                    prefIcon: null,
                                    contentPadding: 5.0,
                                    labelColor: null,
                                    hintStyle: TextStyle(
                                        fontSize: 10.h,
                                        color: Color(0xffA8A8A8)),
                                    textColor: null,
                                    readOnly: false,
                                    Onchanged: () {}),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Flat No & Street Name',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontFamily: 'Muli',
                                              color: const Color(0xff828282),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.h,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontFamily: rubm,
                                              color: const Color.fromARGB(
                                                  255, 231, 27, 27),
                                              fontSize: 15.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    TextInputs(
                                        Fields_Height: 30.h,
                                        Fields_Width: 60.w,
                                        controller: flatNoAndStreetName,
                                        validator: () {},
                                        BgColor: const Color(0xffffffff),
                                        edgeRadius: 5.0,
                                        keyboardType: TextInputType.name,
                                        hideText: false,
                                        fontWeight: FontWeight.w200,
                                        BorderColor: const Color(0xffE8E8E8),
                                        hintText: "Type Flat No & Street",
                                        inputTextSize: 12.0,
                                        label: null,
                                        sufficon: null,
                                        prefIcon: null,
                                        contentPadding: 5.0,
                                        labelColor: null,
                                        hintStyle: TextStyle(
                                            fontSize: 10.h,
                                            color: Color(0xffA8A8A8)),
                                        textColor: null,
                                        readOnly: false,
                                        Onchanged: () {}),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Select City',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontFamily: 'Muli',
                                              color: const Color(0xff828282),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.h,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontFamily: rubm,
                                              color: const Color.fromARGB(
                                                  255, 231, 27, 27),
                                              fontSize: 15.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    TextInputs(
                                        Fields_Height: 30.h,
                                        Fields_Width: 60.w,
                                        controller: city,
                                        validator: () {},
                                        BgColor: const Color(0xffffffff),
                                        edgeRadius: 5.0,
                                        keyboardType: TextInputType.name,
                                        hideText: false,
                                        fontWeight: FontWeight.w200,
                                        BorderColor: const Color(0xffE8E8E8),
                                        hintText: "City",
                                        inputTextSize: 12.0,
                                        label: null,
                                        sufficon: null,
                                        prefIcon: null,
                                        contentPadding: 5.0,
                                        labelColor: null,
                                        hintStyle: TextStyle(
                                            fontSize: 10.h,
                                            color: Color(0xffA8A8A8)),
                                        textColor: null,
                                        readOnly: false,
                                        Onchanged: () {}),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'State',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontFamily: 'Muli',
                                              color: const Color(0xff828282),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.h,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontFamily: rubm,
                                              color: const Color.fromARGB(
                                                  255, 231, 27, 27),
                                              fontSize: 15.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    TextInputs(
                                        Fields_Height: 30.h,
                                        Fields_Width: 60.w,
                                        controller: state,
                                        validator: () {},
                                        BgColor: const Color(0xffffffff),
                                        edgeRadius: 5.0,
                                        keyboardType: TextInputType.name,
                                        hideText: false,
                                        fontWeight: FontWeight.w200,
                                        BorderColor: const Color(0xffE8E8E8),
                                        hintText: "State",
                                        inputTextSize: 12.0,
                                        label: null,
                                        sufficon: null,
                                        prefIcon: null,
                                        contentPadding: 5.0,
                                        labelColor: null,
                                        hintStyle: TextStyle(
                                            fontSize: 10.h,
                                            color: Color(0xffA8A8A8)),
                                        textColor: null,
                                        readOnly: false,
                                        Onchanged: () {}),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Pincode',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontFamily: 'Muli',
                                              color: const Color(0xff828282),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.h,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '*',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontFamily: rubm,
                                              color: const Color.fromARGB(
                                                  255, 231, 27, 27),
                                              fontSize: 15.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    TextInputs(
                                        Fields_Height: 30.h,
                                        Fields_Width: 60.w,
                                        controller: pincode,
                                        validator: () {},
                                        BgColor: const Color(0xffffffff),
                                        edgeRadius: 5.0,
                                        keyboardType: TextInputType.name,
                                        hideText: false,
                                        fontWeight: FontWeight.w200,
                                        BorderColor: const Color(0xffE8E8E8),
                                        hintText: "Pincode",
                                        inputTextSize: 12.0,
                                        label: null,
                                        sufficon: null,
                                        prefIcon: null,
                                        contentPadding: 5.0,
                                        labelColor: null,
                                        hintStyle: TextStyle(
                                            fontSize: 10.h,
                                            color: Color(0xffA8A8A8)),
                                        textColor: null,
                                        readOnly: false,
                                        Onchanged: () {}),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.h, vertical: 5.h),
                            child: Text(
                              "Contact Details",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF448CF3),
                                  fontSize: 16.h),
                            ),
                          ),
                          // SizedBox(
                          //   height: 5.h,
                          // ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0.w, vertical: 10.h),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      style:
                                                          DefaultTextStyle.of(
                                                                  context)
                                                              .style,
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: 'Name',
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            fontFamily: 'Muli',
                                                            color: const Color(
                                                                0xff828282),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 13.h,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: '*',
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            fontFamily: rubm,
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                231,
                                                                27,
                                                                27),
                                                            fontSize: 15.h,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  TextInputs(
                                                      Fields_Height: 30.h,
                                                      Fields_Width: 60.w,
                                                      controller: name,
                                                      validator: () {},
                                                      BgColor: const Color(
                                                          0xffffffff),
                                                      edgeRadius: 5.0,
                                                      keyboardType:
                                                          TextInputType.name,
                                                      hideText: false,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      BorderColor: const Color(
                                                          0xffE8E8E8),
                                                      hintText: "Type Name",
                                                      inputTextSize: 12.0,
                                                      label: null,
                                                      sufficon: null,
                                                      prefIcon: null,
                                                      contentPadding: 5.0,
                                                      labelColor: null,
                                                      hintStyle: TextStyle(
                                                          fontSize: 10.h,
                                                          color: Color(
                                                              0xffA8A8A8)),
                                                      textColor: null,
                                                      readOnly: false,
                                                      Onchanged: () {}),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0.w, vertical: 10.h),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      style:
                                                          DefaultTextStyle.of(
                                                                  context)
                                                              .style,
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: 'Phone Number',
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            fontFamily: 'Muli',
                                                            color: const Color(
                                                                0xff828282),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 13.h,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: '*',
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            fontFamily: rubm,
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                231,
                                                                27,
                                                                27),
                                                            fontSize: 15.h,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  TextInputs(
                                                      Fields_Height: 30.h,
                                                      Fields_Width: 60.w,
                                                      controller: phoneno,
                                                      validator: () {},
                                                      BgColor: const Color(
                                                          0xffffffff),
                                                      edgeRadius: 5.0,
                                                      keyboardType:
                                                          TextInputType.name,
                                                      hideText: false,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      BorderColor: const Color(
                                                          0xffE8E8E8),
                                                      hintText:
                                                          "Type Phone Number",
                                                      inputTextSize: 12.0,
                                                      label: null,
                                                      sufficon: null,
                                                      prefIcon: null,
                                                      contentPadding: 5.0,
                                                      labelColor: null,
                                                      hintStyle: TextStyle(
                                                          fontSize: 10.h,
                                                          color: Color(
                                                              0xffA8A8A8)),
                                                      textColor: null,
                                                      readOnly: false,
                                                      Onchanged: () {}),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Email',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: 'Muli',
                                          color: const Color(0xff828282),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.h,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: rubm,
                                          color: const Color.fromARGB(
                                              255, 231, 27, 27),
                                          fontSize: 15.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                TextInputs(
                                    Fields_Height: 40.h,
                                    // Fields_Width: 80.w,
                                    controller: email,
                                    validator: () {},
                                    BgColor: const Color(0xffffffff),
                                    edgeRadius: 5.0,
                                    keyboardType: TextInputType.name,
                                    hideText: false,
                                    fontWeight: FontWeight.w200,
                                    BorderColor: const Color(0xffE8E8E8),
                                    hintText: "Type Email ID",
                                    inputTextSize: 12.0,
                                    label: null,
                                    sufficon: null,
                                    prefIcon: null,
                                    contentPadding: 5.0,
                                    labelColor: null,
                                    hintStyle: TextStyle(
                                        fontSize: 10.h,
                                        color: Color(0xffA8A8A8)),
                                    textColor: null,
                                    readOnly: false,
                                    Onchanged: () {}),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.h, vertical: 0.h),
                            child: Text(
                              "Upload your file",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF448CF3),
                                  fontSize: 16.h),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            width: 200.w,
                            height: 100.h,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Drop a CSV file or',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Muli',
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF303030),
                                      fontSize: 13.h),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      side: BorderSide(),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      fixedSize: Size(80.w, 30.h),
                                      backgroundColor: const Color(0xFFEC8D3C)),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Image.asset(impo),
                                      Text(
                                        'Import',
                                        style: TextStyle(
                                            fontFamily: rubm, fontSize: 14.h),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              )
              // GlowingText(text: 'We\'d Love To Hear From You'),
              // SizedBox(height: 5.h),
              // Text(
              //   'If you would like to know more about our products and services, our team would be happy to speak to you.',
              //   style: TextStyle(
              //     decoration: TextDecoration.none,
              //     fontFamily: rubm,
              //     color: const Color(0xff6A6A6A),
              //     fontStyle: FontStyle.italic,
              //     fontWeight: FontWeight.w400,
              //     fontSize: 15.h,
              //   ),
              // ),
              // SizedBox(height: 5.h),
              // RichText(
              //   text: TextSpan(
              //     style: DefaultTextStyle.of(context).style,
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: 'Reach us at ',
              //         style: TextStyle(
              //           decoration: TextDecoration.none,
              //           fontFamily: rubr,
              //           color: const Color(0xff272727),
              //           fontWeight: FontWeight.w600,
              //           fontSize: 15.h,
              //         ),
              //       ),
              //       TextSpan(
              //         text: ' 8880280005',
              //         style: TextStyle(
              //           decoration: TextDecoration.none,
              //           fontFamily: rubm,
              //           color: const Color(0xff272727),
              //           fontSize: 15.h,
              //         ),
              //       ),
              //       TextSpan(
              //         text: ' or drop an email to ',
              //         style: TextStyle(
              //           decoration: TextDecoration.none,
              //           fontFamily: rubr,
              //           color: const Color(0xff272727),
              //           fontWeight: FontWeight.w600,
              //           fontSize: 15.h,
              //         ),
              //       ),
              //       TextSpan(
              //         text: ' hello@neverskip.com',
              //         style: TextStyle(
              //           decoration: TextDecoration.none,
              //           fontFamily: rubm,
              //           color: const Color(0xff272727),
              //           fontSize: 15.h,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 5.h),
              // Divider(
              //   indent: 20.w,
              //   endIndent: 20.w,
              //   color: const Color(0xffC9C9C9),
              //   thickness: 0.5,
              // ),
              // SizedBox(
              //   height: 1.h,
              // ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(left: 10.w),
              //       child: Column(
              //         children: [
              //           Image(
              //             image: AssetImage(logo),
              //             width: 40.w,
              //             height: 40.h,
              //           ),
              //           Text(
              //             'www.neverskip.com',
              //             style: TextStyle(
              //                 decoration: TextDecoration.none,
              //                 fontFamily: rubr,
              //                 fontWeight: FontWeight.bold,
              //                 color: const Color(0xFF00425A),
              //                 fontSize: 13.h),
              //           ),
              //         ],
              //       ),
              //     ),
              //     SizedBox(
              //       width: 25.w,
              //     ),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'Jarulss Software Solutions Pvt Ltd',
              //           style: TextStyle(
              //               decoration: TextDecoration.none,
              //               fontFamily: 'Montserrat',
              //               fontWeight: FontWeight.bold,
              //               color: const Color(0xFF333333),
              //               fontSize: 13.h),
              //         ),
              //         SizedBox(
              //           height: 5.h,
              //         ),
              //         Text(
              //           '#47, Razaak Garden Road, Arumbakkam, Chennai, Tamil Nadu 600106',
              //           style: TextStyle(
              //               decoration: TextDecoration.none,
              //               fontFamily: rubr,
              //               fontWeight: FontWeight.w400,
              //               color: const Color(0xFF636363),
              //               fontSize: 13.h),
              //         ),
              //       ],
              //     ),
              //     SizedBox(
              //       width: 100.w,
              //     ),
              //     const Icon(
              //       Icons.copyright_rounded,
              //       color: Color(0xff00425A),
              //       size: 23,
              //     ),
              //     SizedBox(
              //       width: 1.w,
              //     ),
              //     Expanded(
              //       child: Text(
              //         '2023 Neverskip. All Rights Reserved',
              //         style: TextStyle(
              //             decoration: TextDecoration.none,
              //             fontFamily: rubr,
              //             fontWeight: FontWeight.w400,
              //             color: const Color(0xff00425A),
              //             fontSize: 13.h),
              //       ),
              //     ),
              //   ],
              // )
            ]),
          ),
        ],
      ),
    );
  }
}
