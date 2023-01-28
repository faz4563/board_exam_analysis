import 'package:board_exam_analysis/utils/widget.dart';
import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

final TextEditingController schoolNameController = TextEditingController();
final TextEditingController flatNoAndStreetName = TextEditingController();
final TextEditingController city = TextEditingController();
final TextEditingController state = TextEditingController();
final TextEditingController pincode = TextEditingController();
final TextEditingController googleMapLink = TextEditingController();
final TextEditingController name = TextEditingController();
final TextEditingController phoneno = TextEditingController();
final TextEditingController email = TextEditingController();

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 0),
        //   child:
        // ),
        );
  }
}
