
import 'package:shared/shared.dart';
part 'base_rest_client.g.dart';
@RestApi()
abstract class BaseRestClient {
  factory BaseRestClient(Dio dio, {String? baseUrl}) = _BaseRestClient;
}