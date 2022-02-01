import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myPageProvider = ChangeNotifierProvider<MyPageModel>(
  (ref) => MyPageModel(),
);

class MyPageModel extends ChangeNotifier {
  bool isEditMode = true;
}
