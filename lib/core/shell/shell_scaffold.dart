import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellScaffold extends StatelessWidget {
  final StatefulNavigationShell child;
  const ShellScaffold({super.key, required this.child});

  void _goDestination(int index) {
    child.goBranch(index, initialLocation: index == child.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: child.currentIndex,
        onDestinationSelected: _goDestination,

        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Feed"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: SafeArea(child: child),
    );
  }
}
