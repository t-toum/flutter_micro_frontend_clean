part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(DataStatus.initial) DataStatus status,
    String? error,
    @Default([]) List<Todo> todos,
    @Default([]) List<User> users,
  }) = _HomeState;
}
