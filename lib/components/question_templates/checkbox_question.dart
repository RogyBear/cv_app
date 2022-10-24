import 'package:cv_app/components/question_templates/date_dropdown.dart';
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
  String checked = "";

  @override
  void initState() {
    super.initState();
    checked = widget.options[0];
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 30,
                  child: Text(
                    widget.question,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Nunito',
                        color: Color(0xFF082844)
                    ),
                  )
              ),
              ...widget.options.map((option) => CustomCheckbox(
                  checked: checked == option,
                  data: widget.data,
                  title: option,
                  onTap: () => setState(() => checked =
                    checked == option ? "" : option)
              ))
            ]
        )
    );
  }
}
