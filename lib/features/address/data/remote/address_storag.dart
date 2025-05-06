import 'package:flutter_application_2/core/constants/storage_key.dart';
import 'package:get_storage/get_storage.dart';

class AddressServiceStorag {
  GetStorage storage = GetStorage();
  int getOrderId() {
    final data = storage.read(StorageKey.orderIdKey);
    return data;
  }
}
