import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/skills_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/experience_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JOBIN P THOMAS - R&D Engineer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF667EEA),
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.interTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: const MainResumeScreen(),
    );
  }
}

class MainResumeScreen extends StatefulWidget {
  const MainResumeScreen({super.key});

  @override
  State<MainResumeScreen> createState() => _MainResumeScreenState();
}

class _MainResumeScreenState extends State<MainResumeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const AboutScreen(),
    const SkillsScreen(),
    const ProjectsScreen(),
    const ExperienceScreen(),
    const ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            // Top Navigation Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Row(
                    children: [
                      // Logo/Name Section
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF667EEA),
                                  Color(0xFF764BA2),
                                ],
                              ),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'JOBIN P THOMAS',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF1A202C),
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      
                      const Spacer(),
                      
                      // Desktop Navigation
                      if (MediaQuery.of(context).size.width > 768)
                        Row(
                          children: [
                            _buildNavItem(0, 'Home'),
                            _buildNavItem(1, 'About'),
                            _buildNavItem(2, 'Skills'),
                            _buildNavItem(3, 'Projects'),
                            _buildNavItem(4, 'Experience'),
                            _buildNavItem(5, 'Contact'),
                          ],
                        ),
                      
                      // Mobile Menu Button
                      if (MediaQuery.of(context).size.width <= 768)
                        IconButton(
                          onPressed: () {
                            // Show mobile menu
                            _showMobileMenu(context);
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Color(0xFF1A202C),
                            size: 28,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Main Content
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: _screens,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String title) {
    final isSelected = _currentIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () => _onItemTapped(index),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF667EEA).withValues(alpha: 0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? const Color(0xFF667EEA) : const Color(0xFF4A5568),
            ),
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            ...List.generate(
              ['Home', 'About', 'Skills', 'Projects', 'Experience', 'Contact'].length,
              (index) => ListTile(
                leading: Icon(
                  _getIconForIndex(index),
                  color: _currentIndex == index ? const Color(0xFF667EEA) : const Color(0xFF4A5568),
                ),
                title: Text(
                  ['Home', 'About', 'Skills', 'Projects', 'Experience', 'Contact'][index],
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: _currentIndex == index ? FontWeight.w600 : FontWeight.w500,
                    color: _currentIndex == index ? const Color(0xFF667EEA) : const Color(0xFF1A202C),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(index);
                },
                tileColor: _currentIndex == index ? const Color(0xFF667EEA).withValues(alpha: 0.05) : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0: return Icons.home;
      case 1: return Icons.person;
      case 2: return Icons.psychology;
      case 3: return Icons.work;
      case 4: return Icons.business;
      case 5: return Icons.contact_mail;
      default: return Icons.home;
    }
  }
}
