import 'package:shared/shared.dart';
part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
}