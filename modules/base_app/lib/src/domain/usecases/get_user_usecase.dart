import 'package:base_app/src/domain/entities/user.dart';
import 'package:base_app/src/domain/repositories/base_app_repository.dart';
import 'package:shared/shared.dart';

class GetUserUseCase implements UseCase<List<User>, NoParams> {
  final BaseAppRepository _repository;

  GetUserUseCase(this._repository);
  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await _repository.getUsers();
  }
}
