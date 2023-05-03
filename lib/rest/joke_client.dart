import 'package:jokes/models/joke.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'joke_client.g.dart';

@RestApi(baseUrl: "https://api.chucknorris.io/jokes/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("random")
  Future<Joke> getJoke();
}
