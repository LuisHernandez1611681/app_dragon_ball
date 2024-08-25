import 'package:app_dragon_ball/features/dragonball/presentation/providers/dragonball_provider.dart';
import 'package:app_dragon_ball/features/dragonball/presentation/widgets/character_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharactersScreen extends ConsumerWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsyncValue = ref.watch(charactersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dragon Ball Characters'),
      ),
      body: charactersAsyncValue.when(
        data: (characters) => ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final character = characters[index];
            return CharacterWidget(character: character);
          },
        ), 
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error'),)
      ),
    );

  }
}