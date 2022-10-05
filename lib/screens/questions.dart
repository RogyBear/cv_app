import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  void nextPage() {
    _controller.animateToPage((_controller.page ?? 0).toInt() + 1,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void prevPage() {
    _controller.animateToPage((_controller.page ?? 0).toInt() - 1,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    final data = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      backgroundColor: data['data']['palette']['secondary'],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: data['data']['palette']['secondary'],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(14),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border.all(color: data['data']['palette']['tertiary']),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/images/x.svg',
                  alignment: const Alignment(0, 1),
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Expanded(
              child: LinearPercentIndicator(
                padding: EdgeInsets.only(left: 20.0, right: 15),
                lineHeight: 15.0,
                percent: 1,
                backgroundColor: Colors.white,
                barRadius: const Radius.circular(16),
                linearGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: data['data']['palette']['primary']),
                // progressColor: LinearGradient(),
              ),
            ),
            const SizedBox(
              height: 55,
              width: 55,
              child: Image(
                image: AssetImage(
                  'assets/images/foxHead.png',
                ),
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  itemCount: data['data']['questions'].length,
                  itemBuilder: (context, index) {
                    // HERE IS WHERE THE SWITCH STATEMENT GOES
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: Align(
                              child: Text(
                                  data['data']['questions'][index]['question'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28)),
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          BasicInput(data: data, index: index),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
                child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SecondaryButton(data: data, prevPage: prevPage),
                  ),
                  Expanded(
                    child: PrimaryButton(data: data, nextPage: nextPage),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),

      // ListView.builder(
      //    scrollDirection: Axis.horizontal,
      //    shrinkWrap: true,
    );
  }
}

// class Dropdown extends StatelessWidget {
//   const Dropdown({
//     Key? key,
//     required this.data,
//     required this.index,
//   }) : super(key: key);
//
//   final Map data;
//   final int index;
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       hint: _dropDownValue == null
//           ? Text('Dropdown')
//           : Text(
//         _dropDownValue,
//         style: TextStyle(color: Colors.blue),
//       ),
//       isExpanded: true,
//       iconSize: 30.0,
//       style: TextStyle(color: Colors.blue),
//       items: ['One', 'Two', 'Three'].map(
//             (val) {
//           return DropdownMenuItem<String>(
//             value: val,
//             child: Text(val),
//           );
//         },
//       ).toList(),
//       onChanged: (val) {
//         setState(
//               () {
//             _dropDownValue = val;
//           },
//         );
//       },
//     );
//   }
// }

class BasicInput extends StatelessWidget {
  const BasicInput({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final Map data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      decoration: InputDecoration(
          hintText: data['data']['questions'][index]['placeholder'],
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Color(0xFFDBECFE))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
                color: data['data']['palette']['primary'][0], width: 2.0),
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.all(20)),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({Key? key, required this.data, required this.prevPage})
      : super(key: key);

  final Map data;
  final VoidCallback prevPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
            ],
            border: Border.all(color: data['data']['palette']['primary'][1]),
            color: data['data']['palette']['secondary']),
        child: OutlinedButton(
          child: Text(
            "Назад",
            style: TextStyle(
                color: data['data']['palette']['primary'][1], fontSize: 18),
          ),
          onPressed: prevPage,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(27),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.data, required this.nextPage})
      : super(key: key);

  final Map data;
  final VoidCallback nextPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          border: Border.all(color: data['data']['palette']['primary'][1]),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              colors: data['data']['palette']['primary']),
        ),
        child: ElevatedButton(
          child: Text(
            "Далі",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: nextPage,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(27),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}
