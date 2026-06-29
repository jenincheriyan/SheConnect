import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Events',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2D2A3D),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Webinars, workshops, and meetups happening soon.',
            style: TextStyle(fontSize: 14, color: Color(0xFF6E6A7C)),
          ),
          const SizedBox(height: 28),
          ...events.map((e) => _EventTile(event: e)),
        ],
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  final EventItem event;

  const _EventTile({required this.event});

  @override
  Widget build(BuildContext context) {
    final isOnline = event.mode == 'Online';
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8E3F5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF7C4DFF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.event_rounded, color: Color(0xFF7C4DFF)),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFF2D2A3D),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  event.date,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF9994A8),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  event.description,
                  style: const TextStyle(
                    fontSize: 13.5,
                    color: Color(0xFF6E6A7C),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: (isOnline ? const Color(0xFF00C2A8) : const Color(0xFFFF9671))
                  .withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              event.mode,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isOnline ? const Color(0xFF00C2A8) : const Color(0xFFFF9671),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
