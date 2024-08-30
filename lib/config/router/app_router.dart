import 'package:go_router/go_router.dart';
import 'package:notapp/presentation/screens/home_screen.dart';
import 'package:notapp/presentation/screens/note_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/add-note',
      name: NoteScreen.name,
      builder: (context, state) => const NoteScreen(),
    )
  ],
);
