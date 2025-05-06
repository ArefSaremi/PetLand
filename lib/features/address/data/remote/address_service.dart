import 'package:flutter_application_2/core/constants/supabase_constants.dart';
import 'package:flutter_application_2/features/address/data/remote/address_storag.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddressService extends GetConnect {
  final SupabaseClient _supabase = Supabase.instance.client;
  final _storage = AddressServiceStorag();
  void addAddress({
    required String crecipientname,
    required String cphonenumber,
    required String caddressline,
    required String cpostalcode,
    required String cadditionalnotes,
  }) async {
    await _supabase.from(SupabaseConstants.ordersAddress).insert([
      {
        SupabaseConstants.orderid: _storage.getOrderId(),
        SupabaseConstants.recipientName: crecipientname,
        SupabaseConstants.phoneNumber: cphonenumber,
        SupabaseConstants.addressLine: caddressline,
        SupabaseConstants.postalCode: cpostalcode,
        SupabaseConstants.additionalNotes: cadditionalnotes,
      },
    ]);
  }
}
