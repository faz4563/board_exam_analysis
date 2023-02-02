// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html' as html;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Iframe extends StatelessWidget {
  Iframe({super.key, required this.pdfLink}) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = pdfLink;
      // iframe.src =
      //     "https://s3.amazonaws.com/neverskip/data/2/s_img/220230130143653.pdf";
      return iframe;
    });
  }
  final pdfLink;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        width: 200.w,
        height: 500.h,
        child: const HtmlElementView(viewType: 'iframe'));
  }
}
