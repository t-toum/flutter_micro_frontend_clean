
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared/src/data/models/todo_model.dart';
part 'base_rest_client.g.dart';
@RestApi()
abstract class BaseRestClient {
  factory BaseRestClient(Dio dio, {String? baseUrl}) = _BaseRestClient;

  @GET("/todos")
  Future<List<TodoModel>> getTodos();
}