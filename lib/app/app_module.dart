import 'package:auth/auth.dart';
import 'package:base_app/base_app.dart';
import 'package:shared/shared.dart';

class AppModule implements Module {
  @override
  void binds(Injector i) {}

  @override
  void exportedBinds(Injector i) {}

  @override
  List<Module> get imports => [
        BaseAppModule(),
        AuthModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.module("/", module: BaseAppModule());
    r.module('/login', module: AuthModule());
  }
}
