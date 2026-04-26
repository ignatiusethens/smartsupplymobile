import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _loaderController;

  @override
  void initState() {
    super.initState();
    _loaderController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    // Navigate to home after 3 seconds (auth bypassed for preview)
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  void dispose() {
    _loaderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Background: subtle dot grid pattern
          Positioned.fill(
            child: CustomPaint(
              painter: _DotGridPainter(),
            ),
          ),

          // Background: cargo ship image overlay
          Positioned.fill(
            child: Opacity(
              opacity: 0.20,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuD4vy2ZHxTOUZv-cH95Pf0ixKNa0-s1jc1YqxjoRWE7h6rU2SEO7m14avNZBJFRyLF4qXgIGO25nTyS2H2iRFRNQreF2o-xf6YXJvFHnq6cNkdQyQUpMsG5i0lT-zuGcwaf3O6m-EJ3ZF1FXQA78rxGK4gnK76zGQJWBF4FkRcy-nk1ZZ3nnf0uVcwbZjaG75tYXfOq_pl9qszqgVX01blVESlw2ypZWf8KqbRBOvmXLkuBBo4LfTbuSGANlznywBMH5bRNyo_3I38',
                fit: BoxFit.cover,
                color: AppColors.primary,
                colorBlendMode: BlendMode.overlay,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ),

          // Decorative corner: top-left
          Positioned(
            top: 24,
            left: 24,
            child: SizedBox(
              width: 128,
              height: 128,
              child: CustomPaint(painter: _CornerPainter(topLeft: true)),
            ),
          ),

          // Decorative corner: bottom-right
          Positioned(
            bottom: 24,
            right: 24,
            child: SizedBox(
              width: 128,
              height: 128,
              child: CustomPaint(painter: _CornerPainter(topLeft: false)),
            ),
          ),

          // Main content
          Column(
            children: [
              // Top third: Logo + App name
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 48),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Logo box
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.hub,
                            color: AppColors.primary,
                            size: 48,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // App name
                        Text(
                          'Smart Supply\nSourcing China',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.headlineLg.copyWith(
                            color: AppColors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Middle third: Tagline
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Intelligence Driven Global Logistics & Strategic Procurement',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headlineSm.copyWith(
                        color: const Color(0xFFDCEEFF),
                        fontWeight: FontWeight.w300,
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom third: Loading indicator + version
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 48),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Label
                        Text(
                          'SYNCHRONIZING LEDGER',
                          style: AppTextStyles.labelLg.copyWith(
                            color: AppColors.white.withOpacity(0.8),
                            letterSpacing: 3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'v1.0.4 • B2B Procurement Secure Node',
                          style: AppTextStyles.labelSm.copyWith(
                            color: const Color(0xFF91BDFF).withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Spinning loader ring
                        RotationTransition(
                          turns: _loaderController,
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.white.withOpacity(0.1),
                                width: 4,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 4,
                                height: 4,
                                margin: const EdgeInsets.only(top: 0),
                                decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Dot grid background painter
class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 1;

    const spacing = 24.0;
    const dotRadius = 0.5;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Corner bracket painter
class _CornerPainter extends CustomPainter {
  final bool topLeft;
  const _CornerPainter({required this.topLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();
    if (topLeft) {
      path.moveTo(0, size.height);
      path.lineTo(0, 0);
      path.lineTo(size.width, 0);
    } else {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
