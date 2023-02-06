import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  double size;
  final String text;
  double height;
  Color? color;
  SmallText({Key? key,
    required this.text,
    this.height=1.2,
    this.size=12,
    this.color= const Color(0xFF89dad0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Roboto',
        height: height,

      ),

    );
  }
}
