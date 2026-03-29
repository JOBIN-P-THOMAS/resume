import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  static final List<_SkillCategory> _categories = [
    _SkillCategory(
      title: 'Embedded systems',
      icon: Icons.memory_outlined,
      accent: Color(0xFF667EEA),
      items: [
        'STM32 (F103, F411) — bare metal & HAL',
        'Interrupts, timers, DMA',
        'RTOS (tasks, synchronization, motor-control logic)',
      ],
    ),
    _SkillCategory(
      title: 'Hardware design',
      icon: Icons.developer_board_outlined,
      accent: Color(0xFF48BB78),
      items: [
        'PCB design, bring-up, rework',
        'EMI/EMC awareness — filtering, ferrite beads, layout discipline',
        'Bucks, decoupling, grounding strategies',
        'Signal integrity: I2C / UART issues under real loading',
      ],
    ),
    _SkillCategory(
      title: 'Communication protocols',
      icon: Icons.hub_outlined,
      accent: Color(0xFFED8936),
      items: [
        'I2C — buffers, level shifters, bus faults',
        'UART',
        'CAN',
      ],
    ),
    _SkillCategory(
      title: 'Control systems',
      icon: Icons.tune_outlined,
      accent: Color(0xFF9F7AEA),
      items: [
        'PID motor control',
        'Encoder-based positioning',
        'Multi-motor coordination',
      ],
    ),
    _SkillCategory(
      title: 'Software & tools',
      icon: Icons.terminal_outlined,
      accent: Color(0xFF38B2AC),
      items: [
        'Keil, STM32CubeIDE, ESP-IDF',
        'Flutter — admin dashboards, device UI & connectivity',
        'Debug: scope, logic analyzer, structured logging',
      ],
    ),
    _SkillCategory(
      title: 'Prototyping',
      icon: Icons.build_circle_outlined,
      accent: Color(0xFFF56565),
      items: [
        '3D printing — multiple machines, tooling, iteration',
        'CNC — machine build in progress',
        'Rapid mechanical + electrical iteration',
      ],
    ),
  ];

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
                      'Skills',
                      style: GoogleFonts.inter(
                        fontSize: isWide ? 56 : 40,
                        fontWeight: FontWeight.w900,
                        color: scheme.onSurface,
                        letterSpacing: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 760),
                      child: Text(
                        'Structured the way hiring managers scan embedded roles: firmware, hardware, protocols, control, tools, and shop-floor iteration.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: isWide ? 19 : 16,
                          fontWeight: FontWeight.w400,
                          color: scheme.onSurfaceVariant,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: isWide ? 48 : 20, vertical: 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final maxW = constraints.maxWidth;
                      final useTwo = maxW > 720;
                      final gap = 22.0;
                      final cardW = useTwo ? (maxW - gap) / 2 : maxW;
                      return Wrap(
                        spacing: gap,
                        runSpacing: gap,
                        children: [
                          for (var i = 0; i < _categories.length; i++)
                            SizedBox(
                              width: cardW,
                              child: _CategoryCard(category: _categories[i], index: i),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 96),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Material(
                  color: scheme.primaryContainer.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: Row(
                      children: [
                        Icon(Icons.integration_instructions_outlined, color: scheme.primary, size: 36),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            'Breadth is only useful with depth: I can discuss a PID loop, a buck layout, and a Flutter service architecture—because the same product needed all three.',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              height: 1.55,
                              color: scheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
    );
  }
}

class _SkillCategory {
  final String title;
  final IconData icon;
  final Color accent;
  final List<String> items;

  const _SkillCategory({
    required this.title,
    required this.icon,
    required this.accent,
    required this.items,
  });
}

class _CategoryCard extends StatelessWidget {
  final _SkillCategory category;
  final int index;

  const _CategoryCard({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: category.accent.withValues(alpha: 0.22)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: category.accent.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(category.icon, color: category.accent, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    category.title,
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: scheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...category.items.map(
              (line) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: category.accent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        line,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          height: 1.45,
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms, delay: (45 * index).ms)
        .slideY(begin: 0.03, curve: Curves.easeOutCubic);
  }
}
