import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// Project data structure for easy management
class Project {
  final String title;
  final String company;
  final String description;
  final List<String> technologies;
  final String imagePath;
  final Color color;
  final IconData icon;

  const Project({
    required this.title,
    required this.company,
    required this.description,
    required this.technologies,
    required this.imagePath,
    required this.color,
    required this.icon,
  });
}

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  // Featured projects data - easy to add/remove/modify
  List<Project> get featuredProjects => [
    const Project(
      title: 'Nosh Cooking Robot',
      company: 'Nosh Robotics',
      description: 'Led R&D from concept to production, designed 80% of subassemblies, invented 4 mechanisms (3 patents pending), built testing equipment saving lakhs in labor costs.',
      technologies: ['STM32', 'Renesas', 'ESP32', 'Fusion 360', 'KiCad'],
      imagePath: 'assets/images/projects/nosh/cooking_robot.jpg',
      color: Color(0xFF667EEA),
      icon: Icons.restaurant,
    ),
    const Project(
      title: 'PCB Testing Equipment',
      company: 'Nosh Robotics',
      description: 'Designed and built comprehensive PCB testing setup achieving 47% success rate improvement. Custom testing equipment with STM32 and 13 PCF8575 I/O expanders.',
      technologies: ['STM32', 'PCF8575', 'KiCad', 'PCB Design', 'Testing'],
      imagePath: 'assets/images/projects/nosh/pcb_testing.jpg',
      color: Color(0xFF48BB78),
      icon: Icons.memory,
    ),
    const Project(
      title: 'Wire Harness Testing',
      company: 'Nosh Robotics',
      description: 'Built wire harness testing system for 100+ wires, reducing cost from 4.5L to 10K per setup. End-to-end solution for production quality control.',
      technologies: ['STM32', 'Testing', 'Automation', 'Production', 'Quality Control'],
      imagePath: 'assets/images/projects/nosh/wire_harness.jpg',
      color: Color(0xFFED8936),
      icon: Icons.electric_bolt,
    ),
  ];

  // Project categories data
  List<Map<String, dynamic>> get projectCategories => [
    {
      'title': 'R&D & Innovation',
      'count': '15',
      'description': 'Breakthrough technologies and patented mechanisms',
      'icon': Icons.lightbulb,
      'color': const Color(0xFF667EEA),
    },
    {
      'title': 'Embedded Systems',
      'count': '25',
      'description': 'MCU programming and hardware integration',
      'icon': Icons.memory,
      'color': const Color(0xFF48BB78),
    },
    {
      'title': 'Mechanical Design',
      'count': '20',
      'description': 'CAD/CAM, prototyping, and manufacturing',
      'icon': Icons.precision_manufacturing,
      'color': const Color(0xFFED8936),
    },
    {
      'title': 'Automation',
      'count': '12',
      'description': 'Industrial and consumer automation solutions',
      'icon': Icons.smart_toy,
      'color': const Color(0xFF9F7AEA),
    },
    {
      'title': 'Testing Equipment',
      'count': '8',
      'description': 'Custom testing and quality control systems',
      'icon': Icons.science,
      'color': const Color(0xFFF56565),
    },
    {
      'title': '3D Printing & CNC',
      'count': '10',
      'description': 'Custom machines and fabrication tools',
      'icon': Icons.print,
      'color': const Color(0xFF38B2AC),
    },
  ];

  // Recent projects data
  List<Project> get recentProjects => [
    const Project(
      title: 'Lock Box System (Virtual Clients)',
      company: 'Canadian Real Estate Sector',
      description: 'State-of-the-art lockbox with light, BLE, RFID, and AWS cloud integration. Prototyped on Arduino, scaled to Arduino Mega, finalized with Nordic MCU.',
      technologies: ['Arduino', 'Nordic MCU', 'BLE', 'RFID', 'AWS'],
      imagePath: 'assets/images/projects/automation/lockbox.jpg',
      color: Color(0xFF667EEA),
      icon: Icons.lock,
    ),
    const Project(
      title: 'Green Valley Oils Automation',
      company: 'Industrial Automation',
      description: '3-month contract focusing on mechanical and embedded automation for virgin coconut oil manufacturing. Automated separation, packaging, and safety systems.',
      technologies: ['STM32', 'Automation', 'Industrial', 'Safety Systems'],
      imagePath: 'assets/images/projects/automation/green_valley.jpg',
      color: Color(0xFF48BB78),
      icon: Icons.factory,
    ),
    const Project(
      title: 'Agriculture Robot',
      company: 'College Project',
      description: 'Seed dispensing and watering robot with CNC fabrication, VNHS2SP30 monster drive, and NRF24L01 wireless communication between MCUs.',
      technologies: ['CNC', 'VNHS2SP30', 'NRF24L01', 'Robotics'],
      imagePath: 'assets/images/projects/automation/agriculture_robot.jpg',
      color: Color(0xFFED8936),
      icon: Icons.agriculture,
    ),
    const Project(
      title: 'Ladoo Go Automation',
      company: 'Food Automation',
      description: 'Automated ladoo making machine with induction cooktops, Arduino Mega, Bluetooth relay, pneumatics, and stepper motors for precise food placement.',
      technologies: ['Arduino Mega', 'Bluetooth', 'Pneumatics', 'Stepper Motors'],
      imagePath: 'assets/images/projects/automation/ladoo_machine.jpg',
      color: Color(0xFF9F7AEA),
      icon: Icons.cake,
    ),
  ];

  // Project statistics data
  List<Map<String, dynamic>> get projectStats => [
    {
      'value': '100+',
      'label': 'Projects Completed',
      'icon': Icons.rocket_launch,
      'color': const Color(0xFF667EEA),
    },
    {
      'value': '4',
      'label': 'Patents Pending',
      'icon': Icons.verified,
      'color': const Color(0xFF48BB78),
    },
    {
      'value': '₹4.5L',
      'label': 'Cost Savings',
      'icon': Icons.savings,
      'color': const Color(0xFFED8936),
    },
    {
      'value': '80%',
      'label': 'Subassembly Design',
      'icon': Icons.engineering,
      'color': const Color(0xFF9F7AEA),
    },
  ];

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
                  isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: featuredProjects.map((project) => 
                            Expanded(child: _buildFeaturedProjectCard(project))
                          ).toList(),
                        )
                      : Column(
                          children: featuredProjects.map((project) => 
                            Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: _buildFeaturedProjectCard(project),
                            )
                          ).toList(),
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
                    children: projectCategories.map((category) => 
                      _buildCategoryCard(
                        category['title'],
                        category['count'],
                        category['description'],
                        category['icon'],
                        category['color'],
                      )
                    ).toList(),
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
                    'Project Impact',
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
                          children: projectStats.map((stat) => 
                            Expanded(child: _buildStatCard(
                              stat['value'],
                              stat['label'],
                              stat['icon'],
                              stat['color'],
                            ))
                          ).toList(),
                        )
                      : Column(
                          children: [
                            Row(
                              children: projectStats.take(2).map((stat) => 
                                Expanded(child: _buildStatCard(
                                  stat['value'],
                                  stat['label'],
                                  stat['icon'],
                                  stat['color'],
                                ))
                              ).toList(),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: projectStats.skip(2).take(2).map((stat) => 
                                Expanded(child: _buildStatCard(
                                  stat['value'],
                                  stat['label'],
                                  stat['icon'],
                                  stat['color'],
                                ))
                              ).toList(),
                            ),
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
                    'Other Projects',
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
                    crossAxisCount: isWide ? 2 : 1,
                    physics: NeverScrollableScrollPhysics(),
                    children: recentProjects.map((project) => 
                      _buildRecentProjectCard(project)
                    ).toList(),
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
                  const Icon(Icons.rocket_launch, color: Colors.white, size: 80),
                  const SizedBox(height: 32),
                  Text(
                    'Ready to See More?',
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
                      'This is just a glimpse of my extensive portfolio. I have many more projects showcasing my diverse skills in embedded systems, automation, and mechanical design.',
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
                            'Discuss Projects',
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

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  Widget _buildFeaturedProjectCard(Project project) {
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
          color: project.color.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: project.color.withValues(alpha: 0.1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                project.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  decoration: BoxDecoration(
                    color: project.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    project.icon,
                    size: 64,
                    color: project.color,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Project Icon and Company
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: project.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(project.icon, color: project.color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  project.company,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: project.color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Project Title
          Text(
            project.title,
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1A202C),
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          // Project Description
          Text(
            project.description,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4A5568),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          // Technologies
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.technologies.map((tech) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: project.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: project.color.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Text(
                tech,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: project.color,
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
          const SizedBox(height: 12),
          Text(
            count,
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: color,
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
              height: 1.5,
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
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4A5568),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentProjectCard(Project project) {
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
          color: project.color.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: project.color.withValues(alpha: 0.1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                project.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  decoration: BoxDecoration(
                    color: project.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    project.icon,
                    size: 48,
                    color: project.color,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Project Icon and Company
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: project.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(project.icon, color: project.color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  project.company,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: project.color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Project Title
          Text(
            project.title,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1A202C),
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          // Project Description
          Text(
            project.description,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF4A5568),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          // Technologies
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: project.technologies.take(4).map((tech) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: project.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: project.color.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Text(
                tech,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: project.color,
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
