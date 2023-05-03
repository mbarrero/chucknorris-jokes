import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/bloc/joke_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<JokeCubit>().getJokes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<JokeCubit, JokeState>(builder: (context, state) {
        switch (state.status) {
          case JokeStatus.initial:
            return const SizedBox.shrink();
          case JokeStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case JokeStatus.success:
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: state.jokes.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return Center(child: Text('${state.jokes[index]}'));
              },
            );
          case JokeStatus.failure:
            return const Text("Error");
        }
      }),
    );
  }
}
