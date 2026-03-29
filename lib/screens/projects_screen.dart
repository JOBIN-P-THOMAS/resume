import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/case_studies.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  ProjectDomain? _filter;

  List<CaseStudy> get _visible {
    final list = allCaseStudies;
    if (_filter == null) return list;
    return list.where((c) => c.domains.contains(_filter)).toList();
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    final visible = _visible;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                    Theme.of(context).colorScheme.surface,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
                child: Column(
                  children: [
                    Text(
                      'Projects — Case Studies',
                      style: GoogleFonts.inter(
                        fontSize: isWide ? 56 : 40,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.onSurface,
                        letterSpacing: 1.5,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    )
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: 0.06, curve: Curves.easeOutCubic),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 820),
                      child: Text(
                        'Real hardware fails in specific ways. These are structured the way engineering work actually happens: problem → constraints → what shipped → outcome.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: isWide ? 20 : 17,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          height: 1.65,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: isWide ? 48 : 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Filter by domain',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _FilterChip(
                        label: 'All',
                        selected: _filter == null,
                        onTap: () => setState(() => _filter = null),
                      ),
                      ...ProjectDomain.values.map(
                        (d) => _FilterChip(
                          label: d.label,
                          selected: _filter == d,
                          onTap: () => setState(() => _filter = d),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${visible.length} case study${visible.length == 1 ? '' : 'ies'}',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: isWide ? 48 : 20),
              child: visible.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(48),
                      child: Text(
                        'No projects in this filter.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        for (var i = 0; i < visible.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: _CaseStudyCard(
                              study: visible[i],
                              index: i,
                            ),
                          ),
                      ],
                    ),
            ),

            const SizedBox(height: 48),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withValues(alpha: 0.85),
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              child: Column(
                children: [
                  Icon(Icons.engineering, color: Theme.of(context).colorScheme.onPrimary, size: 56),
                  const SizedBox(height: 24),
                  Text(
                    'Want technical detail?',
                    style: GoogleFonts.inter(
                      fontSize: isWide ? 36 : 28,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.onPrimary,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 640),
                    child: Text(
                      'Ask about bring-up stories, test strategy, or how a bug moved from scope trace → BOM change. I prefer specifics over slide decks.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.92),
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                    ),
                    onPressed: () => _launchURL('mailto:jobinpthomas1@gmail.com?subject=Embedded%20%2F%20Product%20engineering'),
                    icon: const Icon(Icons.mail_outline),
                    label: Text(
                      'Email Jobin',
                      style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: selected ? scheme.primaryContainer : scheme.surfaceContainerHighest.withValues(alpha: 0.6),
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              color: selected ? scheme.onPrimaryContainer : scheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

class _CaseStudyCard extends StatelessWidget {
  final CaseStudy study;
  final int index;

  const _CaseStudyCard({
    required this.study,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: study.color.withValues(alpha: 0.25), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          initiallyExpanded: false,
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: study.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(study.icon, color: study.color, size: 22),
          ),
          title: Text(
            study.title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: scheme.onSurface,
              height: 1.25,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Text(
                  study.company,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: study.color,
                  ),
                ),
                const SizedBox(width: 10),
                ...study.domains.map(
                  (d) => Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: scheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        d.label,
                        style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: Image.asset(
                  study.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: study.color.withValues(alpha: 0.08),
                    child: Icon(study.icon, size: 64, color: study.color.withValues(alpha: 0.5)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _sectionLabel(context, 'Problem'),
            _bodyText(context, study.problem),
            const SizedBox(height: 14),
            _sectionLabel(context, 'Solution'),
            _bodyText(context, study.solution),
            const SizedBox(height: 14),
            _sectionLabel(context, 'Key engineering challenges'),
            ...study.keyChallenges.map((e) => _bullet(context, e)),
            const SizedBox(height: 14),
            _sectionLabel(context, 'What I did'),
            ...study.whatYouDid.map((e) => _bullet(context, e)),
            const SizedBox(height: 14),
            _sectionLabel(context, 'Tech stack'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: study.techStack
                  .map(
                    (t) => Chip(
                      label: Text(t, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600)),
                      backgroundColor: study.color.withValues(alpha: 0.1),
                      side: BorderSide(color: study.color.withValues(alpha: 0.25)),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 14),
            _sectionLabel(context, 'Outcome'),
            _bodyText(context, study.outcome),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms, delay: (40 * index).ms)
        .slideY(begin: 0.04, curve: Curves.easeOutCubic);
  }

  Widget _sectionLabel(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.6,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _bodyText(BuildContext context, String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 15,
        height: 1.55,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }

  Widget _bullet(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: study.color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 15,
                height: 1.5,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
