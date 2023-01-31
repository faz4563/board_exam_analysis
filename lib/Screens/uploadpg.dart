// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unnecessary_new

import 'dart:convert';

import 'dart:io';
import 'package:board_exam_analysis/controllers/ApiController.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:board_exam_analysis/utils/images.dart';
import 'package:board_exam_analysis/utils/fonts.dart';
import 'package:board_exam_analysis/utils/widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import '../utils/ApiConstants.dart';

class Uploadpg extends StatefulWidget {
  const Uploadpg({super.key, required this.RandomKey});
  final RandomKey;
  @override
  State<Uploadpg> createState() => _UploadpgState();
}

final TextEditingController schoolNameController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController cityController = TextEditingController();
final TextEditingController stateController = TextEditingController();
final TextEditingController pincodeController = TextEditingController();
final TextEditingController MapController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController Mob_No_Controller = TextEditingController();
final TextEditingController emailController = TextEditingController();

class _UploadpgState extends State<Uploadpg> {
  @override
  void initState() {
    super.initState();
  }

  var fileName = '';
  int uploadPressed = 1;

  // uploadFile(url) async {
  //   final result = await FilePicker.platform
  //       .pickFiles(allowMultiple: false, withData: true);
  //   //print(result!.files.first.bytes);
  //   var filePath = result!.files.first.bytes;
  //   fileName = result.files.first.name;
  //   var postUri = Uri.parse(url);

  //   // var bytes = filePath;

  //   // var response = await http.post(postUri,
  //   //     headers: {"Content-Type": "multipart/form-data"},
  //   //     body: {"image": bytes},
  //   //     encoding: Encoding.getByName("utf-8"));

  //   http.MultipartRequest request = new http.MultipartRequest(
  //     "POST",
  //     postUri,
  //   );

  //   // http.MultipartFile multipartFile =

  //   request.files.add(http.MultipartFile.fromBytes(
  //     'image',
  //     filePath!,
  //   ));

  //   http.StreamedResponse response = await request.send();

  //   print(response.stream);
  //   print(response.contentLength);
  //   print(response.headers);
  //   print(response.reasonPhrase);
  //   print(response.request);
  //   print(response.statusCode);

  // }
  static validations(String? txt, controllerName) {
    if (txt == null) {
      return "$controllerName Cannot be Empty";
    }
// if (txt.length < 8) {
//   return "Password must has 8 characters";
// }
    if (!txt.contains(RegExp(r'[A-Z]'))) {
      return "Please Enter a Valid Phone Number";
    }
    if (!txt.contains(RegExp(r'[0-9]'))) {
      return "Password must has digits";
    }
// if (!txt.contains(RegExp(r'[a-z]'))) {
//   return "Password must has lowercase";
// }
    if (!txt.contains(RegExp(r'[#?!@$%^&*-]'))) {
      return "Please Enter a Valid Phone Number";
    } else {
      return;
    }
  }

  void uploadFile() async {
    var result = await FilePicker.platform.pickFiles(
        withReadStream: true,
        type: FileType.custom,
        allowedExtensions: ['pdf']);
    if (result != null) {
      setState(() {
        objFile = result.files.single;
      });
    } else {
      return null;
    }
    fileName = result.files.first.name;
    uploadSelectedFile();
  }

