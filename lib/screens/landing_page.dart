import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final VoidCallback onGetStarted;

  const LandingPage({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FC),
      body: Stack(
        children: [
          // Decorative background blobs
          Positioned(
            top: -80,
            right: -80,
            child: _Blob(color: const Color(0xFF7C4DFF).withOpacity(0.12), size: 320),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: _Blob(color: const Color(0xFF00C2A8).withOpacity(0.12), size: 280),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.diversity_2_rounded,
                          color: Color(0xFF7C4DFF), size: 28),
                      const SizedBox(width: 10),
                      const Text(
                        'SheConnect',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF2D2A3D),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: onGetStarted,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFF2D2A3D),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 640),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF7C4DFF).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                '🚀  Built for women in STEM',
                                style: TextStyle(
                                  color: Color(0xFF7C4DFF),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'Connect • Learn • Grow',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF2D2A3D),
                                height: 1.15,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'A community where women and underrepresented STEM '
                              'students find mentors, opportunities, events, and '
                              'peer support — all in one place.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF6E6A7C),
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 36),
                            ElevatedButton(
                              onPressed: onGetStarted,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF7C4DFF),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 36, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Get Started'),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward_rounded, size: 18),
                                ],
                              ),
                            ),
                            const SizedBox(height: 56),
                            Wrap(
                              spacing: 32,
                              runSpacing: 16,
                              alignment: WrapAlignment.center,
                              children: const [
                                _StatPill(label: 'Mentors', value: '50+'),
                                _StatPill(label: 'Opportunities', value: '120+'),
                                _StatPill(label: 'Members', value: '2,400+'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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

class _StatPill extends StatelessWidget {
  final String label;
  final String value;

  const _StatPill({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
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
    );
  }
}

class _Blob extends StatelessWidget {
  final Color color;
  final double size;

  const _Blob({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
