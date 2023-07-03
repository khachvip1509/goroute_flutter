import 'package:bloc_flutter/person_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'detail.dart';
import 'detail2.dart';

void main() => runApp(const MyApp());

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'details',
            name: 'details',
            builder: (BuildContext context, GoRouterState state) {
              return DetailsScreen(
                lsPerson: state.extra as List<PersonModel>,
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'details2',
                name: 'details2',
                builder: (BuildContext context, GoRouterState state) {
                  return DetailsScreen2(
                    lsPerson: state.extra as List<PersonModel>,
                  );
                },
              ),
            ]),
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
  HomeScreen({super.key});
  List<PersonModel> LsPerson = [
    PersonModel(namename: "ghi", age: 33, addr: "Hà Nội1"),
    PersonModel(namename: "def", age: 34, addr: "Hà Nội2"),
    PersonModel(namename: "abc", age: 35, addr: "Hà Nội3"),
    PersonModel(namename: "jlm", age: 36, addr: "Hà Nội4"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              return context.goNamed('details',
                  extra: LsPerson,
                  queryParameters: {"key1": "KAKAKAK", "key2": "kaka2"});
            },
            child: const Text('Go to the Details screen')),
      ),
    );
  }
}
