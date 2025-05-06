import 'package:flutter_application_2/core/cart/presentation/bindings/app_bar_binding.dart';
import 'package:flutter_application_2/features/address/presentation/bindings/address_binding.dart';
import 'package:flutter_application_2/features/address/presentation/widgets/address_screen.dart';
import 'package:flutter_application_2/features/basket/presentation/bindings/basket_binding.dart';
import 'package:flutter_application_2/features/basket/presentation/widgets/basket_screen.dart';
import 'package:flutter_application_2/features/googleSignIn/presentation/bindings/google_sign_in_binding.dart';
import 'package:flutter_application_2/features/googleSignIn/presentation/widgets/google_sign_in_screen.dart';
import 'package:flutter_application_2/features/product_details/presentation/bindings/product_details_binding.dart';
import 'package:flutter_application_2/features/product_details/presentation/widgets/product_details_screen.dart';
import 'package:flutter_application_2/features/products/presentation/bindings/product_binding.dart';
import 'package:flutter_application_2/features/products/presentation/widgets/product_screen.dart';
import 'package:flutter_application_2/features/select_pet/presentation/bindings/select_pet_binding.dart';
import 'package:flutter_application_2/features/slide/presentation/bindings/slide_binding.dart';
import 'package:get/get.dart';
import '../../features/select_pet/presentation/select_pet_screen.dart';
import '../../features/slide/presentation/widgets/slide_screen.dart';

class AppRoutes {
  //singeltone
  static final AppRoutes _appRoutes = AppRoutes._internal();
  factory AppRoutes() => _appRoutes;
  AppRoutes._internal();
  String product = '/productScreen';
  String basket = '/basketScreen';
  String googleSignIn = '/googleSignInScreen';
  String address = '/addresssScreen';
  String selectPet = '/selectPetScreen';
  String slide = '/slideScreen';
  String productDetails = '/productDetailsScreen';
  List<GetPage> get pages => [
    GetPage(
      name: product,
      page: () => ProductScreen(),
      bindings: [ProductBinding(), AppBarBinding()],
    ),
    GetPage(
      name: basket,
      page: () => BasketScreen(),
      bindings: [BasketBinding(), AppBarBinding()],
    ),
    GetPage(
      name: googleSignIn,
      page: () => GoogleSignInScreen(),
      binding: GoogleSignInBinding(),
    ),
    GetPage(
      name: address,
      page: () => AddressScreen(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: selectPet,
      page: () => SelectPetScreen(),
      bindings: [SelectPetBinding(), AppBarBinding()],
    ),
    GetPage(name: slide, page: () => SlideScreen(), binding: SlideBinding()),
    GetPage(
      name: productDetails,
      page: () => ProductDetailsScreen(),
      binding: ProductDetailsBinding(),
    ),
  ];
}
