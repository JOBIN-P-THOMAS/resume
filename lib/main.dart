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

class ResumeApp extends StatefulWidget {
  const ResumeApp({super.key});

  @override
  State<ResumeApp> createState() => _ResumeAppState();
}

class _ResumeAppState extends State<ResumeApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  static const _seed = Color(0xFF5B6CF0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobin P Thomas — Embedded & Product Engineering',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seed,
          brightness: Brightness.light,
          surface: const Color(0xFFFAFBFC),
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
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seed,
          brightness: Brightness.dark,
          surface: const Color(0xFF12151A),
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
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
      home: MainResumeScreen(
        themeMode: _themeMode,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}

class MainResumeScreen extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  const MainResumeScreen({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });

  @override
  State<MainResumeScreen> createState() => _MainResumeScreenState();
}

class _MainResumeScreenState extends State<MainResumeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(onNavigateToPage: _onItemTapped),
      const AboutScreen(),
      const SkillsScreen(),
      const ProjectsScreen(),
      const ExperienceScreen(),
      const ContactScreen(),
    ];
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

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 768;
    final showDesktopNav = width > 768;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            Material(
              elevation: 2,
              shadowColor: Colors.black.withValues(alpha: 0.08),
              color: scheme.surface,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    scheme.primary,
                                    scheme.primary.withValues(alpha: 0.75),
                                  ],
                                ),
                              ),
                              child: Icon(
                                Icons.memory,
                                color: scheme.onPrimary,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Flexible(
                              child: Text(
                                'JOBIN P THOMAS',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: scheme.onSurface,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (showDesktopNav)
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildNavItem(0, 'Home'),
                                  _buildNavItem(1, 'About'),
                                  _buildNavItem(2, 'Skills'),
                                  _buildNavItem(3, 'Projects'),
                                  _buildNavItem(4, 'Experience'),
                                  _buildNavItem(5, 'Contact'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      IconButton(
                        tooltip: widget.themeMode == ThemeMode.dark ? 'Light mode' : 'Dark mode',
                        onPressed: widget.onToggleTheme,
                        icon: Icon(
                          widget.themeMode == ThemeMode.dark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                          color: scheme.onSurface,
                        ),
                      ),
                      if (isMobile)
                        IconButton(
                          onPressed: () => _showMobileMenu(context),
                          icon: Icon(
                            Icons.menu,
                            color: scheme.onSurface,
                            size: 26,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: _pages,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String title) {
    final scheme = Theme.of(context).colorScheme;
    final isSelected = _currentIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: () => _onItemTapped(index),
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? scheme.primaryContainer.withValues(alpha: 0.55) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? scheme.primary : scheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      backgroundColor: scheme.surface,
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
                color: scheme.outline.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            ...List.generate(
              ['Home', 'About', 'Skills', 'Projects', 'Experience', 'Contact'].length,
              (index) => ListTile(
                leading: Icon(
                  _getIconForIndex(index),
                  color: _currentIndex == index ? scheme.primary : scheme.onSurfaceVariant,
                ),
                title: Text(
                  ['Home', 'About', 'Skills', 'Projects', 'Experience', 'Contact'][index],
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: _currentIndex == index ? FontWeight.w600 : FontWeight.w500,
                    color: _currentIndex == index ? scheme.primary : scheme.onSurface,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(index);
                },
                tileColor: _currentIndex == index ? scheme.primaryContainer.withValues(alpha: 0.35) : null,
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
      case 0:
        return Icons.home;
      case 1:
        return Icons.person;
      case 2:
        return Icons.psychology;
      case 3:
        return Icons.work;
      case 4:
        return Icons.business;
      case 5:
        return Icons.contact_mail;
      default:
        return Icons.home;
    }
  }
}
