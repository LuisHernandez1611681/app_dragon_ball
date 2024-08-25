import '../repositories/dragonball_repository.dart';
import '../entities/character_entity.dart';

class FetchCharactersUsecase {
  final DragonBallRepository repository;
  FetchCharactersUsecase(this.repository);

  Future<List<CharacterEntity>> execute() async {
    return await repository.getCharacters();
  }
}