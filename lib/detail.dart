import 'package:bloc_flutter/person_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The details screen
class DetailsScreen extends StatelessWidget {
  final List<PersonModel> lsPerson;

  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key, required this.lsPerson});

  @override
  Widget build(BuildContext context) {
    lsPerson.sort((a, b) => a.namename!.compareTo(b.namename!));
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Column(
        children: [
          const Text('Detail1'),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: lsPerson.length,
            itemBuilder: (context, index) {
              final item = lsPerson[index];
              return ListTile(
                title: Text(item.namename ?? ""),
                subtitle: Text(item.addr ?? ""),
              );
            },
          )),
          Center(
            child: ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to the Home screen'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => context.goNamed('details2', extra: lsPerson),
              child: const Text('Go to the Detail2 screen'),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
