import 'package:flutter/material.dart';

import '../constants/constant_imports.dart';
import 'size_helper.dart';

class AppHelper {
  static void dismissKeyboard({
    required BuildContext ctx,
  }) {
    final currentFocus = FocusScope.of(ctx);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
