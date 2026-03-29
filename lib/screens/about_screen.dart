import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
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
                      'About',
                      style: GoogleFonts.inter(
                        fontSize: isWide ? 56 : 40,
                        fontWeight: FontWeight.w900,
                        color: scheme.onSurface,
                        letterSpacing: 1.2,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(duration: 450.ms),
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 760),
                      child: Text(
                        'I did not start as a “software developer.” I started as someone who took things apart, built replacements, and learned why failures happen on real hardware.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: isWide ? 20 : 17,
                          fontWeight: FontWeight.w400,
                          color: scheme.onSurfaceVariant,
                          height: 1.65,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 40),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Text(
                  'Today I work where firmware, PCBs, mechanics, and manufacturing meet. The interesting problems are rarely “write more code.” They are timing, grounding, noise, tolerance stack-up, supplier variation, and bugs that only appear when the line is running. I am comfortable owning that end-to-end: prototype, validate, support production, and debug like an engineer who has shipped—not like someone who only simulated.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: isWide ? 18 : 16,
                    height: 1.75,
                    color: scheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Journey
            Container(
              width: double.infinity,
              color: scheme.surfaceContainerLow.withValues(alpha: 0.25),
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'The arc',
                    style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: scheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 48),
                  isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _journeyCard(
                                context,
                                'Tinkering',
                                'Building early: printers, boards, mechanisms. Learning by failure modes—shorts, bad grounds, wrong assumptions—before the failures cost a line.',
                                Icons.handyman_outlined,
                                scheme.primary,
                              ),
                            ),
                            const SizedBox(width: 28),
                            Expanded(
                              child: _journeyCard(
                                context,
                                'Engineering discipline',
                                'B.Tech EEE foundation, then embedded work that forced rigor: bring-up, protocols, debugging with scopes and logic—not guesswork.',
                                Icons.memory_outlined,
                                const Color(0xFF48BB78),
                              ),
                            ),
                            const SizedBox(width: 28),
                            Expanded(
                              child: _journeyCard(
                                context,
                                'Product development',
                                'NOSH Robotics and client work: full lifecycle from idea to units in the field—hardware, firmware, test rigs, and plant support when reality disagrees with the schematic.',
                                Icons.precision_manufacturing_outlined,
                                const Color(0xFFED8936),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            _journeyCard(
                              context,
                              'Tinkering',
                              'Building early: printers, boards, mechanisms. Learning by failure modes before the failures cost a line.',
                              Icons.handyman_outlined,
                              scheme.primary,
                            ),
                            const SizedBox(height: 28),
                            _journeyCard(
                              context,
                              'Engineering discipline',
                              'EEE foundation, then embedded work: bring-up, protocols, scopes and logic analyzers—not guesswork.',
                              Icons.memory_outlined,
                              const Color(0xFF48BB78),
                            ),
                            const SizedBox(height: 28),
                            _journeyCard(
                              context,
                              'Product development',
                              'Lifecycle work: hardware, firmware, test rigs, plant support when reality disagrees with the schematic.',
                              Icons.precision_manufacturing_outlined,
                              const Color(0xFFED8936),
                            ),
                          ],
                        ),
                ],
              ),
            ),

            // Engineering depth
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              child: Column(
                children: [
                  Text(
                    'Engineering depth',
                    style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: scheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Short notes on things that separate a bench demo from a shippable product.',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: scheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 880),
                    child: Column(
                      children: [
                        _depthRow(
                          context,
                          'Decoupling capacitors',
                          'They are not optional decoration. Digital edges pull fast current; without local charge storage and a low-inductance return path, you get ground bounce and “mystery” resets.',
                        ),
                        _depthRow(
                          context,
                          'π filters after bucks',
                          'Switching converters generate ripple and HF content. LC/π filtering plus placement discipline keeps that energy out of sensitive analog and RF sections.',
                        ),
                        _depthRow(
                          context,
                          'I2C pull-up tradeoffs',
                          'Stronger pull-ups improve rise time on long buses; weaker ones reduce power. Capacitive loading and bus length decide whether you need buffers or a slower clock—not a single “correct” value.',
                        ),
                        _depthRow(
                          context,
                          'Real debugging',
                          'When a bus glitches intermittently, I look at grounds first, then ringing/overshoot, then firmware timeouts. Many “software bugs” are signal integrity with a software symptom.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Maker section
            Container(
              width: double.infinity,
              color: scheme.surfaceContainerLow.withValues(alpha: 0.2),
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              child: Column(
                children: [
                  Text(
                    'What I build (maker)',
                    style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: scheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Personal shop + experiments—same mindset as work: iterate fast, measure, fix the failure mode.',
                    style: GoogleFonts.inter(fontSize: 16, color: scheme.onSurfaceVariant),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _makerCard(
                                context,
                                Icons.print_outlined,
                                '3D printers',
                                'Multiple machines—used daily for brackets, tooling, and quick mechanical iteration.',
                                scheme.primary,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _makerCard(
                                context,
                                Icons.carpenter_outlined,
                                'CNC',
                                'Machine build in progress: moving from printed parts to subtractive workflows for stiffer structures.',
                                const Color(0xFF48BB78),
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _makerCard(
                                context,
                                Icons.breakfast_dining_outlined,
                                'Experiments',
                                'Side projects like a Meduvada machine concept—food automation is unforgiving: timing, heat, and mess teach constraints textbooks skip.',
                                const Color(0xFFED8936),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            _makerCard(
                              context,
                              Icons.print_outlined,
                              '3D printers',
                              'Multiple machines for brackets, tooling, and fast iteration.',
                              scheme.primary,
                            ),
                            const SizedBox(height: 24),
                            _makerCard(
                              context,
                              Icons.carpenter_outlined,
                              'CNC',
                              'Build in progress for stiffer structures than print-only setups.',
                              const Color(0xFF48BB78),
                            ),
                            const SizedBox(height: 24),
                            _makerCard(
                              context,
                              Icons.breakfast_dining_outlined,
                              'Experiments',
                              'Concepts like a Meduvada machine—heat, timing, and mess as design constraints.',
                              const Color(0xFFED8936),
                            ),
                          ],
                        ),
                ],
              ),
            ),

            // Education
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              child: Column(
                children: [
                  Text(
                    'Education',
                    style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: scheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Material(
                      color: scheme.surfaceContainerHighest.withValues(alpha: 0.35),
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                        padding: const EdgeInsets.all(36),
                        child: Column(
                          children: [
                            Icon(Icons.school_outlined, color: scheme.primary, size: 40),
                            const SizedBox(height: 20),
                            Text(
                              'B.Tech — Electrical & Electronics Engineering',
                              style: GoogleFonts.inter(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: scheme.onSurface,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Priest University · 2015–2019',
                              style: GoogleFonts.inter(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: scheme.primary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Credit transfer from APJ Abdul Kalam Technological University',
                              style: GoogleFonts.inter(fontSize: 14, color: scheme.onSurfaceVariant),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 40),
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
                    'If your team ships physical products',
                    style: GoogleFonts.inter(
                      fontSize: isWide ? 30 : 24,
                      fontWeight: FontWeight.w800,
                      color: scheme.onPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 640),
                    child: Text(
                      'I am most useful when firmware, PCB, and factory reality are treated as one system. I prefer direct technical depth over generic “innovation” language.',
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        height: 1.6,
                        color: scheme.onPrimary.withValues(alpha: 0.92),
                      ),
                      textAlign: TextAlign.center,
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

  Widget _journeyCard(
    BuildContext context,
    String title,
    String body,
    IconData icon,
    Color accent,
  ) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accent.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: accent, size: 28),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: scheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            body,
            style: GoogleFonts.inter(
              fontSize: 15,
              height: 1.6,
              color: scheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _depthRow(BuildContext context, String title, String body) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_outline, color: scheme.primary, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: scheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  body,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    height: 1.55,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _makerCard(
    BuildContext context,
    IconData icon,
    String title,
    String body,
    Color accent,
  ) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accent.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: accent, size: 32),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: scheme.onSurface,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            body,
            style: GoogleFonts.inter(
              fontSize: 14,
              height: 1.55,
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
