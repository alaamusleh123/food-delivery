import 'package:flutter/cupertino.dart';
import 'package:food_delivery/widgets/small_taxt.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;//لون النص هو حزفو لانو معرفو عندو اما انا مش معرفاه فهخليه
  final Color iconColor;
  const IconAndTextWidget({Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        SizedBox(width: 5,),
        SmallText(text: text, color: color,),
      ],
    );
  }
}
