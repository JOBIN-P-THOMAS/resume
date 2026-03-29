import 'package:flutter/material.dart';

/// Used for project list filtering (Embedded / Hardware / Software).
enum ProjectDomain {
  embedded,
  hardware,
  software,
}

extension ProjectDomainLabel on ProjectDomain {
  String get label {
    switch (this) {
      case ProjectDomain.embedded:
        return 'Embedded';
      case ProjectDomain.hardware:
        return 'Hardware';
      case ProjectDomain.software:
        return 'Software';
    }
  }
}

class CaseStudy {
  final String title;
  final String company;
  final String problem;
  final String solution;
  final List<String> keyChallenges;
  final List<String> whatYouDid;
  final List<String> techStack;
  final String outcome;
  final Set<ProjectDomain> domains;
  final String imagePath;
  final Color color;
  final IconData icon;
  final bool highlight;

  const CaseStudy({
    required this.title,
    required this.company,
    required this.problem,
    required this.solution,
    required this.keyChallenges,
    required this.whatYouDid,
    required this.techStack,
    required this.outcome,
    required this.domains,
    required this.imagePath,
    required this.color,
    required this.icon,
    this.highlight = false,
  });
}

/// Primary portfolio case studies — order matches product-engineering emphasis.
List<CaseStudy> get allCaseStudies => [
      const CaseStudy(
        title: 'Cooking Robot — Full Product Lifecycle',
        company: 'NOSH Robotics',
        problem:
            'Ship a reliable food robot: tight electromechanical coupling, factory variance, and firmware that must survive real kitchens—not demo benches.',
        solution:
            'Owned hardware–firmware co-design across subsystems, built validation rigs, and iterated with manufacturing until the product met performance and reliability targets in deployment.',
        keyChallenges: [
          'Balancing motion, thermal, and food safety constraints in one machine.',
          'Closing the loop between R&D builds and line-ready assemblies.',
          'Keeping firmware maintainable as mechanics and BOM evolved.',
        ],
        whatYouDid: [
          'Contributed end-to-end across PCBs, STM32-class firmware, bring-up, and test infrastructure.',
          'Designed a large share of subassemblies and mechanisms; drove integration and failure analysis.',
          'Worked with production on issues that only appear at scale—noise, tolerance stack-up, supplier spread.',
        ],
        techStack: [
          'STM32',
          'Renesas',
          'ESP32',
          'KiCad',
          'Fusion 360',
          'RTOS / bare-metal',
          'Production test',
        ],
        outcome:
            'Delivered a field-deployed cooking platform with customer-facing reliability work—not a one-off prototype.',
        domains: {ProjectDomain.embedded, ProjectDomain.hardware},
        imagePath: 'assets/images/projects/nosh/cooking_robot.jpg',
        color: Color(0xFF667EEA),
        icon: Icons.restaurant,
        highlight: true,
      ),
      const CaseStudy(
        title: 'RTOS Motor Control — Encoders, PID, Multi-Axis Logic',
        company: 'NOSH Robotics / Product R&D',
        problem:
            'Motors had to follow trajectories with encoder feedback under load, with direction and position logic tightly coupled—classic “works on the bench, fails in the machine” territory.',
        solution:
            'Structured motor tasks under an RTOS, separated sensing, control, and actuation paths, and tuned PID against real mechanical backlash and friction.',
        keyChallenges: [
          'PID tuning when plant dynamics change with wear and temperature.',
          'RTOS task timing vs. encoder interrupt load.',
          'Coordinating multiple motors without priority inversions or missed deadlines.',
        ],
        whatYouDid: [
          'Implemented interrupt-driven encoder reads, timers, and DMA where it reduced jitter.',
          'Built PID loops with sane anti-windup and rate limits tuned on hardware.',
          'Debugged integration issues between firmware assumptions and mechanical reality.',
        ],
        techStack: [
          'STM32',
          'Timers / interrupts',
          'RTOS tasks & sync',
          'PID',
          'Encoders',
        ],
        outcome:
            'Stable motion suitable for a product: repeatable positioning and controlled dynamics under real loads.',
        domains: {ProjectDomain.embedded},
        imagePath: 'assets/images/projects/nosh/cooking_robot.jpg',
        color: Color(0xFF48BB78),
        icon: Icons.precision_manufacturing,
        highlight: true,
      ),
      const CaseStudy(
        title: 'CAN-Based Bike Control System',
        company: 'R&D / Vehicle electronics',
        problem:
            'Vehicle subsystems needed deterministic, noise-tolerant communication between controllers without spaghetti harnesses.',
        solution:
            'Implemented a CAN-centric control architecture with clear message contracts and real-time friendly handling on the MCU side.',
        keyChallenges: [
          'Bus arbitration, timing, and fault handling in a moving platform.',
          'Keeping control logic deterministic alongside non-critical traffic.',
        ],
        whatYouDid: [
          'Defined practical frame layouts and validation paths.',
          'Implemented receive/transmit paths with filtering and error awareness.',
          'Verified behavior on hardware with real bus loading and edge cases.',
        ],
        techStack: ['CAN', 'STM32', 'C', 'Hardware integration'],
        outcome:
            'A maintainable control backbone suitable for iterative vehicle firmware updates.',
        domains: {ProjectDomain.embedded, ProjectDomain.hardware},
        imagePath: 'assets/images/PCB.jpg',
        color: Color(0xFFED8936),
        icon: Icons.two_wheeler,
        highlight: true,
      ),
      const CaseStudy(
        title: 'Bootloader — USB CDC + UART Firmware Update (STM32F411)',
        company: 'Firmware infrastructure',
        problem:
            'Field and lab teams needed a safe, repeatable way to update firmware without a full debugger—UART for bring-up, USB where available.',
        solution:
            'Developed a bootloader flow with dual transport support, robust packet handling, and flash lifecycle rules aligned with STM32 constraints.',
        keyChallenges: [
          'Vector table remapping and clean handoff to application firmware.',
          'Recovery paths when updates are interrupted.',
          'USB CDC stack integration vs. lean UART fallback.',
        ],
        whatYouDid: [
          'Implemented update protocol, flash programming sequences, and verification.',
          'Tested corner cases: power loss mid-write, bad images, baud mismatches.',
          'Documented the bring-up procedure for the team.',
        ],
        techStack: ['STM32F411', 'USB CDC', 'UART', 'Flash', 'C'],
        outcome:
            'Practical OTA-minded update capability: faster iteration in development and a path toward field updates.',
        domains: {ProjectDomain.embedded, ProjectDomain.software},
        imagePath: 'assets/images/projects/nosh/pcb_testing.jpg',
        color: Color(0xFF9F7AEA),
        icon: Icons.system_update_alt,
        highlight: true,
      ),
      const CaseStudy(
        title: 'ESP32 Audio + Display + SD (MP3-style System)',
        company: 'Embedded product concept',
        problem:
            'Deliver a self-contained module that plays media, shows UI, and stores content locally—without turning into a fragile wiring mess.',
        solution:
            'Integrated ESP32 with SD storage, display stack, and Bluetooth audio path with disciplined power and layout considerations.',
        keyChallenges: [
          'Power integrity and noise coupling into audio.',
          'SD throughput vs. UI responsiveness.',
          'Thermal and layout constraints around RF.',
        ],
        whatYouDid: [
          'Brought up SD, display, and audio paths incrementally.',
          'Tuned software partitioning for responsive UI and stable playback.',
          'Iterated PCB and grounding to reduce audible noise.',
        ],
        techStack: ['ESP32', 'ESP-IDF', 'SDMMC/SPI', 'Bluetooth audio', 'Display'],
        outcome:
            'A credible integrated prototype: local media, UI feedback, and wireless audio in one build.',
        domains: {ProjectDomain.embedded, ProjectDomain.hardware, ProjectDomain.software},
        imagePath: 'assets/images/123.jpg',
        color: Color(0xFF38B2AC),
        icon: Icons.audiotrack,
        highlight: true,
      ),
      const CaseStudy(
        title: 'Production PCB Failure — Root Cause to Fix',
        company: 'NOSH Robotics',
        problem:
            'Boards passed basic checks yet failed in the plant: intermittent I2C, reset anomalies, and EMI-sensitive edges that only showed up under real loads and cabling.',
        solution:
            'Treat it like a signal-integrity and grounding problem first: scope the bus, verify return paths, and fix the BOM/layout—not patch in software forever.',
        keyChallenges: [
          'Separating analog/digital noise paths from “looks fine” bench tests.',
          'I2C length, stubs, and buffer choice under capacitive loading.',
          'Validating the fix at volume, not just on one golden board.',
        ],
        whatYouDid: [
          'Correlated failures with specific nets, connectors, and mechanical flex.',
          'Applied decoupling, ferrite/bead strategy, and π-filter discipline after bucks where needed.',
          'Worked with CM on repeatability: test points, limits, and escape plans.',
        ],
        techStack: [
          'Scopes & logic analyzers',
          'I2C / UART debug',
          'EMI awareness',
          'PCB rework',
          'Validation',
        ],
        outcome:
            'Reduced line-down risk: a documented fix, measurable improvement, and fewer “ghost” failures.',
        domains: {ProjectDomain.hardware, ProjectDomain.embedded},
        imagePath: 'assets/images/projects/nosh/pcb_testing.jpg',
        color: Color(0xFFF56565),
        icon: Icons.bug_report,
        highlight: true,
      ),
      const CaseStudy(
        title: 'PCB Functional Test — Custom Rig, Measurable Yield',
        company: 'NOSH Robotics',
        problem:
            'Manual test was slow and inconsistent; the line needed repeatable coverage for complex I/O and programming steps.',
        solution:
            'Built a dedicated functional test platform with expanded I/O and structured sequences so each board earned a traceable pass/fail.',
        keyChallenges: [
          'Mapping hundreds of digital nodes reliably.',
          'Keeping test time compatible with takt.',
          'Hardware abstraction so firmware updates don’t break the rig.',
        ],
        whatYouDid: [
          'Designed rig architecture around STM32 and I/O expanders.',
          'Implemented test flows and failure bucketing for engineering feedback.',
          'Iterated fixtures and probing for operator ergonomics.',
        ],
        techStack: ['STM32', 'PCF8575', 'KiCad', 'Test automation'],
        outcome:
            'Higher first-pass yield visibility and faster feedback to design when drift appeared.',
        domains: {ProjectDomain.embedded, ProjectDomain.hardware},
        imagePath: 'assets/images/projects/nosh/pcb_testing.jpg',
        color: Color(0xFF48BB78),
        icon: Icons.memory,
      ),
      const CaseStudy(
        title: 'Wire Harness Test — Cost-Effective Line Coverage',
        company: 'NOSH Robotics',
        problem:
            'A large harness count made commercial solutions economically painful; mistakes still had to be caught before integration.',
        solution:
            'End-to-end harness tester: continuity, ordering checks, and operator-friendly workflow tuned to the actual BOM.',
        keyChallenges: [
          'Scaling to 100+ wires without unmaintainable complexity.',
          'Keeping the setup portable enough to live on the floor.',
        ],
        whatYouDid: [
          'Defined test methodology and fault reporting.',
          'Built hardware and sequencing around STM32 control paths.',
          'Reduced recurring cost versus outsourced alternatives.',
        ],
        techStack: ['STM32', 'Production QC', 'Automation'],
        outcome:
            'Strong QC coverage at a fraction of vendor test-bench cost—repeatable and shop-floor friendly.',
        domains: {ProjectDomain.embedded, ProjectDomain.hardware},
        imagePath: 'assets/images/projects/nosh/wire_harness.jpg',
        color: Color(0xFFED8936),
        icon: Icons.electric_bolt,
      ),
      const CaseStudy(
        title: 'Lock Box — BLE, RFID, Cloud',
        company: 'Freelance / Virtual clients',
        problem:
            'Secure access device needed reliable wireless behavior, field updates, and integration with cloud workflows.',
        solution:
            'Prototype-to-product path: Arduino-class bring-up, then Nordic-class integration with clearer power and RF margins.',
        keyChallenges: [
          'Security vs. UX tradeoffs in constrained hardware.',
          'RF performance in real enclosures.',
        ],
        whatYouDid: [
          'Firmware bring-up across prototype MCUs.',
          'Worked through connectivity edge cases and power profiles.',
        ],
        techStack: ['Arduino', 'Nordic', 'BLE', 'RFID', 'AWS'],
        outcome:
            'A credible path from bench prototype to a more integrated RF stack with clearer manufacturing margins.',
        domains: {ProjectDomain.embedded, ProjectDomain.software},
        imagePath: 'assets/images/projects/automation/lockbox.jpg',
        color: Color(0xFF667EEA),
        icon: Icons.lock,
      ),
      const CaseStudy(
        title: 'Industrial Automation — Virgin Coconut Oil Line',
        company: 'Green Valley Oils',
        problem:
            'Mechanical process steps needed safe automation: timing, interlocks, and embedded control that survives an industrial environment.',
        solution:
            'STM32-centered control with attention to sensors, actuators, and failure modes—not just “make it move.”',
        keyChallenges: [
          'Safety and sequencing.',
          'Environmental stress on electronics.',
        ],
        whatYouDid: [
          'Embedded control for separation/packaging workflows.',
          'On-site iteration with operators.',
        ],
        techStack: ['STM32', 'Industrial automation', 'Safety thinking'],
        outcome:
            'Operator-aligned automation: fewer manual steps and clearer fault behavior on the line.',
        domains: {ProjectDomain.embedded, ProjectDomain.hardware},
        imagePath: 'assets/images/projects/automation/green_valley.jpg',
        color: Color(0xFF48BB78),
        icon: Icons.factory,
      ),
    ];
