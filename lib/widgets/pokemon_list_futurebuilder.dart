import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/services/pokedex_api.dart';
import 'package:pokemon/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;
  //late demek, sonradan ben bunu tanımlıycam null kalmayacak demek.
  // Future tipinde, içinde  PokemonModel classları olan bir liste tanımladık

  @override
  void initState() {
    //sadece bir kez çalışacak.  her build çalıştığında tetiklenmesin diye burada init oluşturduk. init sadece 1 kez çalışır. _pokemonList içini doldurucaz

    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
    //jsondan veriyi çeken fonksiyonu çağırdık ve içini doldurduk.
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      //bilgiyu buradan getiricez. futurumuz bu.  burada listemiz var zaten.
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //bir data geldi mi diye soruyor
          List<PokemonModel> _listem = snapshot.data!;
          //PokemonModel olan bir liste oluşturduk.
          return GridView.builder(
              itemCount: _listem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
              itemBuilder: (context, index) =>
                  PokeListItem(pokemon: _listem[index]));
        } else if (snapshot.hasError) {
          //hata varsa buraya bakacak
          return const Center(child: Text('Hata var'));
        } else {
          return const Center(
            //burada data gelene kadar olan bekleme durumunu tarif ettik
            child: CircularProgressIndicator(), //dönen mavi şey
          );
        }
      },
    );
  }
}
