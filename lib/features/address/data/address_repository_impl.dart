import 'package:flutter_application_2/features/address/data/remote/address_service.dart';
import 'package:flutter_application_2/features/address/domain/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  final _service = AddressService();
  @override
  void addAddress({
    required String crecipientname,
    required String cphonenumber,
    required String caddressline,
    required String cpostalcode,
    required String cadditionalnotes,
  }) {
    _service.addAddress(
      crecipientname: crecipientname,
      cphonenumber: cphonenumber,
      caddressline: caddressline,
      cpostalcode: cpostalcode,
      cadditionalnotes: cadditionalnotes,
    );
  }
}
