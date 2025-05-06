import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_style.dart';
import '../controllers/slide_controller.dart';

class SlideScreen extends GetView<SlideController> {
  const SlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Image.asset(
                controller.images[controller.index.value],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment(0, 0),
                key: ValueKey<int>(controller.index.value),
              ),
            ),
            Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      key: ValueKey(controller.index.value),
                      animatedTexts: [
                        TyperAnimatedText(
                          controller.text[controller.index.value],
                          textStyle: shdowTS,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                circles(
                  listLenth: controller.images.length,
                  index: controller.index.value,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: 272.w,
                      height: 77.h,
                      child: ElevatedButton(
                        onPressed: controller.nextFunction,
                        child: Text(
                          'بعدی',
                          textAlign: TextAlign.center,
                          style: infoTS,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Container circle({bool active = false}) {
  return Container(
    width: 16.w,
    height: 16.h,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: active ? red : yellow,
    ),
  );
}

Widget circles({required int listLenth, required int index}) {
  return Wrap(
    spacing: 40.w,
    alignment: WrapAlignment.center,
    children: List.generate(listLenth, (i) => circle(active: i == index)),
  );
}
