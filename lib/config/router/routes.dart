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
      path: '/counties/:provinceName',
      builder: (context, state) {
        final String provinceName = state.pathParameters['provinceName']!;
        return ComarquesScreen(provinceName: provinceName);
      }
    ),
    GoRoute(
      name: 'counties_info',
      path: '/counties_info/:provinceName/:comarcaName',
      builder: (context, state) {
        final String provinceName = state.pathParameters['provinceName']!;
        final String comarcaName = state.pathParameters['comarcaName']!;
        return ComarcaInfo(provinceName: provinceName, comarcaName: comarcaName,);
      }
    ),
  ],
);
