// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'dart:io';

import 'package:flutter_svg/svg.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';

class ImagePickerWidget extends StatelessWidget {
  final VoidCallback? onImagePick;
  final bool isImagePathSet;
  final bool isPicker;
  final String? imagePath;
  final String imageUrl;

  const ImagePickerWidget({
    super.key,
    this.onImagePick,
    this.isImagePathSet = false,
    this.imagePath,
    this.imageUrl = '',
    this.isPicker = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(
              width: 3.38,
              color: Theme.of(context).primaryColor,
            ),
            shape: BoxShape.circle,
          ),
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border.all(
                width: 5,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              shape: BoxShape.circle,
            ),
            child: isImagePathSet
                ? CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    radius: Dimensions.radius * 5.5,
                    backgroundImage: FileImage(
                      File(imagePath!),
                    ),
                  )
                : imageUrl != ''
                    ? CircleAvatar(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        radius: Dimensions.radius * 5.5,
                        backgroundImage: NetworkImage(imageUrl),
                      )
                    : const ShimmerCircle(),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 118,
          child: InkWell(
            onTap: onImagePick,
            child: Visibility(
              visible: isPicker,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.03),
                  border: Border.all(
                    width: 5,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  foregroundColor: Colors.transparent,
                  radius: Dimensions.radius * 1.5,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: SvgPicture.asset(
                    Assets.icon.bicamerafill,
                    color: CustomColor.whiteColor,
                    height: Dimensions.iconSizeDefault,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ShimmerCircle extends StatefulWidget {
  const ShimmerCircle({super.key});

  @override
  _ShimmerCircleState createState() => _ShimmerCircleState();
}

class _ShimmerCircleState extends State<ShimmerCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShimmerCirclePainter(animation: _animationController),
      child: SizedBox(
        /// >>> set static for fixed size
        width: 120.0.w,
        height: 120.0.h,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class ShimmerCirclePainter extends CustomPainter {
  final Animation<double> animation;

  ShimmerCirclePainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.shader = _createGradientShader(size, animation.value);

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  Shader _createGradientShader(Size size, double animationValue) {
    final List<Color> colors = [
      Colors.transparent,
      Colors.white.withOpacity(0.5),
      Colors.transparent,
    ];

    final stops = [0.0, 0.5, 1.0];

    // Move the gradient horizontally based on the animation value
    final double dx = size.width * animationValue - size.width;
    const double dy = 0;

    return LinearGradient(
      begin: const Alignment(-1.0, 0.0),
      end: const Alignment(2.0, 0.0),
      colors: colors,
      stops: stops,
      tileMode: TileMode.mirror,
    ).createShader(Rect.fromLTWH(dx, dy, size.width, size.height));
  }
}
