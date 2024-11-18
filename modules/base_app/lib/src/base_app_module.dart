import 'package:base_app/src/presentation/cubit/home_cubit.dart';
import 'package:base_app/src/presentation/pages/home_page.dart';
import 'package:shared/shared.dart';

class BaseAppModule extends Module {

  @override
  List<Module> get imports => [
    SharedModule(),
  ]; 
  
  @override
  void binds(Injector i) {
    i.addSingleton<Dio>(() => Dio(
      BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com"
      )
    ));

    i.add<HomeCubit>(HomeCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => BlocProvider<HomeCubit>(
      create: (context) => Modular.get<HomeCubit>()..getTodo(),
      child: const HomePage(),
    ));
  }
}
