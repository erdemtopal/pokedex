import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon/model/pokemon_model.dart';

class PokeApi {
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  //privite değişken tanımladık sadece buradan erişilsin diye.  _ private yapıyor
  //herhangi bir nesne üretmeyeceğim için static yapıyoruz

  //verilerin gelmesi vakit alabileceğinden Future tipinde çbir liste oluşturuyoruz. burası verileri listelemek içindir.
  static Future<List<PokemonModel>> getPokemonData() async {
    // Pokemon sınıfının içinde, içinde Future tipide ve PokemonModel sınıflarını barındıran bir fonksiyon tanımladık
    List<PokemonModel> _list = []; //listenin içini doldurucaz

    var result = await Dio().get(_url);
    var pokeList = jsonDecode(result.data)['pokemon'];
    //burada map'e çevirdi resultu. Sonra da pokemonların olduğu listeye vevirdi. pokeList şuanda bir liste.
    //  debugPrint(pokeList['pokemon'][0]['name'].toString());
    //pokemon listesinin, sıfırıncı elemanının sadece adı yazar ekrana.  : Balbasaur

    if (pokeList is List) {
      //eğer pokeList bir listeyse. ki liste yaptık yukarıda
      _list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
      //PokemonModel sınıfında tüm elemanları mapledik. Sonda da listeye dönüştürüp _list e atadık.
      //_list içinde  PokemonModel sınıfınde kutucuklar var.,
      //debugPrint(_list.length.toString());  ekranda 151 yazar

      //debugPrint(_list.first.toString());
      //name i toString içine eklediğim için ekranda balbasour yazacak. aksi halde class genel ismi yazıyor.
    } else {
      return []; //boş liste döndürecek.
    }

    return _list;
  }
}
