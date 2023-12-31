import 'package:flutter/material.dart';
import 'package:swan/chats/chats.dart';
import 'package:swan/lake/lake.dart';
import 'package:swan/profile/profile.dart';

class SwanApp extends StatelessWidget {
  const SwanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swan',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexedStack(
      index: 0,
      children: <Widget>[
        ChatsScreen(),
        LakeScreen(),
        ProfileScreen(),
      ],
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Chats',
          icon: Icon(Icons.chat),
        ),
        BottomNavigationBarItem(
          label: 'Lake',
          icon: Icon(Icons.water),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
