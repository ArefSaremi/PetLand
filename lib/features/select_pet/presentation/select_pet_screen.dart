import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/cart/presentation/widgets/app_bar_widget.dart';
import 'package:flutter_application_2/core/constants/pet_names.dart';
import 'package:flutter_application_2/features/select_pet/presentation/controllers/select_pet_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';

class SelectPetScreen extends GetView<SelectPetController> {
  const SelectPetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: yellow,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            spacing: 6.h,
            children: [
              SizedBox(height: 20.h),
              _searchBox(),
              SizedBox(height: 100.h),
              _selectImage(image: imageCat, title: 'گربه', pet: Animal.cat),
              _selectImage(image: imageDog, title: 'سگ', pet: Animal.dog),
              _selectImage(image: imageBird, title: 'پرنده', pet: Animal.bird),
            ],
          ),
        ),
      ),
    );
  }

  Row _searchBox() {
    return Row(
      children: [
        Expanded(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              height: 44.h,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Container(
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(size: 36.w, Icons.search, color: red),
                    ),
                  ),
                  fillColor: Colors.white,
                  hintText: 'جستجو',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  InkWell _selectImage({
    required Animal pet,
    required String title,
    required String image,
  }) {
    return InkWell(
      onTap: () {
        controller.choosePet(pet);
      },
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                width: double.maxFinite,
                height: 140.h,
                alignment: Alignment(0, -0.2.h),
                fit: BoxFit.cover,
                image,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(120),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
            ),
            width: double.maxFinite,
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
