import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/colors.dart';
import 'package:flutter_application_2/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';

import '../controllers/address_controller.dart';

class AddressScreen extends GetView<AddressController> {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String re = 'نام گیرنده';
    return Scaffold(
      appBar: AppBar(
        title: Text('ثبت آدرس', style: titleTS),
        centerTitle: true,
        backgroundColor: yellow,
        foregroundColor: red,
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
            child: Column(
              spacing: 20.h,
              children: [
                _textField(
                  re: re,
                  controller: controller.crecipientname,
                  icon: Icons.person,
                ),
                _textField(
                  re: 'شماره تماس',
                  controller: controller.cphonenumber,
                  icon: Icons.phone,
                  type: TextInputType.phone,
                ),
                _textField(
                  re: 'آدرس',
                  controller: controller.caddressline,
                  icon: Icons.location_on,
                ),
                _textField(
                  re: 'کد پستی',
                  controller: controller.cpostalcode,
                  icon: Icons.home,
                  type: TextInputType.number,
                ),
                _textField(
                  re: 'یادداشت های اضافی',
                  controller: controller.cadditionalnotes,
                  icon: Icons.note_add,
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    controller.registerAddress();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: red,
                    minimumSize: Size(200.w, 50.h),
                  ),
                  child: Text('ثبت آدرس', style: buyTS),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField _textField({
    required String re,
    required TextEditingController controller,
    required IconData icon,
    TextInputType type = TextInputType.text,
  }) {
    return TextField(
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: yellow),
        fillColor: red,
        label: Text(re, style: textFieldTS),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      controller: controller,
    );
  }
}
