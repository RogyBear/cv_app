import 'package:flutter/material.dart';

class CheckboxQuestion extends StatefulWidget {
  final String question;
  final List<String> options;
  final Map<String, dynamic> data;
  const CheckboxQuestion({
    super.key,
    required this.question,
    required this.options,
    required this.data
  });

  @override
  State<CheckboxQuestion> createState() => _CheckboxQuestionState();
}

class _CheckboxQuestionState extends State<CheckboxQuestion> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
