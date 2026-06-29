import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class OpportunityCard extends StatefulWidget {
  final Opportunity opportunity;
  final VoidCallback onToggleSaved;

  const OpportunityCard({
    super.key,
    required this.opportunity,
    required this.onToggleSaved,
  });

  @override
  State<OpportunityCard> createState() => _OpportunityCardState();
}

class _OpportunityCardState extends State<OpportunityCard> {
  Color get _typeColor {
    switch (widget.opportunity.type) {
      case 'Scholarship':
        return const Color(0xFF00C2A8);
      case 'Internship':
        return const Color(0xFF7C4DFF);
      case 'Course':
        return const Color(0xFFFF9671);
      case 'Hackathon':
        return const Color(0xFFC34A86);
      default:
        return const Color(0xFF6E6A7C);
    }
  }

  @override
  Widget build(BuildContext context) {
    final op = widget.opportunity;
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8E3F5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _typeColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  op.type,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: _typeColor,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: widget.onToggleSaved,
                icon: Icon(
                  op.saved ? Icons.bookmark : Icons.bookmark_border,
                  color: op.saved ? const Color(0xFF7C4DFF) : const Color(0xFF9994A8),
                ),
                tooltip: op.saved ? 'Unsave' : 'Save',
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            op.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D2A3D),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            op.description,
            style: const TextStyle(fontSize: 13, color: Color(0xFF6E6A7C)),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(Icons.schedule, size: 14, color: Color(0xFF9994A8)),
              const SizedBox(width: 6),
              Text(
                'Deadline: ${op.deadline}',
                style: const TextStyle(fontSize: 12, color: Color(0xFF9994A8)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
