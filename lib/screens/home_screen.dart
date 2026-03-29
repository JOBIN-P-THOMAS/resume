import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

import '../utils/resume_download.dart';

class HomeScreen extends StatefulWidget {
  /// Main shell page indices: 0 Home, 3 Projects, 5 Contact.
  final void Function(int pageIndex)? onNavigateToPage;

  const HomeScreen({super.key, this.onNavigateToPage});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Image assets for the background
  final List<String> imageAssets = [
    'assets/images/PCB.jpg',
    'assets/images/SCOLL_IMAGE.JPG',
    'assets/images/TESTER.jpg',
    'assets/images/123.jpg',
    'assets/images/3d.jpg',
    'assets/images/cnc.jpeg',
  ];

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    scheme.surfaceContainerHighest.withValues(alpha: 0.45),
                    scheme.surface,
                    scheme.surfaceContainerLow.withValues(alpha: 0.3),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: isWide ? 120 : 80,
                  horizontal: isWide ? 40 : 20,
                ),
                child: Column(
                  children: [
                    // Static background strip — scrolls on narrow widths to avoid overflow
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ClipRect(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(imageAssets.length, (index) {
                                final w = MediaQuery.of(context).size.width < 600 ? 110.0 : (isWide ? 140.0 : 120.0);
                                return Opacity(
                                  opacity: 0.15 - (index % 6) * 0.01,
                                  child: Transform.rotate(
                                    angle: (index % 6) * 10 * math.pi / 180 - 15 * math.pi / 180,
                                    child: Image.asset(
                                      imageAssets[index],
                                      width: w,
                                      height: 200,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => Container(
                                        width: w,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withValues(alpha: 0.3),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.error, color: Colors.red, size: 28),
                                            const SizedBox(height: 6),
                                            Text(
                                              imageAssets[index],
                                              style: const TextStyle(color: Colors.grey, fontSize: 9),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Profile Image
                    Container(
                      width: isWide ? 180 : 140,
                      height: isWide ? 180 : 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF667EEA),
                            Color(0xFF764BA2),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF667EEA).withValues(alpha: 0.3),
                            blurRadius: 40,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/Profile.JPG',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF667EEA).withValues(alpha: 0.1),
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 80,
                                color: Color(0xFF667EEA),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    Text(
                      'JOBIN P THOMAS',
                      style: GoogleFonts.inter(
                        fontSize: isWide ? 48 : 32,
                        fontWeight: FontWeight.w900,
                        color: scheme.onSurface,
                        letterSpacing: isWide ? 2 : 1,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(duration: 450.ms).slideY(begin: 0.04, curve: Curves.easeOutCubic),

                    const SizedBox(height: 20),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isWide ? 28 : 18,
                        vertical: isWide ? 14 : 10,
                      ),
                      decoration: BoxDecoration(
                        color: scheme.primary,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: scheme.primary.withValues(alpha: 0.28),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Text(
                        'Embedded Systems Engineer — product & R&D',
                        style: GoogleFonts.inter(
                          fontSize: isWide ? 18 : 14,
                          fontWeight: FontWeight.w700,
                          color: scheme.onPrimary,
                          letterSpacing: 0.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 28),

                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: isWide ? 820 : 640),
                      child: Column(
                        children: [
                          Text(
                            'Embedded Systems Engineer building real-world products from concept to production',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: isWide ? 26 : 20,
                              fontWeight: FontWeight.w800,
                              color: scheme.onSurface,
                              height: 1.35,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Reliability first: hardware–software integration, RTOS and bare-metal STM32 work, and design that survives manufacturing. '
                            'I ship in production environments—PCB bring-up, plant-level debugging, EMI-aware layouts, and firmware that matches the real machine.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: isWide ? 17 : 15,
                              fontWeight: FontWeight.w400,
                              color: scheme.onSurfaceVariant,
                              height: 1.65,
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 120.ms, duration: 500.ms),

                    const SizedBox(height: 36),

                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 14,
                      runSpacing: 14,
                      children: [
                        FilledButton.icon(
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                          ),
                          onPressed: () => widget.onNavigateToPage?.call(3),
                          icon: const Icon(Icons.folder_open_outlined, size: 20),
                          label: Text(
                            'View Projects',
                            style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                          ),
                        ),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                          ),
                          onPressed: () => widget.onNavigateToPage?.call(5),
                          icon: const Icon(Icons.mail_outline, size: 20),
                          label: Text(
                            'Contact Me',
                            style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                          ),
                        ),
                        FilledButton.tonalIcon(
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                          ),
                          onPressed: () => openBundledResume(context),
                          icon: const Icon(Icons.download_outlined, size: 20),
                          label: Text(
                            'Download Resume',
                            style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ).animate().fadeIn(delay: 220.ms, duration: 450.ms),

                    const SizedBox(height: 28),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton.filledTonal(
                          tooltip: 'LinkedIn',
                          onPressed: () => _launchURL('https://linkedin.com/in/jobinpthomas'),
                          icon: const Icon(FontAwesomeIcons.linkedin, size: 18),
                        ),
                        const SizedBox(width: 8),
                        IconButton.filledTonal(
                          tooltip: 'GitHub',
                          onPressed: () => _launchURL('https://github.com/JOBIN-P-THOMAS'),
                          icon: const Icon(FontAwesomeIcons.github, size: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Achievements Section
            Container(
              width: double.infinity,
              color: scheme.surfaceContainerLow.withValues(alpha: 0.35),
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'At a glance',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: scheme.onSurface,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Volume of builds, teaching, and ownership — not vanity metrics.',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: scheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 80),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: isWide ? 4 : (MediaQuery.of(context).size.width > 600 ? 2 : 1),
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: isWide ? 1.2 : 1.0,
                    children: [
                      StatCard('100+', 'Shipped & personal builds', Icons.rocket_launch, scheme.primary),
                      StatCard('7+', 'Years hands-on', Icons.trending_up, const Color(0xFF48BB78)),
                      StatCard('40+', 'College workshops', Icons.school, const Color(0xFFED8936)),
                      StatCard('Plant', 'Production debug', Icons.precision_manufacturing, const Color(0xFF9F7AEA)),
                    ],
                  ),
                ],
              ),
            ),

            // Contact Section
            Container(
              width: double.infinity,
              color: scheme.surface,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                children: [
                  Text(
                    'Let\'s Connect',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: scheme.onSurface,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Embedded roles, product engineering, or hardware–software integration.',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: scheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 80),
                  isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 2, child: ContactSection(launchURL: _launchURL)),
                            const SizedBox(width: 60),
                            Expanded(child: SocialSection(launchURL: _launchURL)),
                          ],
                        )
                      : Column(
                          children: [
                            ContactSection(launchURL: _launchURL),
                            const SizedBox(height: 60),
                            SocialSection(launchURL: _launchURL),
                          ],
                        ),
                ],
              ),
            ),

            // Final CTA Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    scheme.primary,
                    scheme.primary.withValues(alpha: 0.82),
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                children: [
                  Icon(Icons.handshake_outlined, color: scheme.onPrimary, size: 72),
                  const SizedBox(height: 28),
                  Text(
                    'Building beats slide decks',
                    style: GoogleFonts.inter(
                      fontSize: isWide ? 38 : 28,
                      fontWeight: FontWeight.w800,
                      color: scheme.onPrimary,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: Text(
                      'If you need someone who can own a board bring-up, chase a bus fault, and ship firmware that matches the machine—let\'s talk.',
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: scheme.onPrimary.withValues(alpha: 0.92),
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: scheme.onPrimary,
                      foregroundColor: scheme.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                    ),
                    onPressed: () => _launchURL('mailto:jobinpthomas1@gmail.com'),
                    child: Text(
                      'Email',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w800),
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

class StatCard extends StatelessWidget {
  final String value, label;
  final IconData icon;
  final Color color;
  const StatCard(this.value, this.label, this.icon, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
        border: Border.all(
          color: color.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 16),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: scheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  final Future<void> Function(String url) launchURL;
  const ContactSection({required this.launchURL, super.key});
  
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: scheme.primaryContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.contact_mail,
                  color: scheme.primary,
                  size: 32,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                'Contact Information',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: scheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ContactItem(
            icon: Icons.email,
            label: 'Email',
            value: 'jobinpthomas1@gmail.com',
            onTap: () => launchURL('mailto:jobinpthomas1@gmail.com'),
          ),
          ContactItem(
            icon: Icons.phone,
            label: 'Phone',
            value: '+91 8304980172',
            onTap: () => launchURL('tel:+918304980172'),
          ),
          ContactItem(
            icon: Icons.location_on,
            label: 'Location',
            value: 'Bengaluru, Karnataka, India',
          ),
          ContactItem(
            icon: Icons.schedule,
            label: 'Notice Period',
            value: '60 Days',
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String label, value;
  final VoidCallback? onTap;
  const ContactItem({required this.icon, required this.label, required this.value, this.onTap, super.key});
  
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: onTap != null ? scheme.surfaceContainerLow : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: onTap != null ? Border.all(color: scheme.outline.withValues(alpha: 0.25)) : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: scheme.primary, size: 24),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    color: scheme.onSurfaceVariant,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    color: scheme.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (onTap != null)
            Icon(
              Icons.arrow_forward_ios,
              color: scheme.primary.withValues(alpha: 0.6),
              size: 20,
            ),
        ],
      ),
    );
  }
}

class SocialSection extends StatelessWidget {
  final Future<void> Function(String url) launchURL;
  const SocialSection({required this.launchURL, super.key});
  
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: scheme.primaryContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.share,
                  color: scheme.primary,
                  size: 32,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                'Connect With Me',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: scheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          SocialCard(
            icon: FontAwesomeIcons.linkedin,
            title: 'LinkedIn',
            subtitle: 'Professional Network',
            onTap: () => launchURL('https://linkedin.com/in/jobinpthomas'),
            color: const Color(0xFF0077B5),
          ),
          SocialCard(
            icon: FontAwesomeIcons.github,
            title: 'GitHub',
            subtitle: 'Code Portfolio',
            onTap: () => launchURL('https://github.com/JOBIN-P-THOMAS'),
            color: const Color(0xFF1A202C),
          ),
          SocialCard(
            icon: FontAwesomeIcons.cube,
            title: 'GrabCAD',
            subtitle: '3D Models & Designs',
            onTap: () => launchURL('https://grabcad.com/jobin.thomas-4'),
            color: const Color(0xFF667EEA),
          ),
        ],
      ),
    );
  }
}

class SocialCard extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final VoidCallback onTap;
  final Color color;
  const SocialCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withValues(alpha: 0.2)),
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        color: color,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        color: color.withValues(alpha: 0.7),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: color.withValues(alpha: 0.6),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
