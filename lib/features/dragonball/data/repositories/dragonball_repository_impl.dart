import 'package:app_dragon_ball/features/dragonball/data/datasources/dragonball_remote_data_source.dart';
import 'package:app_dragon_ball/features/dragonball/domain/entities/character_entity.dart';
import 'package:app_dragon_ball/features/dragonball/domain/repositories/dragonball_repository.dart';

class DragonballRepositoryImpl implements DragonBallRepository{
  final DragonballRemoteDataSource remoteDataSource;

  DragonballRepositoryImpl(this.remoteDataSource);
  
  @override
  Future<List<CharacterEntity>> getCharacters() async {
    final models = await remoteDataSource.fetchCharacters();
    return models.map((model) => CharacterEntity(name: model.name, imageUrl: model.imageUrl)).toList();
  }
}