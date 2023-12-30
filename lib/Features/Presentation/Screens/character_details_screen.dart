import 'package:flutter/material.dart';

import '../../Data/Model/characters_model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 600,
              pinned: true,
              stretch: true,
              backgroundColor: Colors.grey,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  character.name ?? "",
                  style: const TextStyle(color: Colors.white),
                ),
                background: Hero(
                  tag: character.id as Object,
                  child: Image.network(
                    character.image ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CharacterInfo(
                        title: "status : ", value: character.status ?? ""),
                    const BuildDivider(endIndent: 305),
                    CharacterInfo(
                        title: "species : ", value: character.species ?? ""),
                    const BuildDivider(endIndent: 290),
                    CharacterInfo(
                        title: "gender : ", value: character.gender ?? ""),
                    const BuildDivider(endIndent: 300),
                    CharacterInfo(
                        title: "origin : ",
                        value: character.origin?.name ?? ""),
                    const BuildDivider(endIndent: 310),
                    CharacterInfo(
                        title: "location : ",
                        value: character.location?.name ?? ""),
                    const BuildDivider(endIndent: 290),
                  ],
                ),
              )
            ]))
          ],
        ));
  }
}

class CharacterInfo extends StatelessWidget {
  final String title;
  final String value;

  const CharacterInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          TextSpan(
              text: value,
              style: const TextStyle(fontSize: 16, color: Colors.white))
        ]));
  }
}

class BuildDivider extends StatelessWidget {
  final double endIndent;

  const BuildDivider({super.key, required this.endIndent});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Colors.orange,
      thickness: 2,
    );
  }
}
