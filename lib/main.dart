import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/bloc/joke_cubit.dart';
import 'package:jokes/repositories/joke_repository.dart';
import 'package:jokes/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => JokeRepository(),
      child: BlocProvider<JokeCubit>(
        create: (context) => JokeCubit(context.read<JokeRepository>()),
        child: MaterialApp(
          title: 'Joke List',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(title: 'Joke List'),
        ),
      ),
    );
  }
}
