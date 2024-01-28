import 'package:go_router/go_router.dart';
import 'package:notapp/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    )
  ],
);
