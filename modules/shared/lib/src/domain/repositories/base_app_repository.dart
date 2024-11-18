import 'package:dartz/dartz.dart';
import 'package:shared/src/core/error/failures.dart';
import 'package:shared/src/domain/entities/todo.dart';

abstract class BaseAppRepository {
  Future<Either<Failure, List<Todo>>> getTodo();
}
