import 'package:flutter/material.dart';
import 'package:eqipped_test/brands/modal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomImage extends StatefulWidget {
  final String imageURL;
  const CustomImage({Key? key, required this.imageURL}) : super(key: key);

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late ImageStream _imageStream;
  late ImageInfo _imageInfo;

  late ImageDetail _imageDetail;
  late ImageValueNotifier _imageValueNotifier;

  @override
  void initState() {
    _imageDetail = ImageDetail();
    _imageValueNotifier = ImageValueNotifier(_imageDetail);

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));

    _animation = Tween<double>(begin: 600.0, end: 400.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    super.initState();

    _imageStream = NetworkImage(widget.imageURL +
            '?${DateTime.now().millisecondsSinceEpoch.toString()}')
        .resolve(const ImageConfiguration());

    _imageStream.addListener(
      ImageStreamListener(
        (info, value) {
          _imageInfo = info;
          _imageValueNotifier.changeLoadingState(true);
          _controller.forward();
        },
        onChunk: (event) {
          _imageValueNotifier
              .changeCumulativeBytesLoaded(event.expectedTotalBytes!);
          _imageValueNotifier
              .changeCumulativeBytesLoaded(event.cumulativeBytesLoaded);
        },
      ),
    );
  }

  @override
  void dispose() {
    _imageInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _imageValueNotifier,
      builder: (context, ImageDetail value, child) {
        return Container(
          height: 400.0,
          width: 300.0,
          margin: const EdgeInsets.all(15.0),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: !value.isLoaded
              ? Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: Colors.white,
                    size: 40,
                  ),
                )
              : Center(
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return OverflowBox(
                        minHeight: 400.0,
                        maxHeight: 600.0,
                        minWidth: 300.0,
                        maxWidth: 500.0,
                        child: SizedBox(
                          height: _animation.value,
                          width: _animation.value - 100.0,
                          child: child,
                        ),
                      );
                    },
                    child: RawImage(
                      image: _imageInfo.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
