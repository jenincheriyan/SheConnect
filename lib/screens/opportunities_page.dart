import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/opportunity_card.dart';

class OpportunitiesPage extends StatefulWidget {
  const OpportunitiesPage({super.key});

  @override
  State<OpportunitiesPage> createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage> {
  String _category = 'All';
  bool _savedOnly = false;

  final List<String> _categories = const [
    'All',
    'Scholarship',
    'Internship',
    'Course',
    'Hackathon',
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = opportunities.where((o) {
      final matchesCategory = _category == 'All' || o.type == _category;
      final matchesSaved = !_savedOnly || o.saved;
      return matchesCategory && matchesSaved;
    }).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Opportunities',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2D2A3D),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Scholarships, internships, courses, and hackathons curated for you.',
            style: TextStyle(fontSize: 14, color: Color(0xFF6E6A7C)),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8,
                  children: _categories.map((c) {
                    final selected = c == _category;
                    return ChoiceChip(
                      label: Text(c),
                      selected: selected,
                      onSelected: (_) => setState(() => _category = c),
                      selectedColor: const Color(0xFF7C4DFF),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : const Color(0xFF6E6A7C),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      side: const BorderSide(color: Color(0xFFE8E3F5)),
                    );
                  }).toList(),
                ),
              ),
              FilterChip(
                label: const Text('Saved only'),
                selected: _savedOnly,
                onSelected: (v) => setState(() => _savedOnly = v),
                avatar: Icon(
                  Icons.bookmark,
                  size: 16,
                  color: _savedOnly ? Colors.white : const Color(0xFF9994A8),
                ),
                selectedColor: const Color(0xFF7C4DFF),
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: _savedOnly ? Colors.white : const Color(0xFF6E6A7C),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                side: const BorderSide(color: Color(0xFFE8E3F5)),
              ),
            ],
          ),
          const SizedBox(height: 28),
          if (filtered.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Text(
                  'Nothing here yet.',
                  style: TextStyle(color: Color(0xFF9994A8)),
                ),
              ),
            )
          else
            Wrap(
              spacing: 18,
              runSpacing: 18,
              children: filtered.map((o) {
                return OpportunityCard(
                  opportunity: o,
                  onToggleSaved: () => setState(() => o.saved = !o.saved),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
