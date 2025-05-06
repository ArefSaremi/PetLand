import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

TextStyle infoTS = TextStyle(
  color: black,
  fontSize: 30.sp,
  fontWeight: FontWeight.bold,
);
TextStyle shdowTS = infoTS.copyWith(
  shadows: [Shadow(color: red, offset: Offset(0, 4), blurRadius: 4)],
);
TextStyle showTitleTS = TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp);
TextStyle normalTS = TextStyle(fontSize: 14.sp, color: black.withAlpha(127));
TextStyle buyTS = TextStyle(
  color: yellow,
  fontSize: 16.sp,
  fontWeight: FontWeight.bold,
);
TextStyle priceTS = TextStyle(color: red, fontSize: 14.sp);
TextStyle titleTS = TextStyle(color: red, fontSize: 24.sp);

TextStyle titleDTS = TextStyle(color: black, fontSize: 24.sp);

TextStyle itemCountCartTS = TextStyle(fontSize: 12.sp, color: realWhite);
TextStyle titleSignInTS = TextStyle(color: red, fontSize: 48.sp);
TextStyle signInTS = TextStyle(color: red, fontSize: 24.sp);
TextStyle textFieldTS = TextStyle(color: red, fontSize: 16.sp);
