import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/routs.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/constants/storage_key.dart';
import 'core/theme/app_theme.dart';

void main() async {
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    bool isSlideDisplayed = true;
    final box = GetStorage();
    if (box.read(StorageKey.isSlideDisplayed) == true) {
      isSlideDisplayed = true;
    } else {
      isSlideDisplayed = false;
    }
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 800),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(1.0)),
            child: child!,
          );
        },
        theme: AppThemes.defaultTheme,
        getPages: AppRoutes().pages,
        initialRoute:
            isSlideDisplayed ? AppRoutes().selectPet : AppRoutes().slide,
      ),
    );
  }
}
