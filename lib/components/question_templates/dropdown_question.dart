import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownQuestion extends StatefulWidget {
  final data;
  const DropdownQuestion({this.data, super.key});

  @override
  State<DropdownQuestion> createState() => _DropdownQuestionState();
}

class _DropdownQuestionState extends State<DropdownQuestion> {
  String? _dropdownValue = 'one';
  @override
  Widget build(BuildContext context) {
    final List<String> list = ['one', 'two'];
    return InputDecorator(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
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
            value: _dropdownValue,
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Nunito',
                      color: Color(0xFF9CA9B4)),
                ),
              );
            }).toList(),
            onChanged: (val) {
              setState(() {
                _dropdownValue = val;
              });
            }),
      ),
    );
  }
}
