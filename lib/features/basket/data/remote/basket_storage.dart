import 'package:get_storage/get_storage.dart';

import '../../../../core/constants/storage_key.dart';

class BasketStorage {
  GetStorage storage = GetStorage();
  Map<String, dynamic> getData() {
    final data = storage.read(StorageKey.cartKey);
    if (data != null) {
      return data;
    } else {
      return {};
    }
  }

  void saveOrderId(int orderId) {
    storage.write(StorageKey.orderIdKey, orderId);
  }
}
