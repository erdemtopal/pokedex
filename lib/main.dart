import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/pages/home_page.dart';
import 'package:pokemon/services/pokedex_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //Responsive olması için her ekranda Material APP ı bununla sarmaladık Paket de yükledik.
      designSize: const Size(412, 732),
      //bu API 30 cihazı için çözünürlük
      builder: () => MaterialApp(
        //builderı da Screen util için yazdık.
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        theme: ThemeData.dark().copyWith(
            textTheme: GoogleFonts.latoTextTheme()), //arka planı karartır
        home: HomePage(),
      ),
    );
  }
}
