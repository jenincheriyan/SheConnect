import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/post_card.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final TextEditingController _controller = TextEditingController();

  void _submitPost() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      communityPosts.add(
        Post(author: 'You', content: text, timestamp: DateTime.now()),
      );
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sortedPosts = [...communityPosts]
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Community',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2D2A3D),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Ask questions, share advice, and support each other.',
            style: TextStyle(fontSize: 14, color: Color(0xFF6E6A7C)),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE8E3F5)),
            ),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Share something with the community...',
                    border: InputBorder.none,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _submitPost,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7C4DFF),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Post'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          ...sortedPosts.map((p) => PostCard(post: p)),
        ],
      ),
    );
  }
}
