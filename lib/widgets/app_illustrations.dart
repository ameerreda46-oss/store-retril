import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// App Logo displayed on Splash Screen (Screenshot 2)
class AppLogoWidget extends StatelessWidget {
  final double size;
  const AppLogoWidget({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Shopping Bag with LS logo styling
        Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(12),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(size * 0.8, size * 0.8),
                painter: _BagLogoPainter(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // 'store' text in orange
        Text(
          'store',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: size * 0.26,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontFamily: 'sans-serif',
          ),
        ),
        // 'RETAIL' text in dark navy/brown
        Text(
          'RETAIL',
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: size * 0.12,
            fontWeight: FontWeight.w900,
            letterSpacing: 6.0,
          ),
        ),
      ],
    );
  }
}

class _BagLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Handle (Bag straps)
    final handlePaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.1
      ..strokeCap = StrokeCap.round;

    final handlePath = Path();
    handlePath.moveTo(w * 0.32, h * 0.35);
    handlePath.cubicTo(w * 0.32, h * 0.05, w * 0.68, h * 0.05, w * 0.68, h * 0.35);
    canvas.drawPath(handlePath, handlePaint);

    // Main Bag Body (Top Orange, Bottom Brown/Dark Shadow)
    final bagPath = Path()
      ..moveTo(w * 0.18, h * 0.32)
      ..lineTo(w * 0.82, h * 0.32)
      ..quadraticBezierTo(w * 0.88, h * 0.32, w * 0.9, h * 0.4)
      ..lineTo(w * 0.82, h * 0.85)
      ..quadraticBezierTo(w * 0.8, h * 0.92, w * 0.72, h * 0.92)
      ..lineTo(w * 0.28, h * 0.92)
      ..quadraticBezierTo(w * 0.2, h * 0.92, w * 0.18, h * 0.85)
      ..lineTo(w * 0.1, h * 0.4)
      ..quadraticBezierTo(w * 0.12, h * 0.32, w * 0.18, h * 0.32)
      ..close();

    final bagGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.primary,
        AppColors.primary,
        const Color(0xFFB83B00),
      ],
      stops: const [0.0, 0.65, 1.0],
    );

    final bagPaint = Paint()
      ..shader = bagGradient.createShader(Rect.fromLTWH(0, 0, w, h))
      ..style = PaintingStyle.fill;

    canvas.drawPath(bagPath, bagPaint);

    // Inner White 'LS' letter graphic cut-out/overlay
    final lsPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.11
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final lsPath = Path();
    // L
    lsPath.moveTo(w * 0.32, h * 0.45);
    lsPath.lineTo(w * 0.32, h * 0.75);
    lsPath.lineTo(w * 0.52, h * 0.75);
    // S
    lsPath.moveTo(w * 0.68, h * 0.48);
    lsPath.lineTo(w * 0.52, h * 0.48);
    lsPath.lineTo(w * 0.52, h * 0.62);
    lsPath.lineTo(w * 0.68, h * 0.62);
    lsPath.lineTo(w * 0.68, h * 0.75);
    lsPath.lineTo(w * 0.52, h * 0.75);

    canvas.drawPath(lsPath, lsPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Welcome Illustration matching Screenshot 1
class WelcomeIllustrationWidget extends StatelessWidget {
  const WelcomeIllustrationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background soft circles & box
          Positioned(
            right: 20,
            bottom: 40,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF2D6),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          CustomPaint(
            size: const Size(320, 260),
            painter: _WelcomeIllustrationPainter(),
          ),
        ],
      ),
    );
  }
}

