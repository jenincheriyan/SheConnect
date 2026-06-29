import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class DashboardHome extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const DashboardHome({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final savedCount = opportunities.where((o) => o.saved).length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome back, Jenin 👋',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2D2A3D),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Here\'s what\'s happening in your community today.',
            style: TextStyle(fontSize: 14, color: Color(0xFF6E6A7C)),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: [
              _StatCard(
                icon: Icons.people_alt_rounded,
                label: 'Mentors Available',
                value: '${mentors.length}',
                color: const Color(0xFF7C4DFF),
                onTap: () => onNavigate(1),
              ),
              _StatCard(
                icon: Icons.work_rounded,
                label: 'Open Opportunities',
                value: '${opportunities.length}',
                color: const Color(0xFF00C2A8),
                onTap: () => onNavigate(2),
              ),
              _StatCard(
                icon: Icons.event_rounded,
                label: 'Upcoming Events',
                value: '${events.length}',
                color: const Color(0xFFFF9671),
                onTap: () => onNavigate(3),
              ),
              _StatCard(
                icon: Icons.bookmark_rounded,
                label: 'Saved by You',
                value: '$savedCount',
                color: const Color(0xFFC34A86),
                onTap: () => onNavigate(2),
              ),
            ],
          ),
          const SizedBox(height: 36),
          const Text(
            'Next up',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D2A3D),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE8E3F5)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF9671).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.event_rounded,
                      color: Color(0xFFFF9671)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        events.first.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xFF2D2A3D),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${events.first.date} · ${events.first.mode}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF9994A8),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => onNavigate(3),
                  child: const Text('View all'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final VoidCallback onTap;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 220,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE8E3F5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(height: 14),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2D2A3D),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: const TextStyle(fontSize: 13, color: Color(0xFF9994A8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
