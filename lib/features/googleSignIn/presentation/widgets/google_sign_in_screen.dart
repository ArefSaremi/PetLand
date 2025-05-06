import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/colors.dart';
import 'package:flutter_application_2/core/constants/icons.dart';
import 'package:flutter_application_2/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/google_sign_in_controller.dart';

class GoogleSignInScreen extends GetView<GoogleSignInController> {
  const GoogleSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor: red),
      body: Padding(
        padding: EdgeInsets.only(top: 100.h),
        child: Column(
          spacing: 100.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(MyIcons.logo, size: 100.sp, color: red),
                Text('پت\n لند', style: titleSignInTS),
              ],
            ),

            SizedBox(
              width: 300.w,
              height: 70.h,
              child: ElevatedButton(
                onPressed: controller.signIn,
                child: Row(
                  spacing: 10.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: 60.sp,
                      height: 60.sp,
                    ),
                    Text('ورود با حساب گوگل', style: signInTS),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
