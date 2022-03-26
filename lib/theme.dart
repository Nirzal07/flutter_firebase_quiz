import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


var theme = ThemeData(
  fontFamily: GoogleFonts.poppins().fontFamily,
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 18, color: Colors.white),
    button: TextStyle(fontSize: 15, color: Colors.white),
  )
);
