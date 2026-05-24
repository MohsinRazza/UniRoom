import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TaskDetailsScreen extends StatelessWidget {
  final VoidCallback onBack;

  const TaskDetailsScreen({super.key, required this.onBack});

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
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppTheme.surfaceContainerHigh,
              backgroundImage: const NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuB9ldHPGq4AkeWYSILtZn1ZwMYee0B350xVarM5jSckQ3NmBRQxe7eH1YR_t4fHf01D9kIXaWmyD8fRqOyaY3UQSotL72BxwOJQWJkKHSQdVL2hLGxdN1r7xPreSW8AE_CrfZhRDlJysDr3u_OSUHvV5CIcRc0s6k8BHXOtw5ulA1p0zJiCOoZ-YwOOxAY2cBFm7sIsyCJLDFq3iaZqd37qTsEguCLlXrrbqvOnMhWpmIGE5SQuGmtTvf38qcYEFG_ss-4Ec0a8XF8'),
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
            // Back Action
            InkWell(
              onTap: onBack,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_back, size: 18, color: AppTheme.onSurfaceVariant),
                    const SizedBox(width: 4),
                    Text(
                      'Back to Assignments',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppTheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildMainContent(context),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 1,
                        child: _buildSidebarContent(context),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMainContent(context),
                      const SizedBox(height: 24),
                      _buildSidebarContent(context),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tags
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'ECONOMICS 101',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.grey[600],
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.errorContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'DUE IN 2 DAYS',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppTheme.onErrorContainer,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'The Impact of Fiscal Policy on Emerging Markets',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: AppTheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Analyze how changes in government spending and taxation affect the growth trajectory of three specific emerging economies post-2020.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppTheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 24),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAjLkDFRfmSTqI2l1l1bJbzM4f5VXG8OT1ZvtNgbI2RAQZe4I8ECVmYoPZA3Lvm3Fr58fhlrxbaE9zzbbyW-tp5Ce-bzE226Y4bgDTQFl03yB7dTwLOMbFaKbnQE5ym25_oZ80DNLNWou0ql_j1zfrUoKppwf6kmJpRBcZ9jx3Hve2I2QId-WPfxAJ861-v0n_UxANP3-3-pnZaiiroBXI7pkfcD6STRY68fboAfdlOzvUcbWQm4TIeW8TcrrtjHTiqUooo4al0Q3I',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.surfaceContainerLowest,
            border: Border.all(color: AppTheme.outlineVariant),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assignment Instructions',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'In this assignment, students are expected to synthesize macroeconomic theory with real-world data points. You must choose three countries from the IMF\'s list of Emerging Market and Developing Economies.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              // Simulating bullets
              _buildBullet(context, 'Minimum 2,500 words excluding bibliography.'),
              _buildBullet(context, 'Include at least four comparative data visualizations (charts/graphs).'),
              _buildBullet(context, 'Cite sources using APA 7th Edition style.'),
              _buildBullet(context, 'Final submission must be in PDF format.'),
              const SizedBox(height: 16),
              const Divider(color: AppTheme.surfaceContainerHigh),
              const SizedBox(height: 16),
              Text(
                'For further clarification on the grading rubric, please refer to the course syllabus shared in the first week.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBullet(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: AppTheme.onSurfaceVariant)),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarContent(BuildContext context) {
    return Column(
      children: [
        // Deadline
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            border: Border.all(color: AppTheme.outlineVariant),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: AppTheme.outline, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'DEADLINE',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppTheme.outline,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Friday, Oct 27',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primary,
                ),
              ),
              Text(
                '11:59 PM (EST)',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.outline,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: const LinearProgressIndicator(
                  value: 0.75,
                  backgroundColor: AppTheme.surfaceContainerLow,
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
                  minHeight: 4,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        // Submission
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.surfaceContainerLowest,
            border: Border.all(color: AppTheme.outlineVariant),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Your Work',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceContainerLow,
                  border: Border.all(color: AppTheme.outlineVariant, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.cloud_upload, size: 32, color: AppTheme.outline),
                    const SizedBox(height: 8),
                    Text(
                      'Drag & drop files here',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppTheme.primary,
                      ),
                    ),
                    Text(
                      'or click to browse from device',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.outline,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: AppTheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Submit to CR',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppTheme.onPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.send, size: 18),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Submitted work will be checked for plagiarism.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.outline,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        // Instructor Card
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.surfaceContainerLow,
            border: Border.all(color: AppTheme.surfaceContainerHigh),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDI-PHz_lGMmuG4KViRqIN2jfu7bt2zXpnCutSfuFaFSIPbpR1kizNAOT3ILOF4vCBYxiJZpVWM4sJnuraPgqnF72CyI5btMmZwTQ8_8Bn1QSXR7IyzB5FyYWkmQzjtkaWFnkrTzr7rfClda_s-S5V0bmgCrKnVaQC86-qZvj-NCFP3YENEkC-dDnfDo_y62ixzETZao4F1JRx_TH-I3sN6rB8Ts_njw8Qf-H_5wflorc0cUThCB_JnFBiX8Cjm2aTUJ2NOrEWLB_I'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Sarah Harlow',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppTheme.primary,
                    ),
                  ),
                  Text(
                    'Course Coordinator',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.outline,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
