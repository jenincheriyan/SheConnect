import 'package:flutter/material.dart';
import 'screens/landing_page.dart';
import 'screens/dashboard.dart';
import 'screens/mentors_page.dart';
import 'screens/opportunities_page.dart';
import 'screens/events_page.dart';
import 'screens/community_page.dart';
import 'screens/career_assistant_page.dart';
import 'widgets/sidebar.dart';

void main() {
  runApp(const SheConnectApp());
}

class SheConnectApp extends StatelessWidget {
  const SheConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SheConnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Segoe UI',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7C4DFF),
          primary: const Color(0xFF7C4DFF),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F5FC),
      ),
      home: const RootRouter(),
    );
  }
}

/// Handles the top-level flow: Landing page -> Main app shell.
class RootRouter extends StatefulWidget {
  const RootRouter({super.key});

  @override
  State<RootRouter> createState() => _RootRouterState();
}

class _RootRouterState extends State<RootRouter> {
  bool _enteredApp = false;

  @override
  Widget build(BuildContext context) {
    if (!_enteredApp) {
      return LandingPage(
        onGetStarted: () => setState(() => _enteredApp = true),
      );
    }
    return const AppShell();
  }
}

/// Main app shell: persistent sidebar + switchable page content.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  static const _titles = [
    'Dashboard',
    'Mentors',
    'Opportunities',
    'Events',
    'Community',
    'Career Assistant',
  ];

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return DashboardHome(onNavigate: (i) => setState(() => _selectedIndex = i));
      case 1:
        return const MentorsPage();
      case 2:
        return const OpportunitiesPage();
      case 3:
        return const EventsPage();
      case 4:
        return const CommunityPage();
      case 5:
        return const CareerAssistantPage();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 800;

          if (isNarrow) {
            // Mobile/narrow layout: drawer-based navigation.
            return Scaffold(
              backgroundColor: const Color(0xFFF7F5FC),
              appBar: AppBar(
                backgroundColor: const Color(0xFF1F1B2E),
                title: Text(_titles[_selectedIndex],
                    style: const TextStyle(color: Colors.white)),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              drawer: Drawer(
                child: Sidebar(
                  selectedIndex: _selectedIndex,
                  onSelect: (i) {
                    setState(() => _selectedIndex = i);
                    Navigator.pop(context);
                  },
                ),
              ),
              body: _buildPage(_selectedIndex),
            );
          }

          // Wide/desktop layout: persistent sidebar.
          return Row(
            children: [
              Sidebar(
                selectedIndex: _selectedIndex,
                onSelect: (i) => setState(() => _selectedIndex = i),
              ),
              Expanded(
                child: Container(
                  color: const Color(0xFFF7F5FC),
                  child: _buildPage(_selectedIndex),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
