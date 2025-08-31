import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
                padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 40),
                child: Column(
                  children: [
                    Text(
                      'Get In Touch',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 64,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF1A202C),
                        letterSpacing: 2,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: Text(
                        'Ready to discuss your next project? Let\'s connect and explore how my diverse skills and innovative approach can contribute to your success.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF4A5568),
                          height: 1.6,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Contact Information Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Contact Information',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1A202C),
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 80),
                  isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildContactCard(
                              'Email',
                              'jobinpthomas1@gmail.com',
                              'Primary contact method for project discussions',
                              Icons.email,
                              const Color(0xFF667EEA),
                              () => _launchURL('mailto:jobinpthomas1@gmail.com'),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildContactCard(
                              'Phone',
                              '+91 8304980172',
                              'Available for urgent discussions and calls',
                              Icons.phone,
                              const Color(0xFF48BB78),
                              () => _launchURL('tel:+918304980172'),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildContactCard(
                              'Location',
                              'Bengaluru, Karnataka, India',
                              'Open to remote work and travel opportunities',
                              Icons.location_on,
                              const Color(0xFFED8936),
                              null,
                            )),
                          ],
                        )
                      : Column(
                          children: [
                            _buildContactCard(
                              'Email',
                              'jobinpthomas1@gmail.com',
                              'Primary contact method for project discussions',
                              Icons.email,
                              const Color(0xFF667EEA),
                              () => _launchURL('mailto:jobinpthomas1@gmail.com'),
                            ),
                            const SizedBox(height: 40),
                            _buildContactCard(
                              'Phone',
                              '+91 8304980172',
                              'Available for urgent discussions and calls',
                              Icons.phone,
                              const Color(0xFF48BB78),
                              () => _launchURL('tel:+918304980172'),
                            ),
                            const SizedBox(height: 40),
                            _buildContactCard(
                              'Location',
                              'Bengaluru, Karnataka, India',
                              'Open to remote work and travel opportunities',
                              Icons.location_on,
                              const Color(0xFFED8936),
                              null,
                            ),
                          ],
                        ),
                ],
              ),
            ),

            // Social Media Section
            Container(
              width: double.infinity,
              color: const Color(0xFFF7FAFC),
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Connect With Me',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1A202C),
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 80),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 40,
                    crossAxisCount: isWide ? 3 : 2,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildSocialCard(
                        'LinkedIn',
                        'Professional Network',
                        'Connect for career opportunities and collaborations',
                        FontAwesomeIcons.linkedin,
                        const Color(0xFF0077B5),
                        () => _launchURL('https://linkedin.com/in/jobinpthomas'),
                      ),
                      _buildSocialCard(
                        'GitHub',
                        'Code Portfolio',
                        'Explore my projects and technical contributions',
                        FontAwesomeIcons.github,
                        const Color(0xFF1A202C),
                        () => _launchURL('https://github.com/jobinpthomas'),
                      ),
                      _buildSocialCard(
                        'GrabCAD',
                        '3D Models & Designs',
                        'View my mechanical designs and CAD work',
                        FontAwesomeIcons.cube,
                        const Color(0xFF667EEA),
                        () => _launchURL('https://grabcad.com/jobinpthomas'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Professional Summary Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Professional Summary',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1A202C),
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7FAFC),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color(0xFF667EEA).withValues(alpha: 0.1),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFF667EEA).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Color(0xFF667EEA),
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'I am a person of embedded C firmware + Embedded hardware (PCB) + prototyping, making creative things with my diverse skills. I have made lots of projects, 3D printers, CNC machines, and need to show everything.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF4A5568),
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'I need to make a resume page which is very interactive, creative, and I need to show my projects and skills. As a Flutter developer, I need to rate my skills and show my projects in different fields.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF4A5568),
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Availability Section
            Container(
              width: double.infinity,
              color: const Color(0xFFF7FAFC),
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Availability & Preferences',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1A202C),
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 80),
                  isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildAvailabilityCard(
                              'Notice Period',
                              '60 Days',
                              'Available for immediate discussions and planning',
                              Icons.schedule,
                              const Color(0xFF667EEA),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildAvailabilityCard(
                              'Work Mode',
                              'Remote + On-site',
                              'Flexible with work arrangements and travel',
                              Icons.work,
                              const Color(0xFF48BB78),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildAvailabilityCard(
                              'Project Types',
                              'R&D & Innovation',
                              'Specialized in breakthrough technologies',
                              Icons.lightbulb,
                              const Color(0xFFED8936),
                            )),
                          ],
                        )
                      : Column(
                          children: [
                            _buildAvailabilityCard(
                              'Notice Period',
                              '60 Days',
                              'Available for immediate discussions and planning',
                              Icons.schedule,
                              const Color(0xFF667EEA),
                            ),
                            const SizedBox(height: 40),
                            _buildAvailabilityCard(
                              'Work Mode',
                              'Remote + On-site',
                              'Flexible with work arrangements and travel',
                              Icons.work,
                              const Color(0xFF48BB78),
                            ),
                            const SizedBox(height: 40),
                            _buildAvailabilityCard(
                              'Project Types',
                              'R&D & Innovation',
                              'Specialized in breakthrough technologies',
                              Icons.lightbulb,
                              const Color(0xFFED8936),
                            ),
                          ],
                        ),
                ],
              ),
            ),

            // Call to Action Section
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
                    'Ready to Start a Project?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Text(
                      'Let\'s discuss how my diverse skills and passion for innovation can contribute to your next breakthrough project. I\'m excited to explore opportunities that challenge me and allow me to make a meaningful impact.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withValues(alpha: 0.9),
                        height: 1.6,
                        letterSpacing: 0.3,
                      ),
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
                            'Send Message',
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

  Widget _buildContactCard(String title, String value, String description, IconData icon, Color color, VoidCallback? onTap) {
    return Container(
      padding: const EdgeInsets.all(32),
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
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A202C),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4A5568),
              height: 1.5,
            ),
          ),
          if (onTap != null) ...[
            const SizedBox(height: 20),
            InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Contact Now',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSocialCard(String title, String subtitle, String description, IconData icon, Color color, VoidCallback onTap) {
    return Container(
      padding: const EdgeInsets.all(32),
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
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A202C),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4A5568),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Visit Profile',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailabilityCard(String title, String value, String description, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(32),
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
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A202C),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4A5568),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

