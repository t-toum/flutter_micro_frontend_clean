import 'package:dartz/dartz.dart';
import 'package:shared/src/core/error/exceptions.dart';
import 'package:shared/src/core/error/failures.dart';
import 'package:shared/src/data/datasources/base_app_remote_datasource.dart';
import 'package:shared/src/domain/entities/todo.dart';
import 'package:shared/src/domain/repositories/base_app_repository.dart';

class BaseAppRepositoryImpl implements BaseAppRepository {
  final BaseAppRemoteDatasource _appRemoteDatasource;

  BaseAppRepositoryImpl(this._appRemoteDatasource);
  @override
  Future<Either<Failure, List<Todo>>> getTodo() async {
    try {
      final result = await _appRemoteDatasource.getTodo();
      List<Todo> todos = result;
      return Right(todos);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    }
  }
}
