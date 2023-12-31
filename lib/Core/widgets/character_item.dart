import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rick_and_morty/Features/Data/Model/characters_model.dart';

import '../constants/strings.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetailsScreen,
            arguments: character),
        child: GridTile(
            footer: Hero(
              tag: character.id as Object,
              child: Container(
                color: Colors.black54,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "${character.name}",
                  style: const TextStyle(
                      height: 1.3,
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            child: Container(
              color: Colors.grey,
              child: character.image != null && character.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: "assets/images/loading (1).png",
                      image: character.image!,
                    )
                  : Lottie.asset("assets/images/loading.json"),
            )),
      ),
    );
  }
}
