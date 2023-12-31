import 'package:flutter/material.dart';

class LakeScreen extends StatelessWidget {
  const LakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Lake'),
      ),
    );
  }
}
