import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'task_list_screen.dart';
import 'task_details_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;
  bool _showingTaskDetails = false;

  void _onTaskSelected() {
    setState(() {
      _showingTaskDetails = true;
    });
  }

  void _onTaskDetailsBack() {
    setState(() {
      _showingTaskDetails = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showingTaskDetails && _currentIndex == 1) {
      return TaskDetailsScreen(onBack: _onTaskDetailsBack);
    }

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const DashboardScreen(),
          TaskListScreen(onTaskSelected: _onTaskSelected),
          const Center(child: Text('Profile Screen Placeholder')),
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width <= 600
          ? BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                  if (index != 1) {
                    _showingTaskDetails = false;
                  }
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.task_alt_outlined),
                  activeIcon: Icon(Icons.task_alt),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            )
          : null, // Sidebar handles navigation on larger screens (or Top App Bar)
    );
  }
}
