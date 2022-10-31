import 'package:cv_app/components/question_templates/basic_question.dart';
import 'package:cv_app/components/question_templates/checkbox_question.dart';
import 'package:cv_app/components/question_templates/date_dropdown.dart';
import 'package:flutter/material.dart';

class CustomQuestion extends StatefulWidget {
  final List questions;
  final String title;
  final Map<String, dynamic> data;
  const CustomQuestion({
    super.key,
    required this.questions,
    required this.title,
    required this.data
  });

  @override
  State<CustomQuestion> createState() => _CustomQuestionState();
}

class _CustomQuestionState extends State<CustomQuestion> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  List<Widget> displayQuestions() {
    List<Widget> questions = [];
    for(Map question in widget.questions) {
      switch(question["type"]) {
        case "basic":
          Widget basicQuestion = BasicQuestion(
              question: question["question"],
              placeholder: question["placeholder"],
              data: widget.data,
              custom: true
          );
          questions.add(basicQuestion);
          break;
        case "date":
          Widget dateQuestion = DateDropdownQuestion(
              question: question["question"],
              checkbox: question["checkbox"],
              data: widget.data
          );
          questions.add(dateQuestion);
          break;
        case "checkbox":
          Widget checkboxQuestion = CheckboxQuestion(
              question: question["question"],
              options: question["options"],
              data: widget.data
          );
          questions.add(checkboxQuestion);
          break;
      }
    }
    return questions;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 80,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      fontFamily: 'Nunito',
                      color: Color(0xFF082844)
                  ),
                )
            ),
            ...displayQuestions()
          ],
        ),
      ),
    );
  }
}