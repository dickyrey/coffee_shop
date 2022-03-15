import 'package:coffee_shop/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        primaryColor: const Color(0xFF004D34),
        cardColor: const Color(0xFFCCA472),
        dividerColor: const Color(0xFFF6F4F5),
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headline1: GoogleFonts.poppins(
            color: const Color(0xFF202020),
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
          headline2: GoogleFonts.poppins(
            color: const Color(0xFF202020),
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
          headline3: GoogleFonts.poppins(
            color: const Color(0xFF202020),
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          headline4: GoogleFonts.poppins(
            color: const Color(0xFF202020),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          headline5: GoogleFonts.poppins(
            color: const Color(0xFF202020),
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: GoogleFonts.poppins(
            color: const Color(0xFF202020),
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          bodyText2: GoogleFonts.poppins(
            color: const Color(0xFF202020),
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
          subtitle1: GoogleFonts.poppins(
            color: const Color(0xFF737373),
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
          subtitle2: GoogleFonts.poppins(
            color: const Color(0xFF737373),
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
          ),
          button: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
