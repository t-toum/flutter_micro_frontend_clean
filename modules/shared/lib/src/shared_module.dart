
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/src/core/clients/base_rest_client.dart';
import 'package:shared/src/data/datasources/base_app_remote_datasource.dart';
import 'package:shared/src/data/repositories/base_app_repository_impl.dart';
import 'package:shared/src/domain/repositories/base_app_repository.dart';
import 'package:shared/src/domain/usecases/get_todo_usecase.dart';

class SharedModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<Dio>(
      () => Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com")),
    );
    i.addLazySingleton<BaseRestClient>(
      () => BaseRestClient(i.get<Dio>()),
    );
    i.addLazySingleton<BaseAppRemoteDatasource>(
      () => BaseAppRemoteDatasourceImpl(i.get<BaseRestClient>()),
    );
    i.addLazySingleton<BaseAppRepository>(
      () => BaseAppRepositoryImpl(i.get<BaseAppRemoteDatasource>()),
    );
    i.add<GetTodoUseCase>(
      () => GetTodoUseCase(i.get<BaseAppRepository>()),
    );
  }
}
