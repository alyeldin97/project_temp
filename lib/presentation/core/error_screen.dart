import 'package:flutter/material.dart';
import 'package:project_template/presentation/core/error_dialog.dart';

class ErrorScreen extends StatelessWidget {
  final String messageEn;
  final String messageAr;
  final Screens screen;
  final dynamic arguments;
  const ErrorScreen(
      {Key? key,
      required this.messageEn,
      required this.messageAr,
      required this.screen,
      this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    ));
  }
}
