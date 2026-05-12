import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/l10n/l10n_extension.dart';
import '../../../../shared/theme/app_colors.dart';

// ─── Slide data ───────────────────────────────────────────────────────────────

class _SlideData {
  const _SlideData({
    required this.stepLabel,
    required this.title,
    required this.description,
    required this.heroBg,
    required this.accentColor,
    required this.iconWidget,
  });

  final String stepLabel;
  final String title;
  final String description;
  final Color heroBg;
  final Color accentColor;
  final Widget iconWidget;
}

// ─── Page ─────────────────────────────────────────────────────────────────────

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  int _currentPage = 0;

  List<_SlideData> _buildSlides(AppLocalizations l10n) => [
        _SlideData(
          stepLabel: l10n.onboardingSlide1StepLabel,
          title: l10n.onboardingSlide1Title,
          description: l10n.onboardingSlide1Description,
          heroBg: const Color(0xFFEEF2FB),
          accentColor: AppColors.splashBg,
          iconWidget: const _CalendarIcon(),
        ),
        _SlideData(
          stepLabel: l10n.onboardingSlide2StepLabel,
          title: l10n.onboardingSlide2Title,
          description: l10n.onboardingSlide2Description,
          heroBg: const Color(0xFFE8F5EE),
          accentColor: const Color(0xFF1A7F5A),
          iconWidget: const _CarIcon(color: Color(0xFF1A7F5A)),
        ),
        _SlideData(
          stepLabel: l10n.onboardingSlide3StepLabel,
          title: l10n.onboardingSlide3Title,
          description: l10n.onboardingSlide3Description,
          heroBg: const Color(0xFFF0EEF8),
          accentColor: const Color(0xFF4A3B8C),
          iconWidget: const _CloudSyncIcon(color: Color(0xFF4A3B8C)),
        ),
      ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onNext(int slideCount) {
    if (_currentPage < slideCount - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _onSkip() => _completeOnboarding();

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_onboarding', true);
    if (mounted) context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final slides = _buildSlides(l10n);
    final screenH = MediaQuery.of(context).size.height;
    final heroH = screenH * 0.38;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (i) => setState(() => _currentPage = i),
              itemCount: slides.length,
              itemBuilder: (_, i) => _SlidePage(
                slide: slides[i],
                heroHeight: heroH,
              ),
            ),
          ),
          _Footer(
            currentPage: _currentPage,
            total: slides.length,
            buttonLabel: _currentPage == slides.length - 1
                ? l10n.onboardingButtonStart
                : l10n.onboardingButtonNext,
            showSkip: _currentPage < slides.length - 1,
            onNext: () => _onNext(slides.length),
            onSkip: _onSkip,
          ),
        ],
      ),
    );
  }
}

// ─── Slide page ───────────────────────────────────────────────────────────────

class _SlidePage extends StatelessWidget {
  const _SlidePage({required this.slide, required this.heroHeight});

  final _SlideData slide;
  final double heroHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hero
        _HeroSection(
          height: heroHeight,
          bg: slide.heroBg,
          accent: slide.accentColor,
          iconWidget: slide.iconWidget,
        ),
        // Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  slide.stepLabel,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: const Color(0xFF75777D),
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  slide.title,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: AppColors.textPrimary,
                    height: 1.31,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  slide.description,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Hero section ─────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.height,
    required this.bg,
    required this.accent,
    required this.iconWidget,
  });

  final double height;
  final Color bg;
  final Color accent;
  final Widget iconWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background
          Positioned.fill(child: Container(color: bg)),
          // Deco circle top-right
          Positioned(
            right: -30,
            top: -40,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accent.withValues(alpha: 0.07),
              ),
            ),
          ),
          // Deco circle bottom-left
          Positioned(
            left: -20,
            bottom: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accent.withValues(alpha: 0.05),
              ),
            ),
          ),
          // Icon container (centered horizontally, ~35% from top of hero)
          Center(
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(24),
              ),
              child: iconWidget,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Footer ───────────────────────────────────────────────────────────────────

class _Footer extends StatelessWidget {
  const _Footer({
    required this.currentPage,
    required this.total,
    required this.buttonLabel,
    required this.showSkip,
    required this.onNext,
    required this.onSkip,
  });

