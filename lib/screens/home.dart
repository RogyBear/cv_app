import 'package:cv_app/components/fox_head.dart';
import 'package:cv_app/components/home_tile.dart';
import 'package:cv_app/services/data.dart';
import 'package:cv_app/utils/letterQuestions.dart';
import 'package:cv_app/utils/resume_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final storage = new FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    // Call async function to retrieve data here.
    Provider.of<Data>(context, listen: false).getProgress();
    // check if value is already in storage
    // if in storage then pull data,
    // if not in storage, then init data
  }

  // void getProgress() async {
  //   const storage = FlutterSecureStorage();
  //   await storage.deleteAll();
  //   String? value = await storage.read(key: 'progress');
  //   if (value == null) {
  //     await storage.write(
  //         key: 'progress',
  //         value: Provider.of<Data>(context, listen: false).progress.toString());
  //   }
  //
  //   print(value);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FoxHead(),
            Text(
              'Створити документ',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Color(0xFFF7F7F8),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/images/cog.svg',
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/homeBg.svg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                HomeTile(
                  title: RichText(
                    text: const TextSpan(
                      text: 'Створіть своє\n',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: 'перше ',
                        ),
                        TextSpan(
                            text: 'резюме',
                            style: TextStyle(fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                  text: {
                    'key': 'resume',
                    'header': 'Резюме',
                    'button': 'Переглянути резюме'
                  },
                  questions: resumeQuestions,
                  colors: [Color(0xFF65ADEE), Color(0xFF3599F3)],
                  image: AssetImage('assets/images/cv.png'),
                ),
                const SizedBox(height: 50),
                HomeTile(
                  title: RichText(
                    text: const TextSpan(
                      text: 'Створіть перший\n',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text: 'супровідний лист',
                            style: TextStyle(fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                  text: {
                    'key': 'letter',
                    'header': 'Супровідний лист',
                    'button': 'Переглянути лист'
                  },
                  questions: letterQuestions,
                  colors: [Color(0xFFABD777), Color(0xFF91C355)],
                  image: AssetImage('assets/images/letter.png'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
