part of 'joke_cubit.dart';

enum JokeStatus { initial, loading, success, failure }

class JokeState extends Equatable {
  const JokeState({
    this.status = JokeStatus.initial,
    this.jokes = const [],
  });

  final JokeStatus status;
  final List<String?> jokes;

  @override
  List<Object?> get props => [status, jokes];
}
