import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._(); //kimse bundan nesne üretemez. gizli yaptık.

  static const String title = 'Pokedex';
  static String pokemonImageUrl = 'images/pokeball.png';

  static TextStyle getTitleStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(48), //altta bunu sp ile tanımladık.
    );
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(22),
    );
  }

  static TextStyle getChipTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSize(20),
    );
  }

  // ignore: unused_element
  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
      //Telefon ayarlarında  font sizeı yükselten körler için uygulamayı uygumlu hale getirmek için.
    } else {
      return (size * 1.2).sp;
      //telefon yana yatırıldığında 1.5 kat yap ve sp sine uyumla
    }
  }

  static getPokeInfoLabelTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(18),
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static getPokeInfoTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(16), color: Colors.black);
  }
}
