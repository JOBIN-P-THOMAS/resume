import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
                      'About Me',
                      style: GoogleFonts.inter(
                        fontSize: 64,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF1A202C),
                        letterSpacing: 2,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: Text(
                        'A passionate R&D engineer with a lifelong commitment to innovation and problem-solving through technology.',
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

            // Personal Journey Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'My Journey',
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
                            Expanded(child: _buildJourneyCard(
                              'Early Passion',
                              'From age 7, I discovered my love for technology and began building projects. This early start gave me a unique foundation in hands-on problem-solving.',
                              Icons.child_care,
                              const Color(0xFF667EEA),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildJourneyCard(
                              'Academic Foundation',
                              'Completed B.Tech in EEE from Priest University, building a strong theoretical and practical foundation in electrical and electronics engineering.',
                              Icons.school,
                              const Color(0xFF48BB78),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildJourneyCard(
                              'Professional Growth',
                              'Progressed from embedded engineer to R&D engineer, leading innovative projects and mentoring teams across multiple organizations.',
                              Icons.work,
                              const Color(0xFFED8936),
                            )),
                          ],
                        )
                      : Column(
                          children: [
                            _buildJourneyCard(
                              'Early Passion',
                              'From age 7, I discovered my love for technology and began building projects. This early start gave me a unique foundation in hands-on problem-solving.',
                              Icons.child_care,
                              const Color(0xFF667EEA),
                            ),
                            const SizedBox(height: 40),
                            _buildJourneyCard(
                              'Academic Foundation',
                              'Completed B.Tech in EEE from Priest University, building a strong theoretical and practical foundation in electrical and electronics engineering.',
                              Icons.school,
                              const Color(0xFF48BB78),
                            ),
                            const SizedBox(height: 40),
                            _buildJourneyCard(
                              'Professional Growth',
                              'Progressed from embedded engineer to R&D engineer, leading innovative projects and mentoring teams across multiple organizations.',
                              Icons.work,
                              const Color(0xFFED8936),
                            ),
                          ],
                        ),
                ],
              ),
            ),

            // Education Section
            Container(
              width: double.infinity,
              color: const Color(0xFFF7FAFC),
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Education',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1A202C),
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 600),
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
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFF667EEA).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.school,
                            color: Color(0xFF667EEA),
                            size: 40,
                          ),
                        ),
                        const SizedBox(height: 24),
                                                 Text(
                           'B.Tech in Electrical & Electronics Engineering',
                           style: GoogleFonts.inter(
                             fontSize: 24,
                             fontWeight: FontWeight.w700,
                             color: const Color(0xFF1A202C),
                           ),
                           textAlign: TextAlign.center,
                         ),
                        const SizedBox(height: 16),
                        Text(
                          'Priest University',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF667EEA),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '2015 - 2019',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF4A5568),
                          ),
                        ),
                        const SizedBox(height: 16),
                                                 Text(
                           'Credit Transfer from APJ Abdul Kalam Technological University',
                           style: GoogleFonts.inter(
                             fontSize: 14,
                             fontWeight: FontWeight.w400,
                             color: const Color(0xFF718096),
                           ),
                           textAlign: TextAlign.center,
                         ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Core Philosophy Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Core Philosophy',
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
                            Expanded(child: _buildPhilosophyCard(
                              'Innovation First',
                              'I believe in pushing boundaries and creating solutions that don\'t just solve problems, but revolutionize how we approach them.',
                              Icons.lightbulb,
                              const Color(0xFF9F7AEA),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildPhilosophyCard(
                              'Hands-on Learning',
                              'True mastery comes from building, testing, and iterating. I learn by doing and encourage others to do the same.',
                              Icons.build,
                              const Color(0xFFF6AD55),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildPhilosophyCard(
                              'Collaborative Growth',
                              'The best innovations come from diverse perspectives. I thrive in collaborative environments where knowledge sharing drives progress.',
                              Icons.group,
                              const Color(0xFF68D391),
                            )),
                          ],
                        )
                      : Column(
                          children: [
                            _buildPhilosophyCard(
                              'Innovation First',
                              'I believe in pushing boundaries and creating solutions that don\'t just solve problems, but revolutionize how we approach them.',
                              Icons.lightbulb,
                              const Color(0xFF9F7AEA),
                            ),
                            const SizedBox(height: 40),
                            _buildPhilosophyCard(
                              'Hands-on Learning',
                              'True mastery comes from building, testing, and iterating. I learn by doing and encourage others to do the same.',
                              Icons.build,
                              const Color(0xFFF6AD55),
                            ),
                            const SizedBox(height: 40),
                            _buildPhilosophyCard(
                              'Collaborative Growth',
                              'The best innovations come from diverse perspectives. I thrive in collaborative environments where knowledge sharing drives progress.',
                              Icons.group,
                              const Color(0xFF68D391),
                            ),
                          ],
                        ),
                ],
              ),
            ),

            // Career Goals Section
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
                  const Icon(Icons.flag, color: Colors.white, size: 80),
                  const SizedBox(height: 32),
                  Text(
                    'Career Goals',
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
                      'I aspire to lead breakthrough innovations in robotics and automation, mentor the next generation of engineers, and contribute to technologies that make a meaningful impact on society.',
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
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF667EEA),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              'Innovation Leadership',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              'Mentorship',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF667EEA),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              'Social Impact',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF667EEA),
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
          ],
        ),
      ),
    );
  }

  Widget _buildJourneyCard(String title, String description, IconData icon, Color color) {
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
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A202C),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4A5568),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPhilosophyCard(String title, String description, IconData icon, Color color) {
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
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A202C),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4A5568),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
