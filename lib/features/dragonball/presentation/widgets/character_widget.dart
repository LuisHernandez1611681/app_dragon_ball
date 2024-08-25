import 'package:app_dragon_ball/features/dragonball/domain/entities/character_entity.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final CharacterEntity character;

  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(character.imageUrl),
      title: Text(character.name),
    );
  }
}