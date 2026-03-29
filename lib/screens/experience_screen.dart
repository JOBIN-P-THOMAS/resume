import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  Future<void> _mail(BuildContext context) async {
    final uri = Uri.parse('mailto:jobinpthomas1@gmail.com');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    final scheme = Theme.of(context).colorScheme;

    final entries = <_TimelineEntry>[
      _TimelineEntry(
        role: 'R&D / Embedded Engineer',
        company: 'NOSH Robotics',
        period: '2022 — Present',
        location: 'Bengaluru, India',
        summary:
            'End-to-end product development for a cooking robot: STM32-class firmware, PCB bring-up, custom test equipment, and production support when failures show up on the line—not in the lab.',
        highlights: [
          'Hardware + firmware ownership across subsystems; integration with manufacturing and field feedback.',
          'Plant debugging: PCB issues, harness problems, and process-driven defects traced to root cause.',
          'Built functional test and harness test systems to improve yield visibility and reduce recurring cost.',
          'Cross-functional work with mechanical, ops, and supply—same product, shared constraints.',
        ],
        tech: ['STM32', 'Renesas', 'ESP32', 'KiCad', 'Fusion 360', 'RTOS', 'CAN / I2C / UART'],
        icon: Icons.restaurant_outlined,
        accent: scheme.primary,
      ),
      _TimelineEntry(
        role: 'Product development (freelance)',
        company: 'Virtual clients',
        period: '2021 — 2022',
        location: 'Kerala, India',
        summary: 'Embedded and connectivity work for clients: lockbox-style products, industrial automation, and Android-side tooling where needed.',
        highlights: [
          'Lock box: BLE, RFID, cloud hooks; Arduino → Nordic-class integration path.',
          'STM32 industrial automation and on-site iteration.',
        ],
        tech: ['STM32', 'Atmega', 'ESP32', 'BLE', 'AWS'],
        icon: Icons.work_outline,
        accent: const Color(0xFF48BB78),
      ),
      _TimelineEntry(
        role: 'R&D Engineer',
        company: 'Lamaara Technologies',
        period: '2019 — 2020',
        location: 'Kochi, India',
        summary: 'Water filtration product from POC toward DFM: mechanical + electrical constraints, documentation, and supplier-facing technical clarity.',
        highlights: [
          'Cost and manufacturability tradeoffs with cross-functional input.',
        ],
        tech: ['DFM', 'Manufacturing', 'Documentation'],
        icon: Icons.water_drop_outlined,
        accent: const Color(0xFFED8936),
      ),
      _TimelineEntry(
        role: 'Embedded Engineer · Founder (education focus)',
        company: 'Infusory Future Tech Labs Pvt. Ltd.',
        period: '2016 — 2019',
        location: 'Palai, India',
        summary: 'Early career: Arduino/ESP bring-up, workshops across colleges, and hands-on teaching that sharpened debugging and communication—useful when production teams need clarity, not jargon.',
        highlights: [
          '40+ workshops: embedded, 3D printing, VR/AR robotics.',
          'Hardware–software integration as a teaching stack, not a slide deck.',
        ],
        tech: ['Arduino', 'ESP8266', 'ESP32', 'KiCad', '3D printing'],
        icon: Icons.school_outlined,
        accent: const Color(0xFF9F7AEA),
      ),
    ];

    return Scaffold(
      backgroundColor: scheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    scheme.surfaceContainerHighest.withValues(alpha: 0.4),
                    scheme.surface,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
                child: Column(
                  children: [
                    Text(
                      'Experience',
                      style: GoogleFonts.inter(
                        fontSize: isWide ? 56 : 40,
                        fontWeight: FontWeight.w900,
                        color: scheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Roles where “shipping” meant hardware, firmware, and factory reality—not a repo only.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: isWide ? 18 : 16,
                        color: scheme.onSurfaceVariant,
                        height: 1.55,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: isWide ? 48 : 20, vertical: 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 920),
                  child: Column(
                    children: [
                      for (var i = 0; i < entries.length; i++)
                        _TimelineTile(
                          entry: entries[i],
                          isLast: i == entries.length - 1,
                          index: i,
                        ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(40, 24, 40, 48),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    _miniStat(context, 'Production focus', 'Plant debug & test rigs', Icons.factory_outlined),
                    _miniStat(context, 'Stack', 'STM32 · RTOS · PCB', Icons.layers_outlined),
                    _miniStat(context, 'Also', 'Flutter device UI', Icons.phone_android_outlined),
                  ],
                ),
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    scheme.primary,
                    scheme.primary.withValues(alpha: 0.88),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Discuss a role',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: scheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Embedded systems, product engineering, or hardware–software integration.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: scheme.onPrimary.withValues(alpha: 0.9),
                    ),
                  ),
                  const SizedBox(height: 28),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: scheme.onPrimary,
                      foregroundColor: scheme.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    onPressed: () => _mail(context),
                    child: Text(
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

  Widget _miniStat(BuildContext context, String title, String sub, IconData icon) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 260,
      child: Material(
        color: scheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(icon, color: scheme.primary),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 14)),
                    Text(sub, style: GoogleFonts.inter(fontSize: 12, color: scheme.onSurfaceVariant)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineEntry {
  final String role;
  final String company;
  final String period;
  final String location;
  final String summary;
  final List<String> highlights;
  final List<String> tech;
  final IconData icon;
  final Color accent;

  const _TimelineEntry({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.summary,
    required this.highlights,
    required this.tech,
    required this.icon,
    required this.accent,
  });
}

class _TimelineTile extends StatelessWidget {
  final _TimelineEntry entry;
  final bool isLast;
  final int index;

  const _TimelineTile({
    required this.entry,
    required this.isLast,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 36,
          child: Column(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: entry.accent.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: entry.accent.withValues(alpha: 0.45)),
                ),
                child: Icon(entry.icon, size: 18, color: entry.accent),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 48,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  color: scheme.outline.withValues(alpha: 0.35),
                ),
            ],
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 36),
              child: Material(
                color: scheme.surface,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: entry.accent.withValues(alpha: 0.2)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.role,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: scheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        entry.company,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: entry.accent,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.schedule, size: 16, color: scheme.onSurfaceVariant),
                          const SizedBox(width: 6),
                          Text(
                            entry.period,
                            style: GoogleFonts.inter(fontSize: 14, color: scheme.onSurfaceVariant),
                          ),
                          const SizedBox(width: 16),
                          Icon(Icons.place_outlined, size: 16, color: scheme.onSurfaceVariant),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              entry.location,
                              style: GoogleFonts.inter(fontSize: 14, color: scheme.onSurfaceVariant),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        entry.summary,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          height: 1.55,
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 14),
                      ...entry.highlights.map(
                        (h) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(color: entry.accent, shape: BoxShape.circle),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  h,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: scheme.onSurface,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: entry.tech
                            .map(
                              (t) => Chip(
                                label: Text(t, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600)),
                                backgroundColor: entry.accent.withValues(alpha: 0.1),
                                side: BorderSide(color: entry.accent.withValues(alpha: 0.25)),
                                visualDensity: VisualDensity.compact,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    ).animate().fadeIn(duration: 400.ms, delay: (60 * index).ms).slideX(begin: 0.02);
  }
}
