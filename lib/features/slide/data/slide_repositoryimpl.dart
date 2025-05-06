import 'package:flutter_application_2/features/slide/data/remote/slide_storage.dart';
import 'package:flutter_application_2/features/slide/domain/slide_repository.dart';

class SlideRepositoryimpl implements SlideRepository {
  final _storge = SlideStorage();
  @override
  void isSlideDisplayed() {
    _storge.isSlideDisplayed();
  }
}
