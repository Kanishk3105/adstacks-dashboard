import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/dashboard_card.dart';

class ProjectBanner extends StatelessWidget {
  const ProjectBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 700;
    return Container(
      height: isCompact ? 280 : 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AppColors.bannerGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPurple.withValues(alpha: 0.35),
            blurRadius: 40,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: -20,
            child: _ShapeDecoration(size: 180),
          ),
          Padding(
            padding: const EdgeInsets.all(28),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ETHEREUM 2.0',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: Colors.white.withValues(alpha: 0.85),
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Top Rating Project',
                        style: AppTextStyles.displayLarge.copyWith(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 420),
                        child: Text(
                          'Trending project and high rating Project Created by team.',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.white.withValues(alpha: 0.85),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const DarkPillButton(label: 'Learn More'),
                    ],
                  ),
                ),
                if (MediaQuery.sizeOf(context).width > 700)
                  const SizedBox(
                    width: 220,
                    height: 180,
                    child: _FloatingShapes(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ShapeDecoration extends StatelessWidget {
  const _ShapeDecoration({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _CirclePatternPainter(),
    );
  }
}

class _CirclePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.06)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.5),
      size.width * 0.35,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.5),
      size.width * 0.5,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _FloatingShapes extends StatelessWidget {
  const _FloatingShapes();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: const [
        _GeometricShape(
          color: Color(0xFFFF6B9D),
          size: 56,
          offset: Offset(-30, -20),
          shape: _ShapeType.torus,
        ),
        _GeometricShape(
          color: Color(0xFF6BFFB8),
          size: 48,
          offset: Offset(40, -30),
          shape: _ShapeType.pyramid,
        ),
        _GeometricShape(
          color: Color(0xFF6BCBFF),
          size: 44,
          offset: Offset(10, 35),
          shape: _ShapeType.cylinder,
        ),
        _GeometricShape(
          color: Color(0xFFFFD56B),
          size: 36,
          offset: Offset(-50, 40),
          shape: _ShapeType.sphere,
        ),
      ],
    );
  }
}

enum _ShapeType { torus, pyramid, cylinder, sphere }

class _GeometricShape extends StatelessWidget {
  const _GeometricShape({
    required this.color,
    required this.size,
    required this.offset,
    required this.shape,
  });

  final Color color;
  final double size;
  final Offset offset;
  final _ShapeType shape;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: CustomPaint(
        size: Size(size, size),
        painter: _ShapePainter(color: color, shape: shape),
      ),
    );
  }
}

class _ShapePainter extends CustomPainter {
  _ShapePainter({required this.color, required this.shape});

  final Color color;
  final _ShapeType shape;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [color, color.withValues(alpha: 0.7)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    switch (shape) {
      case _ShapeType.sphere:
        canvas.drawCircle(
          Offset(size.width / 2, size.height / 2),
          size.width / 2,
          paint,
        );
      case _ShapeType.cylinder:
        final rect = RRect.fromRectAndRadius(
          Rect.fromLTWH(0, size.height * 0.2, size.width, size.height * 0.6),
          const Radius.circular(8),
        );
        canvas.drawRRect(rect, paint);
      case _ShapeType.pyramid:
        final path = Path()
          ..moveTo(size.width / 2, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();
        canvas.drawPath(path, paint);
      case _ShapeType.torus:
        final center = Offset(size.width / 2, size.height / 2);
        canvas.drawCircle(center, size.width / 2, paint);
        canvas.drawCircle(
          center,
          size.width / 4,
          Paint()..blendMode = BlendMode.clear,
        );
    }
  }

  @override
  bool shouldRepaint(covariant _ShapePainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.shape != shape;
}
