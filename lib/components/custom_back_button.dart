import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
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
          padding: EdgeInsets.all(13),
          child: SvgPicture.asset(
            'assets/images/backArrow.svg',
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
