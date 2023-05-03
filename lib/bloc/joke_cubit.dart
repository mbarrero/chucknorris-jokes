import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes/repositories/joke_repository.dart';

part 'joke_state.dart';

class JokeCubit extends Cubit<JokeState> {
  JokeCubit(this._jokeRepository) : super(const JokeState());

  final JokeRepository _jokeRepository;

  void getJokes() async {
    const numberOfJokes = 20;
    emit(const JokeState(status: JokeStatus.loading));
    try {
      var result = await Future.wait(Iterable<Future>.generate(
          numberOfJokes, (_) => Future(_jokeRepository.getJoke)));
      var jokes = List<String>.from(result);
      emit(JokeState(status: JokeStatus.success, jokes: jokes));
    } catch (e) {
      emit(const JokeState(status: JokeStatus.failure));
    }
  }
}
