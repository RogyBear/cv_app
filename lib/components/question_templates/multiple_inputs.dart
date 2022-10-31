import 'package:flutter/material.dart';

class MultipleInputs extends StatefulWidget {
  final Map<String, dynamic> questionData;
  final Map<String, dynamic> data;
  const MultipleInputs({
    super.key,
    required this.questionData,
    required this.data,
  });

  @override
  State<MultipleInputs> createState() => _MultipleInputsState();
}

class _MultipleInputsState extends State<MultipleInputs> {
  late TextEditingController _controller;
  List<String> inputs = [""];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 80,
                child: Text(
                  widget.questionData['question'],
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      fontFamily: 'Nunito',
                      color: Color(0xFF082844)
                  ),
                )),
            ...inputs.map((val) => CustomTextField(
                val: val,
                data: widget.data,
                placeholder: widget.questionData['placeholder']
            )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: widget.data['palette']['quarternary'],
                ),
              ),
              child: RawMaterialButton(
                padding: const EdgeInsets.symmetric(vertical: 15),
                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // shape: RoundedRectangleBorder(
                //     borderRadius:
                //         BorderRadius.all(Radius.circular(12))),
                child: const Text(
                  'Добавити мову',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () => setState(() => inputs = [...inputs, ""]),
              ),
            )
          ],
        ),
      )
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String val;
  final data;
  final String placeholder;

  const CustomTextField({
    super.key,
    required this.val,
    required this.data,
    required this.placeholder
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      minLines: 2,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: widget.placeholder,
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
    );
  }
}