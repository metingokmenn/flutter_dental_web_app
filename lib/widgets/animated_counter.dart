import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class AnimatedCounter extends StatefulWidget {
  final int targetValue;
  final TextStyle? style;
  final Duration duration;

  const AnimatedCounter({
    super.key,
    required this.targetValue,
    this.style,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> {
  late final CounterController controller;
  final String uniqueId = UniqueKey().toString();

  @override
  void initState() {
    super.initState();
    // Create a unique controller with a tag
    controller = Get.put(CounterController(), tag: uniqueId);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.animateToValue(widget.targetValue, duration: widget.duration);
    });
  }

  @override
  void dispose() {
    // Remove the controller when widget is disposed
    Get.delete<CounterController>(tag: uniqueId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      tag: uniqueId,
      builder: (controller) => Obx(() => Text(
            '${controller.count.value}+',
            style: widget.style ??
                const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
          )),
    );
  }
}
