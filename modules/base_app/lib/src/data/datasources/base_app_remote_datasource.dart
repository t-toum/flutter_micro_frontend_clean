import 'package:base_app/src/data/datasources/clients/rest_client.dart';
import 'package:base_app/src/data/datasources/models/user_model.dart';
import 'package:shared/shared.dart';

abstract class BaseAppRemoteDatasource {
  Future<List<UserModel>> getUsers();
}

class BaseAppRemoteDatasourceImpl implements BaseAppRemoteDatasource {
  final RestClient client;

  BaseAppRemoteDatasourceImpl(this.client);

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await client.getTodo();
      return response;
    } on DioException catch (error) {
      throw ServerException(error.message ?? "");
    } catch (error) {
      throw ServerException("Get User error");
    }
  }
}
