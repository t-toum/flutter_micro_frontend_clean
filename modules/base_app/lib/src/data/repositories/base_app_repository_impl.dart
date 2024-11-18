import 'package:base_app/src/data/datasources/base_app_remote_datasource.dart';
import 'package:base_app/src/domain/entities/user.dart';
import 'package:base_app/src/domain/repositories/base_app_repository.dart';
import 'package:shared/shared.dart';

class BaseAppRepositoryImpl implements BaseAppRepository {
  final BaseAppRemoteDatasource _appRemoteDatasource;

  BaseAppRepositoryImpl(this._appRemoteDatasource);
  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final result = await _appRemoteDatasource.getUsers();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    }
  }
}
