import 'package:cv_app/components/fox_head.dart';
import 'package:cv_app/components/question_templates/basic_question.dart';
import 'package:cv_app/components/question_templates/dropdown_question.dart';
import 'package:cv_app/components/question_templates/select_question.dart';
import 'package:cv_app/services/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    final data = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final providerProgress =
        Provider.of<Data>(context).progress[data['data']['key']];
    PageController _controller = PageController(
      initialPage:
          Provider.of<Data>(context).progress[data['data']['key']].toInt(),
    );
    print(providerProgress);
    print(data['data']['questions'].length - 1);
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
                animateFromLastPercent: true,
                animation: true,
                animationDuration: 200,
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 15,
                ),
                lineHeight: 15.0,
                percent: providerProgress.toDouble() /
                    (data['data']['questions'].length - 1),
                backgroundColor: Colors.white,
                barRadius: const Radius.circular(16),
                linearGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: data['data']['palette']['primary']),
              ),
            ),
            FoxHead()
          ],
        ),
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/questionsBg.svg',
            alignment: const Alignment(0, 1),
            color: data['data']['lineColor'],
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _controller,
                      itemCount: data['data']['questions'].length,
                      itemBuilder: (context, index) {
                        switch (data['data']['questions'][index]['type']) {
                          case 'basic':
                            return BasicQuestion(
                              question: data['data']['questions'][index]
                                  ['question'],
                              data: data['data'],
                            );
                          case 'dropdown':
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: DropdownQuestion(
                                data: data['data'],
                              ),
                            );
                          case 'select':
                            return SelectQuestion(
                              data: data['data'],
                              questions: data['data']['questions'][index]
                                  ['question'],
                            );
                          default:
                            // print(data['data']['questions'][index]['type']);
                            break;
                        }
                        // HERE IS WHERE THE SWITCH STATEMENT GOES
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                              data['data']['questions'][index]['question']),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: data['data']['palette']['primary'][1],
                            ),
                          ),
                          child: RawMaterialButton(
                            padding: EdgeInsets.symmetric(vertical: 17),
                            child: Text(
                              'Назад',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                color: data['data']['palette']['primary'][1],
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onPressed: () {
                              if (providerProgress != 0) {
                                _controller.animateToPage(
                                    (_controller.page?.round() ?? 0) - 1,
                                    duration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    curve: Curves.easeOut);

                                Provider.of<Data>(context, listen: false)
                                    .updateProgress(
                                  data['data']['key'],
                                  (_controller.page?.round() ?? 0) - 1,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: data['data']['palette']['primary'],
                            ),
                          ),
                          child: RawMaterialButton(
                            padding: EdgeInsets.symmetric(vertical: 17),
                            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            // shape: RoundedRectangleBorder(
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(12))),
                            child: const Text(
                              'Далі',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onPressed: () {
                              if (providerProgress !=
                                  (data['data']['questions'].length - 1)) {
                                _controller.animateToPage(
                                  (_controller.page?.round() ?? 0) + 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeOut,
                                );

                                Provider.of<Data>(context, listen: false)
                                    .updateProgress(
                                  data['data']['key'],
                                  (_controller.page?.round() ?? 0) + 1,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),

      // ListView.builder(
      //    scrollDirection: Axis.horizontal,
      //    shrinkWrap: true,
    );
  }
}
