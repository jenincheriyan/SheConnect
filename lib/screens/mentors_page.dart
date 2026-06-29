import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/mentor_card.dart';

class MentorsPage extends StatefulWidget {
  const MentorsPage({super.key});

  @override
  State<MentorsPage> createState() => _MentorsPageState();
}

class _MentorsPageState extends State<MentorsPage> {
  String _query = '';
  String _domainFilter = 'All';

  List<String> get _domains =>
      ['All', ...{for (final m in mentors) m.domain}];

  @override
  Widget build(BuildContext context) {
    final filtered = mentors.where((m) {
      final matchesQuery = m.name.toLowerCase().contains(_query.toLowerCase()) ||
          m.role.toLowerCase().contains(_query.toLowerCase());
      final matchesDomain = _domainFilter == 'All' || m.domain == _domainFilter;
      return matchesQuery && matchesDomain;
    }).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mentors',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2D2A3D),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Find a mentor who matches your interests and goals.',
            style: TextStyle(fontSize: 14, color: Color(0xFF6E6A7C)),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (v) => setState(() => _query = v),
                  decoration: InputDecoration(
                    hintText: 'Search mentors by name or role...',
                    prefixIcon: const Icon(Icons.search, size: 20),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE8E3F5)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: _domains.map((d) {
              final selected = d == _domainFilter;
              return ChoiceChip(
                label: Text(d),
                selected: selected,
                onSelected: (_) => setState(() => _domainFilter = d),
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
          const SizedBox(height: 28),
          if (filtered.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Text(
                  'No mentors match your search.',
                  style: TextStyle(color: Color(0xFF9994A8)),
                ),
              ),
            )
          else
            Wrap(
              spacing: 18,
              runSpacing: 18,
              children:
                  filtered.map((m) => MentorCard(mentor: m)).toList(),
            ),
        ],
      ),
    );
  }
}
