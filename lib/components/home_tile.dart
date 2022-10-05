import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTile extends StatelessWidget {
  final Map text;
  final List questions;
  final List<Color> colors;
  final AssetImage image;
  HomeTile({
    super.key,
    required this.text,
    required this.questions,
    required this.colors,
    required this.image,
  });

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
                      Navigator.pushNamed(
                        context,
                        '/navigation',
                        arguments: {'data': questions, 'text': text},
                      );
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
