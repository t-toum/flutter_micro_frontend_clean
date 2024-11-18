import 'package:dio/dio.dart';
import 'package:shared/src/core/clients/base_rest_client.dart';
import 'package:shared/src/core/error/exceptions.dart';
import 'package:shared/src/data/models/todo_model.dart';

abstract class BaseAppRemoteDatasource {
  Future<List<TodoModel>> getTodo();
}

class BaseAppRemoteDatasourceImpl implements BaseAppRemoteDatasource {
  final BaseRestClient _client;
  BaseAppRemoteDatasourceImpl(this._client);
  @override
  Future<List<TodoModel>> getTodo() async {
    try {
      final response = await _client.getTodos();
      return response;
    } on DioException catch (error) {
      throw ServerException(error.message ?? "");
    } catch (error) {
      throw ServerException("Get todo error");
    }
  }
}
