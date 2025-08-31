import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

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
                      'Projects Portfolio',
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
                        'A showcase of 100+ innovative projects spanning embedded systems, robotics, software development, and mechanical engineering.',
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

            // Featured Projects Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Featured Projects',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1A202C),
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 80),
                  _buildFeaturedProjectCard(
                    'Nosh Cooking Robot',
                    'R&D Engineer at Nosh Robotics',
                    'Led 70% of innovations and mechanisms for the cooking robot. Designed mechanical systems, embedded firmware, and hardware integration.',
                    ['STM32', 'Renesas', 'ESP32', 'Fusion 360', 'KiCad'],
                    Icons.restaurant,
                    const Color(0xFF667EEA),
                  ),
                  const SizedBox(height: 40),
                  _buildFeaturedProjectCard(
                    '3D Printer & CNC Machine',
                    'Personal Innovation Project',
                    'Designed and built custom 3D printer and CNC machine from scratch. Integrated electronics, firmware, and mechanical systems.',
                    ['Arduino', 'Stepper Motors', 'Firmware', 'CAD Design', 'Prototyping'],
                    Icons.print,
                    const Color(0xFF48BB78),
                  ),
                  const SizedBox(height: 40),
                  _buildFeaturedProjectCard(
                    'Smart Lock Box System',
                    'Freelance Product Development',
                    'Developed intelligent lock box with Atmega MCU, ESP32 integration, and Android app for secure data transfer.',
                    ['Atmega', 'ESP32', 'Android App', 'IoT', 'Security'],
                    Icons.lock,
                    const Color(0xFFED8936),
                  ),
                ],
              ),
            ),

            // Project Categories Section
            Container(
              width: double.infinity,
              color: const Color(0xFFF7FAFC),
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Project Categories',
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
                      _buildCategoryCard(
                        'Embedded Systems',
                        '50+ Projects',
                        'Microcontrollers, sensors, IoT devices, and firmware development',
                        Icons.memory,
                        const Color(0xFF667EEA),
                      ),
                      _buildCategoryCard(
                        'Mechanical Design',
                        '30+ Projects',
                        'CAD/CAM, 3D printing, CNC, and prototyping',
                        Icons.build,
                        const Color(0xFF48BB78),
                      ),
                      _buildCategoryCard(
                        'Software Development',
                        '20+ Projects',
                        'Mobile apps, web applications, and desktop software',
                        Icons.code,
                        const Color(0xFFED8936),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Project Statistics Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Project Statistics',
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
                    crossAxisCount: isWide ? 4 : 2,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildStatCard('100+', 'Total Projects', Icons.rocket_launch, const Color(0xFF667EEA)),
                      _buildStatCard('70%', 'Success Rate', Icons.trending_up, const Color(0xFF48BB78)),
                      _buildStatCard('40+', 'Colleges Reached', Icons.school, const Color(0xFFED8936)),
                      _buildStatCard('7+', 'Years Experience', Icons.schedule, const Color(0xFF9F7AEA)),
                    ],
                  ),
                ],
              ),
            ),

            // Recent Projects Section
            Container(
              width: double.infinity,
              color: const Color(0xFFF7FAFC),
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Recent Projects',
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
                            Expanded(child: _buildRecentProjectCard(
                              'Industrial Automation',
                              'Green Valley Oils',
                              'Developed water recycling machine with STM32 control system',
                              Icons.factory,
                              const Color(0xFF667EEA),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildRecentProjectCard(
                              'Educational Training',
                              'Atal Lab',
                              'Conducted embedded systems workshops for students',
                              Icons.school,
                              const Color(0xFF48BB78),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildRecentProjectCard(
                              'Water Filtration',
                              'Lamaara Technologies',
                              'Designed water filter from POC to DFM readiness',
                              Icons.water_drop,
                              const Color(0xFFED8936),
                            )),
                          ],
                        )
                      : Column(
                          children: [
                            _buildRecentProjectCard(
                              'Industrial Automation',
                              'Green Valley Oils',
                              'Developed water recycling machine with STM32 control system',
                              Icons.factory,
                              const Color(0xFF667EEA),
                            ),
                            const SizedBox(height: 40),
                            _buildRecentProjectCard(
                              'Educational Training',
                              'Atal Lab',
                              'Conducted embedded systems workshops for students',
                              Icons.school,
                              const Color(0xFF48BB78),
                            ),
                            const SizedBox(height: 40),
                            _buildRecentProjectCard(
                              'Water Filtration',
                              'Lamaara Technologies',
                              'Designed water filter from POC to DFM readiness',
                              Icons.water_drop,
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
                  const Icon(Icons.work, color: Colors.white, size: 80),
                  const SizedBox(height: 32),
                  Text(
                    'Ready to Collaborate?',
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
                      'Let\'s discuss how my diverse project experience and innovative approach can contribute to your next breakthrough project.',
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
                      onPressed: () {},
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
                            'Discuss Your Project',
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

  Widget _buildFeaturedProjectCard(String title, String company, String description, List<String> technologies, IconData icon, Color color) {
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
        border: Border.all(
          color: color.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1A202C),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      company,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4A5568),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: technologies.map((tech) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: color.withValues(alpha: 0.2)),
              ),
              child: Text(
                tech,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String count, String description, IconData icon, Color color) {
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
          const SizedBox(height: 8),
          Text(
            count,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 14,
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

  Widget _buildStatCard(String value, String label, IconData icon, Color color) {
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
            value,
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF1A202C),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentProjectCard(String title, String company, String description, IconData icon, Color color) {
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
          const SizedBox(height: 8),
          Text(
            company,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 14,
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
