import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      required this.label,
      this.fontSize = 18,
      this.color,
      this.fontWeight})
      : super(key: key);

  final String label;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      label,
      // textAlign: TextAlign.justify,
      style: GoogleFonts.poppins(
        color: color ?? Colors.black,
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
