import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../configs/config_components.dart';

class ConfigText extends StatelessWidget {
  final String configFontText;
  final double? configFontSize;
  final FontWeight? configFontWeight;
  final Color? configFontColor;
  const ConfigText({
    super.key,
    required this.configFontText,
    this.configFontSize,
    this.configFontWeight,
    this.configFontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      configFontText,
      style: GoogleFonts.poppins(
        fontSize: configFontSize,
        fontWeight: configFontWeight,
        color: configFontColor ?? colorBlack,
      ),
    );
  }
}

final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(defaultRadius),
  borderSide: const BorderSide(
    color: colorAccent,
  ),
);

final eInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(defaultRadius),
  borderSide: const BorderSide(
    color: colorRed,
  ),
);

final sInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(defaultRadius),
  borderSide: const BorderSide(
    color: colorPrimary,
  ),
);

final defaultShadow = BoxShadow(
  color: colorBlack.withOpacity(0.2),
  blurRadius: 10,
  offset: const Offset(0, 4),
);

String formatDate(Timestamp initialDate) {
  DateTime date = initialDate.toDate();
  String formattedDate = DateFormat('dd MMMM yyyy').format(date);
  return formattedDate;
}

class Utils {
  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}
