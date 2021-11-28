import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/constants/constants.dart';
import 'package:pokemon/constants/ui_helper.dart';

class AppTitle extends StatefulWidget {
  AppTitle({Key? key}) : super(key: key);

  @override
  _AppTitleState createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(), //responsive bişey oldu.
      child: Stack(
        //üst üste konumlandırma için
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(), //farklı çözünürlükler için
            child: Align(
                alignment: Alignment.centerLeft, //conteynıra ortaladı
                child: Text(
                  Constants.title,
                  style: Constants.getTitleStyle(),
                )),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(Constants.pokemonImageUrl,
                width: ScreenUtil().orientation == Orientation.portrait
                    ? 0.2.sh
                    : 0.2.sw,
                fit: BoxFit.fitWidth),
            //100.w demek, içinde bulunduğu konteynerın %100 ünü kaplasın demektir
            //w ve h ler screen util sınıfından
          )
        ],
      ),
    );
  }
}