class _WelcomeIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Oranges in background box
    final orangePaint = Paint()..color = const Color(0xFFFF9800);
    final orangeDarkPaint = Paint()..color = const Color(0xFFE65100);

    for (int i = 0; i < 6; i++) {
      double ox = w * 0.62 + (i % 3) * 22;
      double oy = h * 0.42 - (i ~/ 3) * 20;
      canvas.drawCircle(Offset(ox, oy), 14, orangePaint);
      canvas.drawCircle(Offset(ox + 4, oy - 4), 3, Paint()..color = Colors.white.withOpacity(0.5));
    }

    // Person - Woman running/jumping (Rust Red & Orange dress)
    final personPaint = Paint()..color = const Color(0xFFE65100);
    final skinPaint = Paint()..color = const Color(0xFF4A154B); // Dark silhouette/brown
    final skirtPaint = Paint()..color = const Color(0xFF8B263E);

    // Hair bun & head
    canvas.drawCircle(Offset(w * 0.38, h * 0.28), 16, skinPaint);
    canvas.drawCircle(Offset(w * 0.34, h * 0.26), 8, skinPaint); // Bun

    // Arm holding orange up
    canvas.drawCircle(Offset(w * 0.5, h * 0.22), 10, orangePaint); // Orange held up

    // Body/Skirt
    final bodyPath = Path()
      ..moveTo(w * 0.35, h * 0.33)
      ..quadraticBezierTo(w * 0.2, h * 0.42, w * 0.38, h * 0.52)
      ..lineTo(w * 0.48, h * 0.37)
      ..close();
    canvas.drawPath(bodyPath, personPaint);

    final skirtPath = Path()
      ..moveTo(w * 0.38, h * 0.52)
      ..lineTo(w * 0.4, h * 0.75)
      ..lineTo(w * 0.34, h * 0.75)
      ..lineTo(w * 0.2, h * 0.5)
      ..close();
    canvas.drawPath(skirtPath, skirtPaint);

    // Shopping Cart Outline
    final cartPaint = Paint()
      ..color = const Color(0xFF263238)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final cartPath = Path()
      ..moveTo(w * 0.42, h * 0.5) // Handle
      ..lineTo(w * 0.52, h * 0.5)
      ..lineTo(w * 0.58, h * 0.75)
      ..lineTo(w * 0.76, h * 0.75)
      ..lineTo(w * 0.8, h * 0.52)
      ..lineTo(w * 0.5, h * 0.52);

    canvas.drawPath(cartPath, cartPaint);

    // Cart grid lines
    canvas.drawLine(Offset(w * 0.56, h * 0.58), Offset(w * 0.78, h * 0.58), cartPaint);
    canvas.drawLine(Offset(w * 0.54, h * 0.66), Offset(w * 0.77, h * 0.66), cartPaint);

    canvas.drawLine(Offset(w * 0.6, h * 0.52), Offset(w * 0.62, h * 0.75), cartPaint);
    canvas.drawLine(Offset(w * 0.68, h * 0.52), Offset(w * 0.7, h * 0.75), cartPaint);

    // Wheels
    canvas.drawCircle(Offset(w * 0.58, h * 0.8), 5, cartPaint..style = PaintingStyle.fill);
    canvas.drawCircle(Offset(w * 0.74, h * 0.8), 5, cartPaint);

    // Scattered Oranges at bottom
    canvas.drawCircle(Offset(w * 0.26, h * 0.78), 8, orangePaint);
    canvas.drawCircle(Offset(w * 0.78, h * 0.78), 7, orangeDarkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Auth Illustration matching Screenshot 3 & 8 (Sign Up / Sign In)
class AuthIllustrationWidget extends StatelessWidget {
  final bool isSignIn;
  const AuthIllustrationWidget({super.key, this.isSignIn = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background organic blob shape
          Container(
            width: 220,
            height: 160,
            decoration: BoxDecoration(
              color: isSignIn ? const Color(0xFFFFD8B3) : const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(80),
                topRight: const Radius.circular(40),
                bottomLeft: const Radius.circular(30),
                bottomRight: const Radius.circular(70),
              ),
            ),
          ),
          // Smartphone & Lock/Key graphic
          CustomPaint(
            size: const Size(180, 180),
            painter: _AuthIllustrationPainter(isSignIn: isSignIn),
          ),
        ],
      ),
    );
  }
}

class _AuthIllustrationPainter extends CustomPainter {
  final bool isSignIn;
  _AuthIllustrationPainter({required this.isSignIn});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Phone outline
    final phonePaint = Paint()
      ..color = const Color(0xFFB71C1C) // Dark red/burgundy phone border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0;

    final phoneFill = Paint()..color = const Color(0xFFFFB74D); // Orange/yellow phone screen

    final phoneRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.32, h * 0.15, w * 0.36, h * 0.65),
      const Radius.circular(16),
    );

    canvas.drawRRect(phoneRect, phoneFill);
    canvas.drawRRect(phoneRect, phonePaint);

    if (isSignIn) {
      // Key graphic entering phone
      final keyPaint = Paint()
        ..color = const Color(0xFF8D6E63)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6.0;

      final keyFill = Paint()..color = const Color(0xFF8D6E63);

      // Key handle circle
      canvas.drawCircle(Offset(w * 0.72, h * 0.45), 14, keyPaint);
      canvas.drawLine(Offset(w * 0.62, h * 0.45), Offset(w * 0.42, h * 0.45), keyPaint);
      canvas.drawRect(Rect.fromLTWH(w * 0.46, h * 0.45, 6, 8), keyFill);
    } else {
      // Lock & dots graphics on screen
      final lockBox = Paint()..color = const Color(0xFFB71C1C);
      final whiteDots = Paint()..color = Colors.white;

      // Dots field
      for (int i = 0; i < 4; i++) {
        canvas.drawCircle(Offset(w * 0.39 + i * 8, h * 0.35), 2.5, whiteDots);
      }

      // Lock icon box
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(w * 0.4, h * 0.42, w * 0.2, h * 0.15),
          const Radius.circular(6),
        ),
        lockBox,
      );

      final lockShackle = Paint()
        ..color = const Color(0xFFB71C1C)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      final shacklePath = Path();
      shacklePath.moveTo(w * 0.45, h * 0.42);
      shacklePath.cubicTo(w * 0.45, h * 0.36, w * 0.55, h * 0.36, w * 0.55, h * 0.42);
      canvas.drawPath(shacklePath, lockShackle);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Food product visual representation
class ProductImageWidget extends StatelessWidget {
  final String emoji;
  final double size;
  final Color? bgColor;

  const ProductImageWidget({
    super.key,
    required this.emoji,
    this.size = 80,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor ?? Colors.grey.shade50,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        emoji,
        style: TextStyle(fontSize: size * 0.55),
      ),
    );
  }
}
