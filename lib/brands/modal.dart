import 'package:flutter/foundation.dart';

class ImageDetail {
  late bool isLoaded = false;
  late int cumulativeBytesLoaded = 0;
  late int expectedTotalBytes = 1;
}

class ImageValueNotifier extends ValueNotifier<ImageDetail> {
  late ImageDetail _imageDetail;

  ImageValueNotifier(imageDetail) : super(imageDetail) {
    _imageDetail = imageDetail;
  }

  void changeLoadingState(bool isLoaded) {
    _imageDetail.isLoaded = isLoaded;
    notifyListeners();
  }

  void changeCumulativeBytesLoaded(int cumulativeBytesLoaded) {
    _imageDetail.cumulativeBytesLoaded = cumulativeBytesLoaded;
    notifyListeners();
  }
}