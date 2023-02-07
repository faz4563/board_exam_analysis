import 'package:board_exam_analysis/Screens/landingpg.dart';
import 'package:flutter/material.dart';

class LoaderPage extends StatefulWidget {
  const LoaderPage({super.key});

  @override
  State<LoaderPage> createState() => _LoaderPageState();
}

class _LoaderPageState extends State<LoaderPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const Landingpg();
              },
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
