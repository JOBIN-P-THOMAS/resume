import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Auto-scrolling for SingleChildScrollView
  late ScrollController _scrollController;
  Timer? _scrollTimer;
  int _currentIndex = 0;
  
  // Image assets for the scrolling background
  final List<String> imageAssets = [
    'assets/images/PCB.jpg',
    'assets/images/SCOLL_IMAGE.JPG',
    'assets/images/TESTER.jpg',
    'assets/images/123.jpg',
    'assets/images/3d.jpg',
    'assets/images/cnc.jpeg',
    // Repeat for seamless loop
    'assets/images/PCB.jpg',
    'assets/images/SCOLL_IMAGE.JPG',
    'assets/images/TESTER.jpg',
    'assets/images/123.jpg',
    'assets/images/3d.jpg',
    'assets/images/cnc.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 50000), (timer) {
      if (_scrollController.hasClients) {
        // Get current scroll position
        double currentPosition = _scrollController.offset;
        
        // Calculate next position (move 2 pixels at a time for smooth movement)
        double nextPosition = currentPosition + 2.0;
        
        // If we've scrolled past the first set of images, reset to beginning seamlessly
        if (nextPosition >= (imageAssets.length / 2) * 192.0) {
          nextPosition = 0.0;
        }
        
        _scrollController.jumpTo(nextPosition);
      }
    });
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFF7FAFC),
                    Color(0xFFEDF2F7),
                    Color(0xFFE2E8F0),
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
                                        // New Clean Approach: Auto-scrolling Horizontal Images
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(imageAssets.length, (index) => Opacity(
                              opacity: 0.15 - (index % 6) * 0.01, // Varying opacity for visual interest
                              child: Transform.rotate(
                                angle: (index % 6) * 10 * math.pi / 180 - 15 * math.pi / 180, // Varying rotation
                                child: Container(
                                  margin: EdgeInsets.only(right: 12),
                                  child: Image.asset(
                                    imageAssets[index],
                                    width: MediaQuery.of(context).size.width < 600 ? 120 : (isWide ? 180 : 150),
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )),
                          ],
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
                    
                    // Name
                    Text(
                      'JOBIN P THOMAS',
                      style: GoogleFonts.inter(
                        fontSize: isWide ? 48 : 32,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF1A202C),
                        letterSpacing: isWide ? 2 : 1,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Title Badge
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isWide ? 32 : 20,
                        vertical: isWide ? 16 : 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF667EEA),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF667EEA).withValues(alpha: 0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Text(
                        'R&D Engineer & Innovation Leader',
                        style: GoogleFonts.inter(
                          fontSize: isWide ? 20 : 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Tagline
                    Container(
                      constraints: BoxConstraints(maxWidth: isWide ? 800 : 600),
                      child: Text(
                        'From age 7, my passion for technology led me to create 100+ projects, gaining diverse skills and mastery in various disciplines with hands-on problem-solving experience.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: isWide ? 20 : 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF4A5568),
                          height: 1.6,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 50),
                    
                    // CTA Button
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF667EEA),
                            Color(0xFF764BA2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF667EEA).withValues(alpha: 0.4),
                            blurRadius: 30,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () => _launchURL('mailto:jobinpthomas1@gmail.com'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.email, size: 24, color: Colors.white),
                            const SizedBox(width: 16),
                            Text(
                              'Get In Touch',
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Achievements Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Key Achievements',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1A202C),
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Numbers that speak for themselves',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF4A5568),
                    ),
                  ),
                  const SizedBox(height: 80),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: isWide ? 4 : (MediaQuery.of(context).size.width > 600 ? 2 : 1),
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: isWide ? 1.2 : 1.0,
                    children: [
                      StatCard('100+', 'Projects', Icons.rocket_launch, const Color(0xFF667EEA)),
                      StatCard('7+', 'Years Exp', Icons.trending_up, const Color(0xFF48BB78)),
                      StatCard('40+', 'Workshops', Icons.school, const Color(0xFFED8936)),
                      StatCard('70%', 'Innovations', Icons.lightbulb, const Color(0xFF9F7AEA)),
                    ],
                  ),
                ],
              ),
            ),

            // Contact Section
            Container(
              width: double.infinity,
              color: const Color(0xFFF7FAFC),
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                children: [
                  Text(
                    'Let\'s Connect',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1A202C),
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Ready to discuss your next project?',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF4A5568),
                    ),
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF667EEA),
                    Color(0xFF764BA2),
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                children: [
                  const Icon(Icons.handshake, color: Colors.white, size: 80),
                  const SizedBox(height: 32),
                  Text(
                    'Ready to Build Something Amazing?',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Text(
                      "Let's discuss how my diverse skills and passion for innovation can contribute to your next breakthrough project.",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withValues(alpha: 0.9),
                        height: 1.6,
                        letterSpacing: 0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () => _launchURL('mailto:jobinpthomas1@gmail.com'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.email, size: 24, color: Color(0xFF667EEA)),
                          const SizedBox(width: 16),
                          Text(
                            'Start a Conversation',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF667EEA),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
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
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
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
                color: const Color(0xFF1A202C),
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
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
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
                  color: const Color(0xFF667EEA).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.contact_mail,
                  color: Color(0xFF667EEA),
                  size: 32,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                'Contact Information',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A202C),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: onTap != null ? const Color(0xFFF7FAFC) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: onTap != null ? Border.all(color: const Color(0xFFE2E8F0)) : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF667EEA), size: 24),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF4A5568),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF1A202C),
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
              color: const Color(0xFF667EEA).withValues(alpha: 0.6),
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
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
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
                  color: const Color(0xFF667EEA).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.share,
                  color: Color(0xFF667EEA),
                  size: 32,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                'Connect With Me',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A202C),
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
