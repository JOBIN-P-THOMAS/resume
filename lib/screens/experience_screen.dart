import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

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
                      'Professional Experience',
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
                        'A journey of continuous growth and innovation across multiple organizations, leading breakthrough projects and mentoring teams.',
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

            // Current Role Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Current Role',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1A202C),
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 80),
                  _buildExperienceCard(
                    'R&D Engineer',
                    'Nosh Robotics',
                    '2022 - Current',
                    'Bengaluru, Karnataka, India',
                    'Core contributor to the Nosh cooking robot\'s mechanical design, embedded firmware, and hardware. Spearheaded 70% of the machine\'s innovations, inventions, and mechanisms.',
                    [
                      'Led end-to-end product development from prototyping to continuous manufacturing',
                      'Established and led R&D team as head & go-to problem solver',
                      'Designed, coded, and fabricated all testing equipment for each development stage',
                      'Leveraged STM32, Renesas, ESP32, Arduino, CAD/CAM, and KiCad',
                    ],
                    ['STM32', 'Renesas', 'ESP32', 'Fusion 360', 'KiCad', 'Arduino'],
                    Icons.restaurant,
                    const Color(0xFF667EEA),
                  ),
                ],
              ),
            ),

            // Previous Experience Section
            Container(
              width: double.infinity,
              color: const Color(0xFFF7FAFC),
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Previous Experience',
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
                            Expanded(child: _buildExperienceCard(
                              'Product Development (Freelance)',
                              'Virtual Clients',
                              '2021 - 2022',
                              'Kerala, India',
                              'Developed innovative solutions for various clients across different industries.',
                              [
                                'Lock box system with Atmega MCU and ESP32 integration',
                                'Android app for secure data transfer',
                                'Product reverse engineering and optimization',
                                'Industrial automation with STM32 control systems',
                              ],
                              ['Atmega', 'ESP32', 'Android', 'STM32', 'IoT'],
                              Icons.work,
                              const Color(0xFF48BB78),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildExperienceCard(
                              'R&D Engineer',
                              'Lamaara Technologies',
                              '2019 - 2020',
                              'Kochi, India',
                              'Led water filter development from POC to DFM readiness.',
                              [
                                'Product development from concept to manufacturing',
                                'DFM optimization and cost reduction',
                                'Technical documentation and specifications',
                                'Cross-functional team collaboration',
                              ],
                              ['Product Development', 'DFM', 'Manufacturing', 'Documentation'],
                              Icons.water_drop,
                              const Color(0xFFED8936),
                            )),
                          ],
                        )
                      : Column(
                          children: [
                            _buildExperienceCard(
                              'Product Development (Freelance)',
                              'Virtual Clients',
                              '2021 - 2022',
                              'Kerala, India',
                              'Developed innovative solutions for various clients across different industries.',
                              [
                                'Lock box system with Atmega MCU and ESP32 integration',
                                'Android app for secure data transfer',
                                'Product reverse engineering and optimization',
                                'Industrial automation with STM32 control systems',
                              ],
                              ['Atmega', 'ESP32', 'Android', 'STM32', 'IoT'],
                              Icons.work,
                              const Color(0xFF48BB78),
                            ),
                            const SizedBox(height: 40),
                            _buildExperienceCard(
                              'R&D Engineer',
                              'Lamaara Technologies',
                              '2019 - 2020',
                              'Kochi, India',
                              'Led water filter development from POC to DFM readiness.',
                              [
                                'Product development from concept to manufacturing',
                                'DFM optimization and cost reduction',
                                'Technical documentation and specifications',
                                'Cross-functional team collaboration',
                              ],
                              ['Product Development', 'DFM', 'Manufacturing', 'Documentation'],
                              Icons.water_drop,
                              const Color(0xFFED8936),
                            ),
                          ],
                        ),
                ],
              ),
            ),

            // Early Career Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Early Career',
                    style: GoogleFonts.inter(
                      fontSize: 42,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1A202C),
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 80),
                  _buildExperienceCard(
                    'Embedded Engineer',
                    'Infusory Future Tech Labs Pvt. Ltd.',
                    '2016 - 2019',
                    'Palai, India',
                    'Began career in embedded systems and founded company focused on student education.',
                    [
                      'Started with Arduino, ESP8266, ESP32 during college',
                      'Founded company focused on student education',
                      'Conducted workshops in 3D printing, VR & AR robotics',
                      'Taught embedded hardware-software integration across 40+ colleges',
                    ],
                    ['Arduino', 'ESP8266', 'ESP32', 'KiCad', '3D Printing', 'VR/AR'],
                    Icons.school,
                    const Color(0xFF9F7AEA),
                  ),
                ],
              ),
            ),

            // Key Achievements Section
            Container(
              width: double.infinity,
              color: const Color(0xFFF7FAFC),
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
                  const SizedBox(height: 80),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 40,
                    crossAxisCount: isWide ? 3 : 2,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildAchievementCard(
                        '70% Innovation Rate',
                        'Led majority of innovations at Nosh Robotics',
                        Icons.lightbulb,
                        const Color(0xFF667EEA),
                      ),
                      _buildAchievementCard(
                        '40+ Colleges',
                        'Conducted workshops and training programs',
                        Icons.school,
                        const Color(0xFF48BB78),
                      ),
                      _buildAchievementCard(
                        '100+ Projects',
                        'Completed across multiple domains',
                        Icons.rocket_launch,
                        const Color(0xFFED8936),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Skills Summary Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Skills Summary',
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
                            Expanded(child: _buildSkillsCategory(
                              'Hardware & Embedded',
                              ['STM32', 'ATMEGA', 'ESP32', 'Renesas', 'Arduino', 'KiCad'],
                              Icons.memory,
                              const Color(0xFF667EEA),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildSkillsCategory(
                              'Software & Development',
                              ['Dart', 'Flutter', 'C/C++', 'Python', 'AWS', 'Firebase'],
                              Icons.code,
                              const Color(0xFF48BB78),
                            )),
                            const SizedBox(width: 40),
                            Expanded(child: _buildSkillsCategory(
                              'Design & Manufacturing',
                              ['Fusion 360', 'CAD/CAM', '3D Printing', 'CNC', 'Prototyping'],
                              Icons.build,
                              const Color(0xFFED8936),
                            )),
                          ],
                        )
                      : Column(
                          children: [
                            _buildSkillsCategory(
                              'Hardware & Embedded',
                              ['STM32', 'ATMEGA', 'ESP32', 'Renesas', 'Arduino', 'KiCad'],
                              Icons.memory,
                              const Color(0xFF667EEA),
                            ),
                            const SizedBox(height: 40),
                            _buildSkillsCategory(
                              'Software & Development',
                              ['Dart', 'Flutter', 'C/C++', 'Python', 'AWS', 'Firebase'],
                              Icons.code,
                              const Color(0xFF48BB78),
                            ),
                            const SizedBox(height: 40),
                            _buildSkillsCategory(
                              'Design & Manufacturing',
                              ['Fusion 360', 'CAD/CAM', '3D Printing', 'CNC', 'Prototyping'],
                              Icons.build,
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
                  const Icon(Icons.work_history, color: Colors.white, size: 80),
                  const SizedBox(height: 32),
                  Text(
                    'Ready to Leverage My Experience?',
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
                      'Let\'s discuss how my diverse experience in R&D, embedded systems, and product development can contribute to your organization\'s success.',
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

  Widget _buildExperienceCard(String title, String company, String period, String location, String description, List<String> achievements, List<String> technologies, IconData icon, Color color) {
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
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.schedule, color: const Color(0xFF4A5568), size: 18),
                        const SizedBox(width: 8),
                        Text(
                          period,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF4A5568),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(Icons.location_on, color: const Color(0xFF4A5568), size: 18),
                        const SizedBox(width: 8),
                        Text(
                          location,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF4A5568),
                          ),
                        ),
                      ],
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
          Text(
            'Key Achievements:',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A202C),
            ),
          ),
          const SizedBox(height: 16),
          ...achievements.map((achievement) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    achievement,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF4A5568),
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(height: 24),
          Text(
            'Technologies:',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A202C),
            ),
          ),
          const SizedBox(height: 16),
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

  Widget _buildAchievementCard(String title, String description, IconData icon, Color color) {
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
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A202C),
            ),
            textAlign: TextAlign.center,
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

  Widget _buildSkillsCategory(String title, List<String> skills, IconData icon, Color color) {
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
          const SizedBox(height: 20),
          ...skills.map((skill) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withValues(alpha: 0.2)),
            ),
            child: Text(
              skill,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          )),
        ],
      ),
    );
  }
}

