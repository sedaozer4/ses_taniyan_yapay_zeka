import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.red,
      ),
      home:  Anasayfa(),
      debugShowCheckedModeBanner: false,
    );
  }
}


