import '../entities/character_entity.dart';

abstract class DragonBallRepository {
  Future<List<CharacterEntity>> getCharacters();
}