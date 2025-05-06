import 'package:flutter_application_2/core/constants/storage_key.dart';
import 'package:get_storage/get_storage.dart';

class SlideStorage {
  GetStorage box = GetStorage();
  void isSlideDisplayed() {
    box.write(StorageKey.isSlideDisplayed, true);
  }
}
