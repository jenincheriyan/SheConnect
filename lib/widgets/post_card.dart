import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  String _timeAgo(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 1) return 'just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  Color _colorForAuthor(String name) {
    final colors = [
      const Color(0xFF7C4DFF),
      const Color(0xFF00C2A8),
      const Color(0xFFFF9671),
      const Color(0xFFC34A86),
      const Color(0xFF4D8076),
    ];
    return colors[name.hashCode % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorForAuthor(post.author);
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8E3F5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: color.withOpacity(0.15),
            child: Text(
              post.author[0],
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      post.author,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xFF2D2A3D),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _timeAgo(post.timestamp),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9994A8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  post.content,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A4658),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
