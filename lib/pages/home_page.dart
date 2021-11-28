import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/services/pokedex_api.dart';
import 'package:pokemon/widgets/apptitle.dart';
import 'package:pokemon/widgets/pokemon_list_futurebuilder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTitle(),
          Expanded(child: PokemonList()),
          //expanded yapmazsak sorun oluyor. Listelerdeki sorunlara basit bir çözüm
        ],
      ),
    );
  }
}
