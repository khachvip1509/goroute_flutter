import 'package:bloc_flutter/person_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          name: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return DetailsScreen(
              key0: state.extra as PersonModel,
              key1: state.queryParameters["key1"] ?? "",
              key2: state.queryParameters["key2"] ?? "",
            );
          },
        ),
      ],
    ),
  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed('details',
              extra: PersonModel(name: "Ken", age: 33, addr: "Hà Nội"),
              queryParameters: {"key1": "KAKAKAK", "key2": "kaka2"}),
          child: const Text('Go to the Details screen'),
        ),
      ),
    );
  }
}

/// The details screen
class DetailsScreen extends StatelessWidget {
  final PersonModel key0;
  final String key1;
  final String key2;

  /// Constructs a [DetailsScreen]
  const DetailsScreen(
      {super.key, required this.key0, required this.key1, required this.key2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Column(
        children: [
          Text(key0.name ?? ""),
          Text(key0.age.toString() ?? "0"),
          Text(key0.addr ?? ""),
          Text(key1),
          Text(key2),
          Center(
            child: ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to the Home screen'),
            ),
          )
        ],
      ),
    );
  }
}
