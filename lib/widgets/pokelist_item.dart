import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/constants/constants.dart';
import 'package:pokemon/constants/ui_helper.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/pages/detail_page.dart';
import 'package:pokemon/widgets/poke_img_and_ball.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //Cardları tıklanır yapmak için bu ya da gesture detektor
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(pokemon: pokemon)));
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![
            0]), //her pokemonun liste şeklinde bir özellik tablosu var.  iki type gibi.
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //yukarı aşağı
            crossAxisAlignment: CrossAxisAlignment.start, //sağ sol
            children: [
              Text(
                pokemon.name ?? 'N/A',
                style: Constants.getPokemonNameTextStyle(),
              ), //Eğer nullsa N/A yazsın ekrana dedik
              Chip(
                  label: Text(
                pokemon.type![0],
                style: Constants.getChipTextStyle(),
              )),
              //içinde küçük bi yuvarlak içinde değer oluşturuyor
              Expanded(child: PokeBallImageAndBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
