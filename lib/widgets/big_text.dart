import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  double size;
  final String text;
   Color? color;
  TextOverflow overFlow;//هاي ازا جملة وباقيها عبارة عن نقاط
   BigText({Key? key,
    required this.text,
    this.size=20,
    this.overFlow=TextOverflow.ellipsis,
     this.color= const Color(0xFF332d2b),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
        fontFamily: 'Roboto',

      ),

    );
  }
}
