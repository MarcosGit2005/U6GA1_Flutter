import 'package:u3ga1_marcosrubio/presentation/screens/wrapper.dart';

import '../../presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'wrapper',
      path: '/', // Ruta raíz o login
      builder: (context, state) => const Wrapper(),
    ),
    GoRoute(
      name: 'register',
      path: '/register', // Ruta raíz o login
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      name: 'provinces',
      path: '/provinces',
      builder: (context, state) => ProvinciasScreen(),
    ),
    GoRoute(
      name: 'counties',
      path: '/counties/:idProvince',
      builder: (context, state) {
        final int idProvince = int.parse(state.pathParameters['idProvince']!);
        return ComarquesScreen(idProvince: idProvince);
      }
    ),
    GoRoute(
      name: 'counties_info1',
      path: '/counties_info1/:idProvince/:idComarca',
      builder: (context, state) {
        final int idProvince = int.parse(state.pathParameters['idProvince']!);
        final int idComarca = int.parse(state.pathParameters['idComarca']!);
        return ComarcaInfo(idProvince: idProvince, idComarca: idComarca,);
      }
    ),
  ],
);
