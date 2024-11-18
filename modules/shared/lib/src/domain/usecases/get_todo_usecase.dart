import 'package:dartz/dartz.dart';
import 'package:shared/src/core/error/failures.dart';
import 'package:shared/src/core/usecases/usecase.dart';
import 'package:shared/src/domain/entities/todo.dart';
import 'package:shared/src/domain/repositories/base_app_repository.dart';

import '../../core/usecases/no_params.dart';

class GetTodoUseCase implements UseCase<List<Todo>, NoParams> {
  final BaseAppRepository _repository;
  GetTodoUseCase(this._repository);
  
  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params)async {
    return await _repository.getTodo();
  }
}
