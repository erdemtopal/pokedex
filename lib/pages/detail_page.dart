import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/constants/constants.dart';
import 'package:pokemon/constants/ui_helper.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/widgets/poke_information.dart';
import 'package:pokemon/widgets/poke_type_and_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel
      pokemon; //Tüm veriler PokemonModel içinde o yüzden çağırdık
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPotraitBody(context)
        : _buildLandScapeBody(context);
    //if else yaptı aslında potrait ve landscape için
  }

  Scaffold _buildLandScapeBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getDefaultPadding(),
              child: IconButton(
                  iconSize: 16.w,
                  onPressed: () {
                    Navigator.of(context).pop(); //bir önceki sayfaya gelir
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      PokeTypeandName(pokemon: pokemon),
                      Hero(
                        tag: pokemon.id!,
                        child: CachedNetworkImage(
                          imageUrl: pokemon.img ?? '',
                          height: 0.25.sw,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: PokeInformation(pokemonModel: pokemon),
                    )),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Scaffold _buildPotraitBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getDefaultPadding(),
              child: IconButton(
                  iconSize: 24.h,
                  onPressed: () {
                    Navigator.of(context).pop(); //bir önceki sayfaya gelir
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            PokeTypeandName(pokemon: pokemon),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                    child: Image.asset(
                      Constants.pokemonImageUrl,
                      height: 0.15.sh,
                      fit: BoxFit.fitHeight,
                    ),
                    right: 0,
                    top: 0),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.12.sh,
                    child: PokeInformation(pokemonModel: pokemon)),
                //ekranda görünmeyen eleman varsa yer değiştiricez.
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            )),
            //expanded ile tüm alana yayıldı
          ],
        ),
      ),
    );
  }
}
