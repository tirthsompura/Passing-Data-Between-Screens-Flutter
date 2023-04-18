import 'package:flutter/material.dart';
import 'form_widgets.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Send Data"),
        centerTitle: true,
        elevation: 1.5,
      ),
      body: const FormWidgetScreen(),
    );
  }
}
