import 'package:jokes/models/joke.dart';
import 'package:jokes/rest/joke_client.dart';
import 'package:dio/dio.dart';

class JokeRepository {
  JokeRepository({RestClient? jokeClient})
      : _restClient = jokeClient ?? RestClient(Dio());

  final RestClient _restClient;

  Future<String> getJoke() async {
    late Joke joke;
    try {
      joke = await _restClient.getJoke();
    } catch (e) {
      rethrow;
    }
    return joke.value;
  }
}
