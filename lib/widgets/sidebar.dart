import 'package:flutter/material.dart';

class SidebarItem {
  final IconData icon;
  final String label;

  const SidebarItem({required this.icon, required this.label});
}

const sidebarItems = [
  SidebarItem(icon: Icons.dashboard_rounded, label: 'Dashboard'),
  SidebarItem(icon: Icons.people_alt_rounded, label: 'Mentors'),
  SidebarItem(icon: Icons.work_rounded, label: 'Opportunities'),
  SidebarItem(icon: Icons.event_rounded, label: 'Events'),
  SidebarItem(icon: Icons.forum_rounded, label: 'Community'),
  SidebarItem(icon: Icons.auto_awesome_rounded, label: 'Career Assistant'),
];

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const Sidebar({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: const Color(0xFF1F1B2E),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 28, 24, 28),
            child: Row(
              children: [
                Icon(Icons.diversity_2_rounded, color: Color(0xFF7C4DFF), size: 26),
                SizedBox(width: 10),
                Text(
                  'SheConnect',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          for (int i = 0; i < sidebarItems.length; i++)
            _NavTile(
              item: sidebarItems[i],
              selected: i == selectedIndex,
              onTap: () => onSelect(i),
            ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFF7C4DFF),
                  child: Text('J', style: TextStyle(color: Colors.white, fontSize: 13)),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Jenin',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                    overflow: TextOverflow.ellipsis,
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

class _NavTile extends StatelessWidget {
  final SidebarItem item;
  final bool selected;
  final VoidCallback onTap;

  const _NavTile({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      child: Material(
        color: selected ? const Color(0xFF7C4DFF).withOpacity(0.18) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  size: 19,
                  color: selected ? const Color(0xFF7C4DFF) : Colors.white60,
                ),
                const SizedBox(width: 12),
                Text(
                  item.label,
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.white60,
                    fontSize: 13.5,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
