import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TaskListScreen extends StatefulWidget {
  final VoidCallback onTaskSelected;

  const TaskListScreen({super.key, required this.onTaskSelected});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  bool isOngoing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.school, color: AppTheme.primary),
            const SizedBox(width: 8),
            Text(
              'Classroom',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppTheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          if (MediaQuery.of(context).size.width > 600)
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search, size: 20),
              label: const Text('Search'),
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.onSurfaceVariant,
              ),
            ),
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppTheme.surfaceContainerHigh,
              backgroundImage: const NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuD6u5ohAYPVDYCOfF8KlY04Iq1VrLTLLaD9PmpYJjw-MjJ4keHBA_xQFCyaInsmrZJcgK8IzGkzL7MMW1WS5rEAmuQAHl08xbcSgKE9J1UoGFTEYWMUYB429OlozmDCX0kaASPJkAgRdmEg8v2-RR90-a5ya56pJ13-o7X_aOKGBzfQEUeLdt6zMMeJwWPE-8XTu8VulJhfVopVNK3ef-CKyEXvFpE5_btkGTEHVl1Ramac2yEvf9ur-uJE7Z_5jhuAgJTWzn84TsU'),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppTheme.outlineVariant,
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header & Filter
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.end,
              spacing: 16,
              runSpacing: 16,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Academic Year 2024',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppTheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Assignments',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildFilterButton('Ongoing', isOngoing, () {
                        setState(() {
                          isOngoing = true;
                        });
                      }),
                      _buildFilterButton('Completed', !isOngoing, () {
                        setState(() {
                          isOngoing = false;
                        });
                      }),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Task Grid
            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth > 800 ? 2 : 1;
                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: constraints.maxWidth > 800 ? 1.5 : 1.2,
                  children: [
                    TaskCard(
                      course: 'Advanced Physics',
                      title: 'Quantum Mechanics Lab Report',
                      description: 'Analyze the results from the double-slit experiment and document wave-particle duality observations.',
                      dueDate: 'Due Oct 24, 11:59 PM',
                      timeRemaining: '2 days remaining',
                      timeIcon: Icons.schedule,
                      timeColor: AppTheme.error,
                      courseIcon: Icons.more_vert,
                      onTap: widget.onTaskSelected,
                    ),
                    TaskCard(
                      course: 'World History',
                      title: 'The Silk Road Trade Impact',
                      description: 'Comprehensive essay on how the Silk Road influenced cultural diffusion between the East and West during the Han Dynasty.',
                      dueDate: 'Due Today',
                      timeRemaining: '5 hours remaining',
                      timeIcon: Icons.bolt,
                      timeColor: AppTheme.primary,
                      courseIcon: Icons.push_pin,
                      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB76h6lfdpapZ56ni1HG78IFkOpCV0uAUXW40d0klcV-mEawCmxsQGCNXNGX8SsPJawuqiuqcM7AuEIoLk5olAnfM7rD_adtvFrl919YUK1UHJ8jbtrgT9jVpPATOgLVY5yFidQM4x7cLIrnmpEohzXBsD8YpJB6pX-7AkurMXFygsaSmtsauiKDOQfJlVF00Wl8RV7nb6enxCkqWxIoJDvSkx3eduQUTo4Qo6Iwbi5uyuYABmZnFwYD7pkhhh4ccUPVretS3xvxr8',
                      onTap: widget.onTaskSelected,
                    ),
                    TaskCard(
                      course: 'Modern Literature',
                      title: 'Stream of Consciousness Analysis',
                      description: 'Compare James Joyce\'s technique with Virginia Woolf\'s in \'Mrs. Dalloway\'.',
                      dueDate: 'Due Oct 31',
                      timeRemaining: 'Next Week',
                      timeIcon: Icons.calendar_today,
                      timeColor: AppTheme.onSurfaceVariant,
                      courseIcon: Icons.link,
                      onTap: widget.onTaskSelected,
                    ),
                    TaskCard(
                      course: 'Calculus BC',
                      title: 'Integral Applications Set',
                      description: 'Complete problems 14 through 42 regarding volumes of revolution and arc length calculations.',
                      dueDate: 'Due Tomorrow',
                      timeRemaining: '12 hours remaining',
                      timeIcon: Icons.priority_high,
                      timeColor: AppTheme.error,
                      courseIcon: Icons.description,
                      onTap: widget.onTaskSelected,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.surface : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ]
              : null,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: isSelected ? AppTheme.primary : AppTheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String course;
  final String title;
  final String description;
  final String dueDate;
  final String timeRemaining;
  final IconData timeIcon;
  final Color timeColor;
  final IconData courseIcon;
  final String? imageUrl;
  final VoidCallback onTap;

  const TaskCard({
    super.key,
    required this.course,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.timeRemaining,
    required this.timeIcon,
    required this.timeColor,
    required this.courseIcon,
    this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (imageUrl != null)
              Expanded(
                flex: 3,
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            Expanded(
              flex: imageUrl != null ? 4 : 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          course.toUpperCase(),
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppTheme.onSurfaceVariant,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Icon(courseIcon, size: 20, color: AppTheme.onSurfaceVariant),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppTheme.primary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Divider(height: 1),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(timeIcon, size: 18, color: timeColor),
                            const SizedBox(width: 4),
                            Text(
                              timeRemaining,
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: timeColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          dueDate,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppTheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
