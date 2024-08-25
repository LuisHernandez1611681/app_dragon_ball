import 'package:app_dragon_ball/features/dragonball/data/datasources/dragonball_remote_data_source.dart';
import 'package:app_dragon_ball/features/dragonball/data/repositories/dragonball_repository_impl.dart';
import 'package:app_dragon_ball/features/dragonball/domain/entities/character_entity.dart';
import 'package:app_dragon_ball/features/dragonball/domain/usecases/fetch_characters_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

//  Proporciona una instancia de http.Client, que es utilizada para hacer solicitudes HTTP.
final httpClientProvider = Provider((_) => http.Client());

// Proporciona una instancia de DragonballRemoteDataSource, que se encarga de hacer solicitudes a la API de Dragon Ball.
final dragonBallRemoteDataSourceProvider = Provider(
  (ref) => DragonballRemoteDataSource(ref.watch(httpClientProvider))
);

// Proporciona una instancia de DragonballRepositoryImpl, que implementa la interfaz del repositorio y se encarga de la lógica de acceso a datos.
final dragonBallRepositoryProvider = Provider(
  (ref) => DragonballRepositoryImpl(ref.watch(dragonBallRemoteDataSourceProvider))
);

// Proporciona una instancia de FetchCharactersUsecase, que encapsula la lógica para obtener la lista de personajes.
final fetchCharactersUseCaseProvider = Provider(
  (ref) => FetchCharactersUsecase(ref.watch(dragonBallRepositoryProvider)),
);

// Proporciona una lista de personajes, manejando estados asíncronos como loading, data, y error.
final charactersProvider = FutureProvider<List<CharacterEntity>>(
  (ref) async {
    final useCase = ref.watch(fetchCharactersUseCaseProvider);
    return useCase.execute();
  },
);

