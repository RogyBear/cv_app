import 'package:cv_app/utils/resume_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Color(0xFFF7F7F8),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(13),
                child: SvgPicture.asset(
                  'assets/images/backArrow.svg',
                  // alignment: const Alignment(0, 1),
                  width: MediaQuery.of(context).size.width,
                  // color: const Color(0xFFE5F2FF).withOpacity(.2),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              'Резюме',
              style: TextStyle(color: Colors.black),
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
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/navBg.svg',
              alignment: const Alignment(0, 1),
              width: MediaQuery.of(context).size.width,
              // color: const Color(0xFFE5F2FF).withOpacity(.2),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Інформація:',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: resumeQuestions.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/questions',
                              arguments: {'data': resumeQuestions[index]});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: resumeQuestions[index]['palette']
                                  ['secondary'],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors: resumeQuestions[index]['palette']
                                          ['primary'],
                                      stops: [0.0, 1.0]),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(14),
                                  ),
                                ),
                                height: 45,
                                width: 45,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      resumeQuestions[index]['title'],
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    LinearPercentIndicator(
                                      padding:
                                          EdgeInsets.only(left: 0.0, right: 10),
                                      lineHeight: 10.0,
                                      percent: 0.7,
                                      backgroundColor: Colors.white,
                                      barRadius: const Radius.circular(16),
                                      trailing: Text('100%'),
                                      linearGradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: resumeQuestions[index]
                                              ['palette']['primary']),
                                      // progressColor: LinearGradient(),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
