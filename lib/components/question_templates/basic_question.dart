import 'package:flutter/material.dart';

class BasicQuestion extends StatefulWidget {
  final String question;
  final Map<String, dynamic> data;
  const BasicQuestion({super.key, required this.question, required this.data});

  @override
  State<BasicQuestion> createState() => _BasicQuestionState();
}

class _BasicQuestionState extends State<BasicQuestion> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
              fontFamily: 'Nunito',
              color: Color(0xFF082844),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _controller,
            minLines: 2,
            maxLines: 5,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: widget.data['palette']['tertiary']),
                borderRadius: BorderRadius.circular(16),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: widget.data['palette']['tertiary']),
                borderRadius: BorderRadius.circular(16),
              ),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: widget.data['palette']['tertiary'])),
            ),
          )
        ],
      ),
    );
  }
}