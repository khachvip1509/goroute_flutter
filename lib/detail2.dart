import 'package:bloc_flutter/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'callback.dart';

class DetailsScreen2 extends StatelessWidget {
  final List<PersonModel> lsPerson;
  CallbackActionString? callback;

  /// Constructs a [DetailsScreen]
  DetailsScreen2({super.key, required this.lsPerson, this.callback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Column(
        children: [
          const Text('Detail2'),
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
          Text(lsPerson[0].namename ?? ""),
          Center(
            child: ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to the Home screen'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                lsPerson[2].namename = "nguyen the anh";
                return context.goNamed('details', extra: lsPerson);
              },
              child: const Text('Go back to Detail1'),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
