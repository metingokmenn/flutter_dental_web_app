import 'package:get/get.dart';


class CounterController extends GetxController {
  RxInt count = 0.obs;
  bool isAnimating = false;

  void animateToValue(int target,
      {Duration duration = const Duration(seconds: 2)}) {
    if (isAnimating) return;
    isAnimating = true;
    count.value = 0;

    double stepsPerMs = target / duration.inMilliseconds;

    for (int ms = 0; ms <= duration.inMilliseconds; ms += 16) {
      int nextValue = (stepsPerMs * ms).round();
      if (nextValue > target) nextValue = target;

      Future.delayed(Duration(milliseconds: ms), () {
        count.value = nextValue;
        if (nextValue == target) {
          isAnimating = false;
        }
      });
    }
  }
}
