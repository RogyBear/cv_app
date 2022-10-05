import 'package:cv_app/components/fox_head.dart';
import 'package:flutter/material.dart';
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
            FoxHead()
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
                      child: Text(data['data']['questions'][index]['question']),
                    );
                  }),
            ),
            Container(
              child: Text('Buttons go here'),
            )
          ],
        ),
      ),

      // ListView.builder(
      //    scrollDirection: Axis.horizontal,
      //    shrinkWrap: true,
    );
  }
}
