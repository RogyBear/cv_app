import 'package:cv_app/components/question_templates/dropdown_question.dart';
import 'package:cv_app/components/question_templates/select_question.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DateDropdownQuestion extends StatefulWidget {
  final String question;
  final String? checkbox;
  final Map<String, dynamic> data;

  const DateDropdownQuestion({
    super.key,
    required this.question,
    required this.data,
    this.checkbox

});

  @override
  State<DateDropdownQuestion> createState() => _DateDropdownQuestionState();
}

class _DateDropdownQuestionState extends State<DateDropdownQuestion> {
  String? yearValue = '';
  String? monthValue = '';
  List<String> monthOptions = ["January", "Febuary", "March", "April"];
  List<String> yearOptions = ["2022"];
  bool checked = false;

  @override
  void initState() {
    super.initState();
    if(monthOptions.isNotEmpty) {
      monthValue = monthOptions[0];
    }
    if(yearOptions.isNotEmpty) {
      yearValue = yearOptions[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
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
            Center(
                child: Row(
                  children: [
                    Container(
                        width: 220,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 20,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: widget.data['palette']['tertiary'],
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                                iconSize: 30.0,
                                icon: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: widget.data['palette']['primary'][0],
                                ),
                                isExpanded: true,
                                dropdownElevation: 4,
                                dropdownDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                value: monthValue,
                                items: monthOptions.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Nunito',
                                          color: Color(0xFF9CA9B4)),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    monthValue = val;
                                  });
                                }),
                          ),
                        )
                    ),
                    SizedBox(width: 10),
                    Container(
                        width: 120,
                        child: InputDecorator(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 20,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: widget.data['palette']['tertiary'],
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                                iconSize: 30.0,
                                icon: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: widget.data['palette']['primary'][0],
                                ),
                                isExpanded: true,
                                dropdownElevation: 4,
                                dropdownDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                value: yearValue,
                                items: yearOptions.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Nunito',
                                          color: Color(0xFF9CA9B4)),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    yearValue = val;
                                  });
                                }),
                          ),
                        )
                    )
                  ],
                )
            ),
            if(widget.checkbox != null)
              DateRadio(
                  checked,
                  () => setState(() => checked = !checked),
                  widget.data,
                  widget.checkbox
              )
          ],
        ),
      );
  }
}

class DateRadio extends StatelessWidget {
  final bool selected;
  final updateState;
  final data;
  final question;

  const DateRadio(
      this.selected,
      this.data,
      this.question,
      this.updateState,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => updateState(),
      child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
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
                    color: selected
                        ? data['palette']['primary'][1]
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                question,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF082844),
                ),
              )
            ],
          )
      ),
    );
  }
}
