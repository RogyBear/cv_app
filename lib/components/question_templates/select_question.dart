import 'package:flutter/material.dart';

class SelectQuestion extends StatefulWidget {
  final data;
  final title;
  final subtitle;
  final questions;
  const SelectQuestion({
    this.data,
    this.questions,
    this.title,
    this.subtitle,
    super.key
  });

  @override
  State<SelectQuestion> createState() => _SelectQuestionState();
}

class _SelectQuestionState extends State<SelectQuestion> {
  var _selected;
  @override
  void handleState(ind) {
    setState(() {
      _selected = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
          children: [
          Container(
              height: 120,
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        fontFamily: 'Nunito',
                        color: Color(0xFF082844)
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Nunito',
                        color: Color(0xFF082844)
                    ),
                  )
                ],
              )
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 110, 0, 0),
            child: ListView.separated(
              itemBuilder: (context, int index) {
                return CustomRadioTile(index, _selected, handleState, widget.data,
                    widget.questions[index]);
              },
              separatorBuilder: (context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: widget.questions.length,
            )
          )
        ]
      )
    );
  }
}

class CustomRadioTile extends StatelessWidget {
  final int index;
  final selected;
  final data;
  final question;
  final dynamic stateFunction;
  const CustomRadioTile(
      this.index, this.selected, this.stateFunction, this.data, this.question,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        stateFunction(index);
      },
      child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: data['palette']['tertiary'],
            ),
          ),
          child: Container(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: data['palette']['primary'][1],
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(3),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      //
                      color: selected == index
                          ? data['palette']['primary'][1]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  question,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF082844),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
