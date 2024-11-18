import 'package:base_app/src/domain/entities/user.dart';
import 'package:base_app/src/domain/usecases/get_user_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';
part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTodoUseCase _getTodoUseCase;
  final GetUserUseCase _getUserUseCase;

  HomeCubit({
    required GetTodoUseCase getTodoUseCase,
    required GetUserUseCase getUserUseCase,
  })  : _getTodoUseCase = getTodoUseCase,
        _getUserUseCase = getUserUseCase,
        super(const HomeState());

  Future<void> getTodo() async {
    emit(state.copyWith(status: DataStatus.loading));
    final result = await _getTodoUseCase(NoParams());
    result.fold((error) {
      emit(state.copyWith(status: DataStatus.error, error: error.message));
    }, (res) {
      emit(state.copyWith(status: DataStatus.success, todos: res));
    });
  }

  Future<void> getUser() async {
    emit(state.copyWith(status: DataStatus.loading));
    final result = await _getUserUseCase(NoParams());
    result.fold((error) {
      emit(
        state.copyWith(
          status: DataStatus.error,
          error: error.message,
        ),
      );
    }, (res) {
      emit(
        state.copyWith(
          status: DataStatus.success,
          users: res
        ),
      );
    });
  }
}
