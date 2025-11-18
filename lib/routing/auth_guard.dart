import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';

class AuthGuard {
  static String? checkLogin(BuildContext context, GoRouterState state) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return RoutePaths.login; // redirect to login
    }

    return null; // allow access
  }
}
