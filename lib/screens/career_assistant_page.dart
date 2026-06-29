import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class CareerAssistantPage extends StatefulWidget {
  const CareerAssistantPage({super.key});

  @override
  State<CareerAssistantPage> createState() => _CareerAssistantPageState();
}

class _CareerAssistantPageState extends State<CareerAssistantPage> {
  String? _selectedTrack;

  @override
  Widget build(BuildContext context) {
    final tracks = careerRecommendations.keys.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome_rounded, color: Color(0xFF7C4DFF)),
              const SizedBox(width: 10),
              const Text(
                'AI Career Assistant',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2D2A3D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'Pick a track and get a personalized starter roadmap.',
            style: TextStyle(fontSize: 14, color: Color(0xFF6E6A7C)),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: tracks.map((t) {
              final selected = t == _selectedTrack;
              return ChoiceChip(
                label: Text(t),
                selected: selected,
                onSelected: (_) => setState(() => _selectedTrack = t),
                selectedColor: const Color(0xFF7C4DFF),
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: selected ? Colors.white : const Color(0xFF6E6A7C),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                side: const BorderSide(color: Color(0xFFE8E3F5)),
              );
            }).toList(),
          ),
          const SizedBox(height: 28),
          if (_selectedTrack == null)
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE8E3F5)),
              ),
              child: const Center(
                child: Text(
                  'Select a track above to see your recommendations.',
                  style: TextStyle(color: Color(0xFF9994A8)),
                ),
              ),
            )
          else
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Container(
                key: ValueKey(_selectedTrack),
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE8E3F5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recommended for $_selectedTrack',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2D2A3D),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...careerRecommendations[_selectedTrack]!.map(
                      (rec) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.check_circle_rounded,
                                color: Color(0xFF00C2A8), size: 20),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                rec,
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  color: Color(0xFF4A4658),
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
