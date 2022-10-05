import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // elevation: 0,
        // backgroundColor: Colors.white,
        title: const Text(
          'test',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => {print('ok')},
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                width: 60,
                child: const Center(
                  child: Text('ok'),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            HomeTile(
              colors: [Color(0xFF65ADEE), Color(0xFF3599F3)],
              image: AssetImage('assets/images/cv.png'),
            ),
            const SizedBox(height: 50),
            HomeTile(
              colors: [Color(0xFFABD777), Color(0xFF91C355)],
              image: AssetImage('assets/images/letter.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeTile extends StatelessWidget {
  final List<Color> colors;
  final AssetImage image;
  HomeTile({super.key, required this.colors, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: colors,
            stops: const [0.0, 1.0]),
      ),
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/linesbg.svg',
            alignment: const Alignment(0, 1),
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFE5F2FF).withOpacity(.2),
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: image,
                        width: MediaQuery.of(context).size.height / 12,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      RichText(
                          text: const TextSpan(
                        text: 'Створіть своє\n',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: 'перше ',
                          ),
                          TextSpan(
                              text: 'резюме',
                              style: TextStyle(fontWeight: FontWeight.w600))
                        ],
                      )

                          // style: TextStyle(fontSize: 50, color: Colors.white),
                          )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/navigation');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [Color(0xFFFED255), Color(0xFFF4BF2A)],
                            stops: [0.0, 1.0]),
                      ),
                      child: const Center(
                        child: Text(
                          'Створити',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