  final int currentPage;
  final int total;
  final String buttonLabel;
  final bool showSkip;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            // Pagination dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(total, (i) {
                final isActive = i == currentPage;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 20.0 : 8.0,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.splashBg : AppColors.borderLight,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            // Primary button
            GestureDetector(
              onTap: onNext,
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.splashBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    buttonLabel,
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // Skip link
            SizedBox(
              height: 48,
              child: showSkip
                  ? TextButton(
                      onPressed: onSkip,
                      child: Text(
                        context.l10n.onboardingButtonSkip,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(0xFF75777D),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Custom icons ─────────────────────────────────────────────────────────────

// Slide 1: Calendar icon
class _CalendarIcon extends StatelessWidget {
  const _CalendarIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      height: 96,
      child: Stack(
        children: [
          // Main body (white, 32×28 at 32,34)
          Positioned(
            left: 32,
            top: 34,
            child: Container(
              width: 32,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          // Header highlight (white 40%, 32×10 at 32,34)
          Positioned(
            left: 32,
            top: 34,
            child: Container(
              width: 32,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          // Left pin (white, 4×10 at 38,28)
          Positioned(
            left: 38,
            top: 28,
            child: Container(
              width: 4,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Right pin (white, 4×10 at 54,28)
          Positioned(
            left: 54,
            top: 28,
            child: Container(
              width: 4,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Grid dots row 1
          for (final x in [34.0, 43.0, 52.0])
            Positioned(
              left: x,
              top: 50,
              child: Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.splashBg,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          // Grid dots row 2
          for (final x in [34.0, 43.0, 52.0])
            Positioned(
              left: x,
              top: 58,
              child: Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.splashBg,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Slide 2: Car icon
class _CarIcon extends StatelessWidget {
  const _CarIcon({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      height: 96,
      child: Stack(
        children: [
          // Car roof (30×14 at 33,37)
          Positioned(
            left: 33,
            top: 37,
            child: Container(
              width: 30,
              height: 14,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          // Car body (48×18 at 24,49)
          Positioned(
            left: 24,
            top: 49,
            child: Container(
              width: 48,
              height: 18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          // Left wheel outer (r=7 at 37,69)
          Positioned(
            left: 30,
            top: 62,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
          // Left wheel inner (r=3 at 37,69)
          Positioned(
            left: 34,
            top: 66,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
          // Right wheel outer (r=7 at 61,69)
          Positioned(
            left: 54,
            top: 62,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
          // Right wheel inner (r=3 at 61,69)
          Positioned(
            left: 58,
            top: 66,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}

// Slide 3: Cloud sync icon (painted)
class _CloudSyncIcon extends StatelessWidget {
  const _CloudSyncIcon({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(96, 96),
      painter: _CloudSyncPainter(bgColor: color),
    );
  }
}

class _CloudSyncPainter extends CustomPainter {
  const _CloudSyncPainter({required this.bgColor});
  final Color bgColor;

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = Colors.white;

    // All coords are relative to 96×96 container
    // SVG icon container: SVG (167,162) mapped to (0,0) within the 96×96 container
    // Ellipses (cloud body):
    //   cx=215-167=48, cy=209-162=47, rx=20, ry=13
    //   cx=201-167=34, cy=211-162=49, rx=14, ry=11
    //   cx=229-167=62, cy=211-162=49, rx=14, ry=11

    // Draw cloud (3 overlapping ellipses)
    canvas.drawOval(Rect.fromCenter(center: const Offset(34, 49), width: 28, height: 22), white);
    canvas.drawOval(Rect.fromCenter(center: const Offset(62, 49), width: 28, height: 22), white);
    canvas.drawOval(Rect.fromCenter(center: const Offset(48, 47), width: 40, height: 26), white);

    // Arrow stem + head drawn in white so they're visible against the purple container
    // (the portion inside the cloud blends in; below the cloud it shows as white-on-purple)
    final stemRect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(45, 52, 6, 20),
      const Radius.circular(3),
    );
    canvas.drawRRect(stemRect, white);

    final arrowPath = Path()
      ..moveTo(48, 66)
      ..lineTo(54, 72)
      ..lineTo(42, 72)
      ..close();
    canvas.drawPath(arrowPath, white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