  PlatformFile? objFile;
  void uploadSelectedFile() async {
    final request = http.MultipartRequest(
      "POST",
      Uri.parse(fileUploadApi),
    );
    request.files.add(new http.MultipartFile(
        "image", objFile!.readStream!, objFile!.size,
        filename: objFile!.name));
    var resp = await request.send();
    String result = await resp.stream.bytesToString();
    print(result);
    setState(() {
      uploadPressed = 2;
    });

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (result.isNotEmpty) {
          setState(() {
            uploadPressed = 3;
          });
        }
      },
    );
    print(fileName);
  }

  submit() async {
    var data = {
      "rand_key": widget.RandomKey,
      "sch_name": schoolNameController.text,
      "street": addressController.text,
      "city": cityController.text,
      "state": stateController.text,
      "pincode": pincodeController.text,
      "location": "",
      "name": nameController.text,
      "mobile_no": Mob_No_Controller.text,
      "email": emailController.text,
      "image": fileName
    };
    print(data);

    var response =
        await ApiController.post(updateAnalysisApi, jsonEncode(data));
    response = await ApiController.post(updateAnalysisApi, jsonEncode(data));
    // print(response);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(pgone), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0.h),
                    child: Text(
                      "CENTRAL BOARD OF SECONDARY EDUCATION",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: const Color(0xFF313131),
                        fontFamily: monb,
                        letterSpacing: 0.94,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.h,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GradientText(
                        'GET 360 (DEGREE) ANALYSIS OF YOUR',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 30.0.h,
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
                            letterSpacing: 0.35,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF00425A),
                            fontSize: 14.h),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '2. Upload Files',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: nunr,
                            letterSpacing: 0.35,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF00425A),
                            fontSize: 14.h),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '3. Download A Detailed Report',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: nunr,
                            letterSpacing: 0.35,
                            fontWeight: FontWeight.w900,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "School Info",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0.42,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF448CF3),
                                          fontSize: 16.h),
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios,
                                            color: const Color(0xFF8993B9),
                                            size: 10.h,
                                          ),
                                          Text(
                                            "Back",
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.52,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xFF8993B9),
                                                fontSize: 13.h),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
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
                                            text: 'School Name ',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontFamily: 'Muli',
                                              letterSpacing: 0.36,
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
                                        Fields_Height: 50.h,
                                        // Fields_Width: 80.w,
                                        controller: schoolNameController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
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
                                        contentPadding: 10.0,
                                        labelColor: null,
                                        hintStyle: TextStyle(
                                            fontSize: 10.h,
                                            color: const Color(0xffA8A8A8)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Address ',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontFamily: 'Muli',
                                                  color:
                                                      const Color(0xff828282),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13.h,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
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
                                            Fields_Height: 50.h,
                                            Fields_Width: 60.w,
                                            controller: addressController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter some text';
                                              }
                                              return null;
                                            },
                                            BgColor: const Color(0xffffffff),
                                            edgeRadius: 5.0,
                                            keyboardType: TextInputType.name,
                                            hideText: false,
                                            fontWeight: FontWeight.w200,
                                            BorderColor:
                                                const Color(0xffE8E8E8),
                                            hintText: "Type Flat No & Street",
                                            inputTextSize: 12.0,
                                            label: null,
                                            sufficon: null,
                                            prefIcon: null,
                                            contentPadding: 10.0,
                                            labelColor: null,
                                            hintStyle: TextStyle(
                                                fontSize: 10.h,
                                                color: const Color(0xffA8A8A8)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Select City ',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontFamily: 'Muli',
                                                  color:
                                                      const Color(0xff828282),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13.h,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
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
                                            Fields_Height: 50.h,
                                            Fields_Width: 60.w,
                                            controller: cityController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter some text';
                                              }
                                              return null;
                                            },
                                            BgColor: const Color(0xffffffff),
                                            edgeRadius: 5.0,
                                            keyboardType: TextInputType.name,
                                            hideText: false,
                                            fontWeight: FontWeight.w200,
                                            BorderColor:
                                                const Color(0xffE8E8E8),
                                            hintText: "City",
                                            inputTextSize: 12.0,
                                            label: null,
                                            sufficon: null,
                                            prefIcon: null,
                                            contentPadding: 10.0,
                                            labelColor: null,
                                            hintStyle: TextStyle(
                                                fontSize: 10.h,
                                                color: const Color(0xffA8A8A8)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'State ',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontFamily: 'Muli',
                                                  color:
                                                      const Color(0xff828282),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13.h,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
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
                                            Fields_Height: 50.h,
                                            Fields_Width: 60.w,
                                            controller: stateController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter some text';
                                              }
                                              return null;
                                            },
                                            BgColor: const Color(0xffffffff),
                                            edgeRadius: 5.0,
                                            keyboardType: TextInputType.name,
                                            hideText: false,
                                            fontWeight: FontWeight.w200,
                                            BorderColor:
                                                const Color(0xffE8E8E8),
                                            hintText: "State",
                                            inputTextSize: 12.0,
                                            label: null,
                                            sufficon: null,
                                            prefIcon: null,
                                            contentPadding: 10.0,
                                            labelColor: null,
                                            hintStyle: TextStyle(
                                                fontSize: 10.h,
                                                color: const Color(0xffA8A8A8)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Pincode',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontFamily: 'Muli',
                                                  color:
                                                      const Color(0xff828282),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13.h,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '*',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
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
                                            Fields_Height: 50.h,
                                            Fields_Width: 60.w,
                                            controller: pincodeController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter some text';
                                              }
                                              return null;
                                            },
                                            BgColor: const Color(0xffffffff),
                                            edgeRadius: 5.0,
                                            keyboardType: TextInputType.name,
                                            hideText: false,
                                            fontWeight: FontWeight.w200,
                                            BorderColor:
                                                const Color(0xffE8E8E8),
                                            hintText: "Pincode",
                                            inputTextSize: 12.0,
                                            label: null,
                                            sufficon: null,
                                            prefIcon: null,
                                            contentPadding: 10.0,
                                            labelColor: null,
                                            hintStyle: TextStyle(
                                                fontSize: 10.h,
                                                color: const Color(0xffA8A8A8)),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 2.h),
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
                                                horizontal: 0.w,
                                                vertical: 10.h),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          style: DefaultTextStyle
                                                                  .of(context)
                                                              .style,
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: 'Name',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontFamily:
                                                                    'Muli',
                                                                color: const Color(
                                                                    0xff828282),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 13.h,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: '*',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontFamily:
                                                                    rubm,
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
                                                          Fields_Height: 50.h,
                                                          Fields_Width: 60.w,
                                                          controller:
                                                              nameController,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter some text';
                                                            }
                                                            return null;
                                                          },
                                                          BgColor: const Color(
                                                              0xffffffff),
                                                          edgeRadius: 5.0,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          hideText: false,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          BorderColor:
                                                              const Color(
                                                                  0xffE8E8E8),
                                                          hintText: "Type Name",
                                                          inputTextSize: 12.0,
                                                          label: null,
                                                          sufficon: null,
                                                          prefIcon: null,
                                                          contentPadding: 10.0,
                                                          labelColor: null,
                                                          hintStyle: TextStyle(
                                                              fontSize: 10.h,
                                                              color: const Color(
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
                                                horizontal: 0.w,
                                                vertical: 10.h),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                          style: DefaultTextStyle
                                                                  .of(context)
                                                              .style,
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text:
                                                                  'Phone Number',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontFamily:
                                                                    'Muli',
                                                                color: const Color(
                                                                    0xff828282),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 13.h,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: '*',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontFamily:
                                                                    rubm,
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
                                                          Fields_Height: 50.h,
                                                          Fields_Width: 60.w,
                                                          controller:
                                                              Mob_No_Controller,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter some text';
                                                            }
                                                            return null;
                                                          },
                                                          BgColor: const Color(
                                                              0xffffffff),
                                                          edgeRadius: 5.0,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          hideText: false,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          BorderColor:
                                                              const Color(
                                                                  0xffE8E8E8),
                                                          hintText:
                                                              "Type Phone Number",
                                                          inputTextSize: 12.0,
                                                          label: null,
                                                          sufficon: null,
                                                          prefIcon: null,
                                                          contentPadding: 10.0,
                                                          labelColor: null,
                                                          hintStyle: TextStyle(
                                                              fontSize: 10.h,
                                                              color: const Color(
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
                                        style:
                                            DefaultTextStyle.of(context).style,
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
                                        Fields_Height: 50.h,
                                        // Fields_Width: 80.w,
                                        controller: emailController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
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
                                        contentPadding: 10.0,
                                        labelColor: null,
                                        hintStyle: TextStyle(
                                            fontSize: 10.h,
                                            color: const Color(0xffA8A8A8)),
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
                              horizontal: 10.w, vertical: 5.h),
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
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: uploadPressed == 1
                                      ? Column(
                                          children: [
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text(
                                              'Drop a CSV file or',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontFamily: 'Muli',
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xFF303030),
                                                  fontSize: 13.h),
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  fixedSize: Size(30.w, 30.h),
                                                  backgroundColor:
                                                      const Color(0xFFEC8D3C)),
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  uploadFile();
                                                }
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    impo,
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'Import',
                                                    style: TextStyle(
                                                        fontFamily: rubm,
                                                        fontSize: 14.h),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : uploadPressed == 2
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  fileName,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff303030),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15.h),
                                                ),
                                                SizedBox(
                                                  height: 5.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      loading,
                                                      width: 35.w,
                                                      height: 35.h,
                                                    ),
                                                    Text(
                                                      "Processing ... Please Wait !!!",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xff303030),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13.h),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                          : uploadPressed == 3
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      " Your report is ready!",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xff303030),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 15.h),
                                                    ),
                                                    SizedBox(
                                                      height: 5.w,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          okIcon,
                                                          width: 39.w,
                                                          height: 39.h,
                                                        ),
                                                        Text(
                                                          "Please click the download button to continue.",
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xff818181),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 13.h),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : null),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    uploadPressed == 2
                                        ? ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape:
                                                    const BeveledRectangleBorder(),
                                                fixedSize: Size(20.w, 30.h),
                                                backgroundColor:
                                                    const Color(0xFF1D1D1D)),
                                            onPressed: () {},
                                            child: Text(
                                              'Clear',
                                              style: TextStyle(
                                                  fontFamily: rubm,
                                                  fontSize: 14.h),
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: const BeveledRectangleBorder(),
                                          fixedSize: Size(45.w, 36.h),
                                          backgroundColor: uploadPressed == 3
                                              ? const Color(0xFF1F8A70)
                                              : const Color(0xffBFBFBF)),
                                      onPressed: uploadPressed == 3
                                          ? () {
                                              submit();
                                            }
                                          : null,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.download_sharp,
                                            color: Colors.white,
                                            size: 20.h,
                                          ),
                                          Text(
                                            'Download Report',
                                            style: TextStyle(
                                                fontFamily: rubm,
                                                fontSize: 13.h),
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
                  //   height: 1.h,
                  // ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
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
                      // SizedBox(
                      //   width: 2.w,
                      // ),
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
            )
          ],
        ),
      ),
    );
  }
}
