import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/constants/constants.dart';
import 'package:pokemon/constants/ui_helper.dart';
import 'package:pokemon/model/pokemon_model.dart';

class PokeBallImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeBallImageAndBall({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            Constants.pokemonImageUrl,
            width: UIHelper.calculatePokeImgAndBallSize(),
            height: UIHelper.calculatePokeImgAndBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        //pokemon fotoları için cached_network_image kullanıcaz pub.devden
        //her seferinde programı internette yormak yerine 1 sefer çekiyor ve
        //cache directoryde tutuyor.
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            //animasyonu yaptı
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              //hata olduğunda errorWidget görünsün
              errorWidget: (context, url, error) =>
                  const Icon(Icons.access_alarm),
              width: UIHelper.calculatePokeImgAndBallSize(),
              height: UIHelper.calculatePokeImgAndBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const CircularProgressIndicator(
                //internetten çekene kadar bu çalışacak
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
