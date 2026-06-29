import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MentorCard extends StatefulWidget {
  final Mentor mentor;

  const MentorCard({super.key, required this.mentor});

  @override
  State<MentorCard> createState() => _MentorCardState();
}

class _MentorCardState extends State<MentorCard> {
  bool _connected = false;

  Color get _avatarColor =>
      Color(int.parse('FF${widget.mentor.avatarColorHex}', radix: 16));

  @override
  Widget build(BuildContext context) {
    final mentor = widget.mentor;
    return Container(
      width: 240,
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
          CircleAvatar(
            radius: 28,
            backgroundColor: _avatarColor.withOpacity(0.15),
            child: Text(
              mentor.name[0],
              style: TextStyle(
                color: _avatarColor,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            mentor.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2D2A3D),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            mentor.role,
            style: const TextStyle(fontSize: 13, color: Color(0xFF6E6A7C)),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: _avatarColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              mentor.domain,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: _avatarColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            mentor.experience,
            style: const TextStyle(fontSize: 12, color: Color(0xFF9994A8)),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() => _connected = !_connected);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      _connected
                          ? 'Connection request sent to ${mentor.name}!'
                          : 'Connection removed.',
                    ),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _connected ? const Color(0xFFEDE9F7) : const Color(0xFF7C4DFF),
                foregroundColor:
                    _connected ? const Color(0xFF7C4DFF) : Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(_connected ? 'Requested' : 'Connect'),
            ),
          ),
        ],
      ),
    );
  }
}
