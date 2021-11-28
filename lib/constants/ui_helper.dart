import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();
  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
    //Tek satırda if else yaptı
    //dikey modda ise ekran portrait dikey moddur. potrait ise ekran
    //yüksekliğinin yüzde 15'i kadar olacak yükseklik. Değilse,
    //yani yataysa  ekran genişliğinin sw'nün yüzde 15'i olacak.
  }

  static EdgeInsets getDefaultPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(12.h);
    } else {
      return EdgeInsets.all(8.w);
    }
  }

  static double calculatePokeImgAndBallSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 0.2.sw; //tüm ekran genişliğinin yüzde 20'i olarak
    } else {
      return 0.3.sh; //screen height
    }
  }

  // ignore: unused_field
  static final Map<String, Color> _typeColorMap = {
    'Grass': Colors.green,
    'Fire': Colors.redAccent,
    'Water': Colors.blue,
    'Electric': Colors.yellow,
    'Rock': Colors.grey,
    'Ground': Colors.brown,
    'Bug': Colors.lightGreenAccent.shade700,
    'Psychic': Colors.indigo,
    'Fighting': Colors.orange,
    'Ghost': Colors.deepPurple,
    'Nomal': Colors.black26,
    'Posion': Colors.deepPurpleAccent
  };
  static Color? getColorFromType(String type) {
    if (_typeColorMap.containsKey(type)) {
      return _typeColorMap[type]; 
          //eğer içinde bulamazsa mapin pink yapacak
    } else {
      return Colors.pink.shade300;
    }
  }
}
