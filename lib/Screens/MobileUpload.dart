// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:board_exam_analysis/Screens/pdfViewPage.dart';
import 'package:board_exam_analysis/controllers/ApiController.dart';
import 'package:board_exam_analysis/model/FileUploadModel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:board_exam_analysis/utils/images.dart';
import 'package:board_exam_analysis/utils/fonts.dart';
import 'package:board_exam_analysis/utils/widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import '../model/pdfModel.dart';
import '../utils/ApiConstants.dart';

class MobileUpload extends StatefulWidget {
  const MobileUpload({super.key, required this.RandomKey});
  final RandomKey;

  @override
  State<MobileUpload> createState() => _MobileUploadState();
}

class _MobileUploadState extends State<MobileUpload> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final TextEditingController Mob_No_Controller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? selectedState;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    schoolNameController.clear();
    addressController.clear();
    cityController.clear();

    Mob_No_Controller.clear();
    emailController.clear();
    selectedState = "";
    super.dispose();
  }

  var fileName = '';
  int uploadPressed = 1;
  bool PdfPreview = false;
  PdfModel PdfData = PdfModel();
  FileUploadModel FileUploads = FileUploadModel();

  void uploadFile() async {
    var result = await FilePicker.platform.pickFiles(
        withReadStream: true,
        type: FileType.custom,
        allowedExtensions: ['txt']);
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
    request.files.add(http.MultipartFile(
        "image", objFile!.readStream!, objFile!.size,
        filename: objFile!.name));
    var resp = await request.send();
    String result = await resp.stream.bytesToString();
    print(result);
    FileUploads = fileUploadModelFromJson(result);
    setState(() {
      uploadPressed = 2;
    });

    finished(result);
    print(fileName);
    print(uploadPressed);
    print(FileUploads.d!.rurl);
  }

  finished(result) {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          uploadPressed = 3;
        });
      },
    );
  }

  submit() async {
    var data = {
      "rand_key": widget.RandomKey,
      "sch_name": schoolNameController.text,
      "street": addressController.text,
      "city": cityController.text,
      "state": selectedState,
      "pincode": "",
      "location": fileName,
      "name": "",
      "mobile_no": Mob_No_Controller.text,
      "email": emailController.text,
      "image": FileUploads.d!.rurl
    };
    print(data);

    var response =
        await ApiController.post(updateAnalysisApi, jsonEncode(data));
    // print(response);

    if (response != null) {
      PdfData = PdfModel.fromJson(response);
    }

    if (PdfData.s == true) {
      setState(() {
        PdfPreview = true;
        print(PdfData.d!.data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: _formKey,
        child: ListView(children: [
          Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(pgone), fit: BoxFit.cover),
              ),
              child: Column(children: [
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
                Container(
                    width: 338.w,
                    height: 790.h,
                    decoration: BoxDecoration(
                        color: const Color(0xffFBFBFB),
                        border: Border.all(color: const Color(0xffE8E8E8)),
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    // height: MediaQuery.of(context).size.height / 2,
                    child: PdfPreview == true
                        ? Iframe(
                            pdfLink: PdfData.d!.data,
                          )
                        : Container(
                            width: 338.w,
                            height: 970.h,
                            decoration: BoxDecoration(
                                color: const Color(0xffFBFBFB),
                                border:
                                    Border.all(color: const Color(0xffE8E8E8)),
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(15)),
                            // height: MediaQuery.of(context).size.height / 2,
                            child: Column(children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.h, horizontal: 10.w),
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
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontFamily: 'Montserrat',
                                                    letterSpacing: 0.52,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        const Color(0xFF8993B9),
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
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 0.h),
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
                                                text: 'School Name ',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontFamily: 'Muli',
                                                  letterSpacing: 0.36,
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
                                        SizedBox(
                                          width: 308.w,
                                          height: 50.h,
                                          child: TextFormField(
                                            readOnly: false,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: schoolNameController,
                                            decoration: InputDecoration(
                                                helperText: '',
                                                helperStyle: const TextStyle(
                                                    fontSize: 1, height: 0),
                                                errorStyle: TextStyle(
                                                    fontSize: 12.h, height: 0),
                                                fillColor:
                                                    const Color(0xffffffff),
                                                contentPadding:
                                                    const EdgeInsets.all(10.0),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xffE8E8E8),
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.red,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    5.0,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.blue,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    5.0,
                                                  ),
                                                ),
                                                hintStyle: TextStyle(
                                                    fontSize: 10.h,
                                                    color: const Color(
                                                        0xffA8A8A8)),
                                                hintText: "Your School Name",
                                                prefixStyle: const TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                )),
                                            keyboardType: TextInputType.name,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return " Please enter Your School Name ";
                                              } else {
                                                return null;
                                              }
                                            },
                                            onChanged: (value) {},
                                            obscureText: false,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w200,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
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
                                            text: 'Address ',
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
                                    // SizedBox(
                                    //   height: 3.h,
                                    // ),
                                    SizedBox(
                                      width: 308.w,
                                      height: 50.h,
                                      child: TextFormField(
                                        readOnly: false,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: addressController,
                                        decoration: InputDecoration(
                                            helperText: '',
                                            helperStyle: const TextStyle(
                                                fontSize: 1, height: 0),
                                            errorStyle: TextStyle(
                                                fontSize: 12.h, height: 0),
                                            fillColor: const Color(0xffffffff),
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xffE8E8E8),
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.blue,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5.0,
                                              ),
                                            ),
                                            hintStyle: TextStyle(
                                                fontSize: 10.h,
                                                color: const Color(0xffA8A8A8)),
                                            hintText: "School Address",
                                            prefixStyle: const TextStyle(
                                                color: Colors.grey),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            )),
                                        keyboardType: TextInputType.name,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter Your Address";
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (value) {},
                                        obscureText: false,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
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
                                            text: 'Enter Your City Name',
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
                                    SizedBox(
                                      width: 308.w,
                                      height: 50.h,
                                      child: TextFormField(
                                        readOnly: false,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: cityController,
                                        decoration: InputDecoration(
                                            helperText: '',
                                            helperStyle: const TextStyle(
                                                fontSize: 1, height: 0),
                                            errorStyle: TextStyle(
                                                fontSize: 12.h, height: 0),
                                            fillColor: const Color(0xffffffff),
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xffE8E8E8),
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.blue,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5.0,
                                              ),
                                            ),
                                            hintStyle: TextStyle(
                                                fontSize: 10.h,
                                                color: const Color(0xffA8A8A8)),
                                            hintText: "City",
                                            prefixStyle: const TextStyle(
                                                color: Colors.grey),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            )),
                                        keyboardType: TextInputType.name,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Your City";
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (value) {},
                                        obscureText: false,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
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
                                            text: 'State ',
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
                                    SizedBox(
                                      width: 308.w,
                                      height: 50.h,
                                      child: DropdownButtonFormField<String>(
                                        value: selectedState,
                                        hint: Text(
                                          'Select Your State',
                                          style: TextStyle(
                                              fontSize: 10.h,
                                              color: const Color(0xffA8A8A8)),
                                        ),
                                        onChanged: (value) => setState(() {
                                          selectedState = value;
                                        }),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        decoration: InputDecoration(
                                            helperText: '',
                                            helperStyle: const TextStyle(
                                                fontSize: 1, height: 0),
                                            errorStyle: TextStyle(
                                                fontSize: 12.h, height: 0),
                                            fillColor: const Color(0xffffffff),
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xffE8E8E8),
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.blue,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5.0,
                                              ),
                                            ),
                                            hintStyle: TextStyle(
                                                fontSize: 10.h,
                                                color: const Color(0xffA8A8A8)),
                                            hintText: "Select your State",
                                            prefixStyle: const TextStyle(
                                                color: Colors.grey),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            )),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        // validator: (value) => value != null
                                        //     ? null
                                        //     : "Please Select Your State",

                                        validator: (value) {
                                          if (value == null) {
                                            return "Please Select Your State";
                                          } else {
                                            return null;
                                          }
                                        },
                                        items: indianStatesLists
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
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
                                                text: 'Phone Number',
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
                                        SizedBox(
                                          width: 308.w,
                                          height: 50.h,
                                          child: TextFormField(
                                            readOnly: false,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: Mob_No_Controller,
                                            decoration: InputDecoration(
                                                helperText: '',
                                                helperStyle: const TextStyle(
                                                    fontSize: 1, height: 0),
                                                errorStyle: TextStyle(
                                                    fontSize: 12.h, height: 0),
                                                fillColor:
                                                    const Color(0xffffffff),
                                                contentPadding:
                                                    const EdgeInsets.all(10.0),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xffE8E8E8),
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.red,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    5.0,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.blue,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    5.0,
                                                  ),
                                                ),
                                                hintStyle: TextStyle(
                                                    fontSize: 10.h,
                                                    color: const Color(
                                                        0xffA8A8A8)),
                                                hintText: "Type Phone Number",
                                                prefixStyle: const TextStyle(
                                                    color: Colors.grey),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                )),
                                            keyboardType: TextInputType.name,
                                            validator: validateMobile,
                                            onChanged: (value) {},
                                            obscureText: false,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w200,
                                            ),
                                          ),
                                        )
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
                                    SizedBox(
                                      width: 308.w,
                                      height: 50.h,
                                      child: TextFormField(
                                        readOnly: false,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: emailController,
                                        decoration: InputDecoration(
                                            helperText: '',
                                            helperStyle: const TextStyle(
                                                fontSize: 1, height: 0),
                                            errorStyle: TextStyle(
                                                fontSize: 12.h, height: 0),
                                            fillColor: const Color(0xffffffff),
                                            contentPadding:
                                                const EdgeInsets.all(10.0),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xffE8E8E8),
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.blue,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5.0,
                                              ),
                                            ),
                                            hintStyle: TextStyle(
                                                fontSize: 10.h,
                                                color: const Color(0xffA8A8A8)),
                                            hintText: "Type Email Id",
                                            prefixStyle: const TextStyle(
                                                color: Colors.grey),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            )),
                                        keyboardType: TextInputType.name,
                                        validator: validateEmail,
                                        onChanged: (value) {},
                                        obscureText: false,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.h, vertical: 10.h),
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
                                    Center(
                                      child: Container(
                                          width: 308.w,
                                          height: 100.h,
                                          decoration: const BoxDecoration(
                                              color: Colors.white),
                                          child: uploadPressed == 1
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Text(
                                                      'Drop a CSV file or',
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontFamily: 'Muli',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: const Color(
                                                              0xFF303030),
                                                          fontSize: 13.h),
                                                    ),
                                                    SizedBox(
                                                      height: 15.h,
                                                    ),
                                                    FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                                fixedSize: Size(
                                                                    87.w, 27.h),
                                                                backgroundColor:
                                                                    const Color(
                                                                        0xFFEC8D3C)),
                                                        onPressed: () {
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            uploadFile();
                                                          }
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              impo,
                                                              width: 12.w,
                                                              height: 12.h,
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                'Import',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        rubm,
                                                                    fontSize:
                                                                        10.h),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : uploadPressed == 2
                                                  ? Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          fileName,
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xff303030),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                                              loading,
                                                              width: 35.w,
                                                              height: 35.h,
                                                            ),
                                                            SizedBox(
                                                              width: 4.w,
                                                            ),
                                                            Text(
                                                              "Processing ... Please Wait !!!",
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xff303030),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      13.h),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  : uploadPressed == 3
                                                      ? Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              " Your report is ready!",
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xff303030),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      15.h),
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
                                                                      fontSize:
                                                                          10.h),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      : null),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          uploadPressed == 2
                                              ? FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        shape:
                                                            const BeveledRectangleBorder(),
                                                        fixedSize:
                                                            Size(68.w, 28.h),
                                                        backgroundColor:
                                                            const Color(
                                                                0xFF1D1D1D)),
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Clear',
                                                      style: TextStyle(
                                                          fontFamily: rubm,
                                                          fontSize: 10.h),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape:
                                                      const BeveledRectangleBorder(),
                                                  fixedSize: Size(180.w, 38.h),
                                                  backgroundColor:
                                                      uploadPressed == 3
                                                          ? const Color(
                                                              0xFF1F8A70)
                                                          : const Color(
                                                              0xffBFBFBF)),
                                              onPressed: uploadPressed == 3
                                                  ? () {
                                                      submit();
                                                    }
                                                  : null,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Icon(
                                                    Icons.download_sharp,
                                                    color: Colors.white,
                                                    size: 20.h,
                                                  ),
                                                  SizedBox(
                                                    width: 10.h,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Generate Report',
                                                      style: TextStyle(
                                                          fontFamily: rubm,
                                                          fontSize: 10.h),
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
                            ])))
              ])),
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
          )
        ]));
  }

  String? validateEmail(String? value) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(pattern);

    if (value!.isEmpty) {
      return 'Please Enter Your Email Id';
    } else if (value.contains('@')) {
      return null;
    } else {
      return 'Please Enter a valid Email Id';
    }
  }
  // return value!.isNotEmpty && !regex.hasMatch(value)
  //     ? 'Please Enter a valid email address'
  //     : null;

  String? validateMobile(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Mobile Number';
    } else if (value.length < 10 || value.length > 10) {
      return 'Please Enter a valid Mobile Number';
    }
    return null;
  }
}
