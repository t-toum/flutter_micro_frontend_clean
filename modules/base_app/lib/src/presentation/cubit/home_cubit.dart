import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';
part 'home_state.dart';
part 'home_cubit.freezed.dart';
class HomeCubit extends Cubit<HomeState> {
  final GetTodoUseCase _getTodoUseCase;
  HomeCubit(this._getTodoUseCase) : super(const HomeState());

  Future<void> getTodo() async {
    emit(state.copyWith(
      status: DataStatus.loading
    ));
    final result = await _getTodoUseCase(NoParams());
    result.fold((error){
      emit(state.copyWith(
        status: DataStatus.error,
        error: error.message
      ));
    }, (res){
      emit(state.copyWith(
        status: DataStatus.success,
        todos: res
      ));
    });
  }
}