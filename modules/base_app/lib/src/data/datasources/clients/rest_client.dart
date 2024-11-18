import 'package:base_app/src/data/datasources/models/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared/shared.dart';
part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET('/users')
  Future<List<UserModel>> getTodo();
}