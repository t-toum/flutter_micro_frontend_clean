import 'package:base_app/src/data/datasources/base_app_remote_datasource.dart';
import 'package:base_app/src/data/datasources/clients/rest_client.dart';
import 'package:base_app/src/data/repositories/base_app_repository_impl.dart';
import 'package:base_app/src/domain/repositories/base_app_repository.dart';
import 'package:base_app/src/domain/usecases/get_user_usecase.dart';
import 'package:base_app/src/presentation/cubit/home_cubit.dart';
import 'package:base_app/src/presentation/pages/home_page.dart';
import 'package:base_app/src/presentation/pages/users_page.dart';
import 'package:shared/shared.dart';

class BaseAppModule extends Module {
  @override
  List<Module> get imports => [
        SharedModule(),
      ];

  @override
  void binds(Injector i) {
    i.addInstance<Dio>(
        Dio(BaseOptions(baseUrl: "https://fake-json-api.mock.beeceptor.com")));
    i.addInstance<RestClient>(RestClient(i.get<Dio>()));
    i.addLazySingleton<BaseAppRemoteDatasource>(
      () => BaseAppRemoteDatasourceImpl(i.get<RestClient>()),
    );
    i.addLazySingleton<BaseAppRepository>(
      () => BaseAppRepositoryImpl(i.get<BaseAppRemoteDatasource>()),
    );
    i.addSingleton<GetUserUseCase>(
        () => GetUserUseCase(i.get<BaseAppRepository>()));
    i.add<HomeCubit>(
      () => HomeCubit(
        getUserUseCase: i.get<GetUserUseCase>(),
        getTodoUseCase: i.get<GetTodoUseCase>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => BlocProvider<HomeCubit>(
        create: (context) => Modular.get<HomeCubit>()..getTodo(),
        child: const HomePage(),
      ),
    );
    r.child(
      "/user",
      child: (_) => BlocProvider<HomeCubit>(
        create: (context) => Modular.get<HomeCubit>()..getUser(),
        child: const UsersPage(),
      ),
    );
  }
}
