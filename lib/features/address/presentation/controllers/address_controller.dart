import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/address/domain/address_repository.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  AddressRepository repository;
  AddressController({required this.repository});
  final crecipientname = TextEditingController();
  final cphonenumber = TextEditingController();
  final caddressline = TextEditingController();
  final cpostalcode = TextEditingController();
  final cadditionalnotes = TextEditingController();
  void registerAddress() {
    repository.addAddress(
      crecipientname: crecipientname.text,
      cphonenumber: cphonenumber.text,
      caddressline: caddressline.text,
      cpostalcode: cpostalcode.text,
      cadditionalnotes: cadditionalnotes.text,
    );
  }
}
