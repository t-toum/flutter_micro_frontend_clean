import 'package:base_app/src/domain/entities/user.dart';
import 'package:shared/shared.dart';

abstract class BaseAppRepository {
  Future<Either<Failure, List<User>>> getUsers();
}