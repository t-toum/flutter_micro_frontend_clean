import 'package:shared/shared.dart';

class SharedModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<Dio>(
      () => Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com")),
    );
  }
}
