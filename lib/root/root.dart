import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:swan/chats/chats.dart';
import 'package:swan/lake/lake.dart';
import 'package:swan/onboarding/onboarding.dart';
import 'package:swan/profile/profile.dart';

class SwanApp extends HookWidget {
  const SwanApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedIn = useState(true);

    return MaterialApp(
      title: 'Swan',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: loggedIn.value ? const MainScreen() : const OnboardingScreen(),
    );
  }
}

class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageIndex = useState(0);

    return Scaffold(
      body: _Pages(pageIndex: pageIndex),
      bottomNavigationBar: _BottomNavigationBar(pageIndex: pageIndex),
    );
  }
}

class _Pages extends HookWidget {
  const _Pages({super.key, required this.pageIndex});

  final ValueNotifier<int> pageIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: pageIndex.value,
      children: const <Widget>[
        ChatsScreen(),
        LakeScreen(),
        ProfileScreen(),
      ],
    );
  }
}

class _BottomNavigationBar extends HookWidget {
  const _BottomNavigationBar({super.key, required this.pageIndex});

  final ValueNotifier<int> pageIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: pageIndex.value,
      type: BottomNavigationBarType.fixed,
      onTap: (newIndex) => pageIndex.value = newIndex,
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
