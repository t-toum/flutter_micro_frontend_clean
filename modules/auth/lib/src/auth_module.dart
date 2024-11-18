import 'package:auth/src/presentation/pages/login_page.dart';
import 'package:shared/shared.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LoginPage());
  }
}