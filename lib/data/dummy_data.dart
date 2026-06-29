// Static/dummy data for the SheConnect MVP.
// In a real app this would come from an API or database.

class Mentor {
  final String name;
  final String role;
  final String domain;
  final String experience;
  final String avatarColorHex;

  const Mentor({
    required this.name,
    required this.role,
    required this.domain,
    required this.experience,
    required this.avatarColorHex,
  });
}

class Opportunity {
  final String title;
  final String type; // Scholarship, Internship, Course, Hackathon
  final String deadline;
  final String description;
  bool saved;

  Opportunity({
    required this.title,
    required this.type,
    required this.deadline,
    required this.description,
    this.saved = false,
  });
}

class EventItem {
  final String title;
  final String date;
  final String mode; // Online / In-person
  final String description;

  const EventItem({
    required this.title,
    required this.date,
    required this.mode,
    required this.description,
  });
}

class Post {
  final String author;
  String content;
  final DateTime timestamp;

  Post({
    required this.author,
    required this.content,
    required this.timestamp,
  });
}

final List<Mentor> mentors = [
  const Mentor(
    name: 'Ananya Rao',
    role: 'AI Engineer',
    domain: 'AI',
    experience: '5 years experience',
    avatarColorHex: 'FF6B9D',
  ),
  const Mentor(
    name: 'Priya Sharma',
    role: 'Flutter Developer',
    domain: 'Flutter',
    experience: '4 years experience',
    avatarColorHex: '845EC2',
  ),
  const Mentor(
    name: 'Sandra Lee',
    role: 'Cybersecurity Analyst',
    domain: 'Cybersecurity',
    experience: '6 years experience',
    avatarColorHex: '00C2A8',
  ),
  const Mentor(
    name: 'Meera Iyer',
    role: 'Backend Engineer',
    domain: 'Web Development',
    experience: '3 years experience',
    avatarColorHex: 'FF9671',
  ),
  const Mentor(
    name: 'Lina Chen',
    role: 'Data Scientist',
    domain: 'AI',
    experience: '7 years experience',
    avatarColorHex: '4D8076',
  ),
  const Mentor(
    name: 'Fatima Khan',
    role: 'Product Manager',
    domain: 'Product',
    experience: '8 years experience',
    avatarColorHex: 'C34A86',
  ),
];

final List<Opportunity> opportunities = [
  Opportunity(
    title: 'Women in STEM Scholarship',
    type: 'Scholarship',
    deadline: 'Aug 15',
    description:
        'Full-tuition scholarship supporting women pursuing degrees in STEM fields.',
  ),
  Opportunity(
    title: 'AI Internship Program',
    type: 'Internship',
    deadline: 'Aug 30',
    description:
        'Summer internship working on real-world machine learning projects.',
  ),
  Opportunity(
    title: 'Intro to Cybersecurity Course',
    type: 'Course',
    deadline: 'Rolling enrollment',
    description: 'Free 6-week course covering security fundamentals.',
  ),
  Opportunity(
    title: 'SheHacks Hackathon',
    type: 'Hackathon',
    deadline: 'Sep 5',
    description:
        '48-hour hackathon for women and non-binary STEM students, with mentorship.',
  ),
  Opportunity(
    title: 'Flutter Developer Internship',
    type: 'Internship',
    deadline: 'Sep 12',
    description: 'Hands-on internship building cross-platform mobile apps.',
  ),
  Opportunity(
    title: 'Future Leaders Grant',
    type: 'Scholarship',
    deadline: 'Oct 1',
    description: 'Grant supporting early-career women entering tech roles.',
  ),
];

final List<EventItem> events = [
  const EventItem(
    title: 'Women in AI Webinar',
    date: 'July 15, 2026 · 6:00 PM',
    mode: 'Online',
    description:
        'Panel discussion with women leaders in AI research and industry.',
  ),
  const EventItem(
    title: 'Flutter Workshop',
    date: 'July 20, 2026 · 10:00 AM',
    mode: 'Online',
    description: 'Hands-on workshop building your first Flutter app.',
  ),
  const EventItem(
    title: 'Resume & Resume Review Night',
    date: 'July 25, 2026 · 5:00 PM',
    mode: 'Online',
    description: 'Get your resume reviewed live by industry mentors.',
  ),
  const EventItem(
    title: 'Cybersecurity Career Panel',
    date: 'Aug 2, 2026 · 4:00 PM',
    mode: 'In-person',
    description: 'Meet professionals working across security disciplines.',
  ),
];

final List<Post> communityPosts = [
  Post(
    author: 'Priya',
    content: 'How did you all prepare for technical internship interviews?',
    timestamp: DateTime.now().subtract(const Duration(hours: 5)),
  ),
  Post(
    author: 'Ananya',
    content:
        'Practice DSA consistently and build 2–3 solid portfolio projects. Mock interviews helped me a lot too!',
    timestamp: DateTime.now().subtract(const Duration(hours: 4)),
  ),
  Post(
    author: 'Sandra',
    content:
        'Also — don\'t underestimate behavioral interview prep. Practice the STAR method for your stories.',
    timestamp: DateTime.now().subtract(const Duration(hours: 3)),
  ),
  Post(
    author: 'Meera',
    content: 'Anyone have recommendations for free cloud computing courses?',
    timestamp: DateTime.now().subtract(const Duration(hours: 1)),
  ),
];

// Career assistant recommendations, keyed by track name.
final Map<String, List<String>> careerRecommendations = {
  'AI': [
    'Learn Python and core ML libraries (NumPy, pandas, scikit-learn)',
    'Join Kaggle and complete a beginner competition',
    'Build a small project applying a model to a real dataset',
    'Apply for AI/ML internships and research assistant roles',
  ],
  'Web Development': [
    'Master HTML, CSS, and JavaScript fundamentals',
    'Learn a modern framework like React or Flutter Web',
    'Build and deploy a full-stack portfolio project',
    'Apply for frontend or full-stack internships',
  ],
  'Cybersecurity': [
    'Learn networking fundamentals and Linux basics',
    'Try beginner-friendly Capture The Flag (CTF) challenges',
    'Pursue an entry-level certification (e.g. Security+)',
    'Apply for SOC analyst or cybersecurity internships',
  ],
};
